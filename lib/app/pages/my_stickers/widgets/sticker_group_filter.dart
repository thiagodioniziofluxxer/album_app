import 'package:flutter/material.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'package:album_app/app/core/ui/styles/text_style.dart';
import 'package:album_app/app/pages/my_stickers/presenter/my_stickers_presenter.dart';

class StickerGroupFilter extends StatefulWidget {
  final Map<String, String> countries;
  const StickerGroupFilter({
    super.key,
    required this.countries,
  });

  @override
  State<StickerGroupFilter> createState() => _StickerGroupFilterState();
}

class _StickerGroupFilterState extends State<StickerGroupFilter> {
  @override
  Widget build(BuildContext context) {
    List<String>? selected;
    print(selected);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SmartSelect<String>.multiple(
        title: 'Filtro',
        tileBuilder: (context, state) {
          return InkWell(
              onTap: state.showModal,
              child: _StrickerGroupTile(
                  clearCallback: () {
                    setState(() {
                      selected = null;
                      context
                          .get<MyStickersPresenter>()
                          .countryFilter(selected);
                    });
                  },
                  label: state.selected.title?.join(', ') ?? 'Filtro'));
        },
        selectedValue: selected ?? [],
        onChange: (selectedValue) {
          setState(() {
            selected = selectedValue.value;
          });
          context.get<MyStickersPresenter>().countryFilter(selected);
        },
        choiceItems: S2Choice.listFrom(
            source: widget.countries.entries
                .map((e) => {"value": e.key, "title": e.value})
                .toList(),
            value: (_, item) => item['value'] ?? '',
            title: (_, item) => item['title'] ?? ''),
        choiceType: S2ChoiceType.switches,
        modalType: S2ModalType.bottomSheet,
        choiceGrouped: true,
        modalFilter: false,
        placeholder: '',
      ),
    );
  }
}

class _StrickerGroupTile extends StatelessWidget {
  final String label;
  final VoidCallback clearCallback;
  const _StrickerGroupTile({
    required this.label,
    required this.clearCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: const Color(0XFFF0F0F0),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(Icons.filter_list),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(
                  label,
                  style: context.textStyles.textSecondaryFontRegular
                      .copyWith(fontSize: 11),
                ),
              ),
              InkWell(
                onTap: clearCallback,
                child: const Icon(Icons.clear),
              )
            ],
          ),
        ));
  }
}
