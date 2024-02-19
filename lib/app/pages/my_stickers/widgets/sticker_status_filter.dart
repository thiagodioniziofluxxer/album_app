import 'package:album_app/app/core/ui/styles/button_style.dart';
import 'package:album_app/app/core/ui/styles/color_app.dart';
import 'package:album_app/app/core/ui/styles/text_style.dart';
import 'package:album_app/app/core/ui/widgets/button.dart';
import 'package:album_app/app/pages/my_stickers/presenter/my_stickers_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import '../../../core/constants/status_filter_stage.dart';



class StickerStatusFilter extends StatelessWidget {
  final String filterSelected;
  const StickerStatusFilter({
    super.key,
    required this.filterSelected,
  });

  @override
  Widget build(BuildContext context) {
    final presenter = context.get<MyStickersPresenter>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 5,
        children: [
         
          Button(
              width: MediaQuery.of(context).size.width * 0.3,
              onPressed: () {
                presenter.statusFilter(StatusFilterState.all.value);
              },
              style: filterSelected == StatusFilterState.all.value
                  ? context.buttonStyles.yellowButton
                  : context.buttonStyles.primaryButton,
              labelStyle: filterSelected == StatusFilterState.all.value
                  ? context.textStyles.textSecondaryFontMedium
                      .copyWith(color: context.colors.primary)
                  : context.textStyles.textSecondaryFontMedium
                      .copyWith(color: Colors.white),
              label: 'Todas'),
          Button(
              width: MediaQuery.of(context).size.width * 0.3,
              onPressed: () {
                presenter.statusFilter(StatusFilterState.missing.value);
              },
              style: filterSelected == StatusFilterState.missing.value
                  ? context.buttonStyles.yellowButton
                  : context.buttonStyles.primaryButton,
              labelStyle: filterSelected == StatusFilterState.missing.value
                  ? context.textStyles.textSecondaryFontMedium
                      .copyWith(color: context.colors.primary)
                  : context.textStyles.textSecondaryFontMedium
                      .copyWith(color: Colors.white),
              label: 'Faltando'),
          Button(
              width: MediaQuery.of(context).size.width * 0.3,
              onPressed: () {
                presenter.statusFilter(StatusFilterState.repeated.value);
              },
              style: filterSelected == StatusFilterState.repeated.value
                  ? context.buttonStyles.yellowButton
                  : context.buttonStyles.primaryButton,
              labelStyle:
                  filterSelected == StatusFilterState.repeated.value
                      ? context.textStyles.textSecondaryFontMedium
                          .copyWith(color: context.colors.primary)
                      : context.textStyles.textSecondaryFontMedium
                          .copyWith(color: Colors.white),
              label: 'Repetidas')
        ],
      ),
    );
  }
}
