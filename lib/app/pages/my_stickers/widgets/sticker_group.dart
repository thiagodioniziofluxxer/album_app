import 'package:album_app/app/core/constants/status_filter_stage.dart';
import 'package:flutter/material.dart';

import 'package:album_app/app/core/ui/styles/color_app.dart';
import 'package:album_app/app/core/ui/styles/text_style.dart';
import 'package:album_app/app/models/groups_stickers_model.dart';
import 'package:album_app/app/models/user_stickers_model.dart';

class StickerGroup extends StatelessWidget {
  final GroupsStickersModel group;
  final String statusFilter;
  const StickerGroup({
    super.key,
    required this.group,
    required this.statusFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 64,
              child: OverflowBox(
                maxWidth: double.infinity,
                maxHeight: double.infinity,
                child: ClipRect(
                  child: Align(
                    alignment: const Alignment(0, -.1),
                    widthFactor: 1,
                    heightFactor: .18,
                    child: Image.network(
                      group.flag,
                      cacheWidth:
                          (MediaQuery.of(context).size.width * 2).toInt(),
                    ),
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              group.countryName,
              style: context.textStyles.titleBlack.copyWith(fontSize: 26),
            ),
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10),
            itemBuilder: (context, index) {
              final stickerNumber = '${group.stickersStart + index}';
              final stickerList = group.stickers
                  .where((element) => element.stickerNumber == stickerNumber);
              final sticker = stickerList.isNotEmpty ? stickerList.first : null;

              final stickerWidget = Sticker(
                  stickerNumber: stickerNumber,
                  sticker: sticker,
                  countryName: group.countryName,
                  countrycode: group.countryCode);
              if (statusFilter == StatusFilterState.all.value) {
                return stickerWidget;
              } else if (statusFilter == StatusFilterState.missing.value) {
                if (sticker == null) {
                  return stickerWidget;
                }
              } else if (statusFilter == StatusFilterState.missing.value) {
                if (sticker != null && sticker.duplicate > 0) {
                  return stickerWidget;
                }
              }
              return const SizedBox.shrink();
            },
          )
        ],
      ),
    );
  }
}

class Sticker extends StatelessWidget {
  final String stickerNumber;
  final UserStickersModel? sticker;
  final String countryName;
  final String countrycode;

  const Sticker({
    super.key,
    required this.stickerNumber,
    required this.sticker,
    required this.countryName,
    required this.countrycode,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('/sticker_detail', arguments: []);
        },
        child: Container(
            color:
                sticker != null ? context.colors.primary : context.colors.grey,
            child: Column(
              children: [
                Visibility(
                  visible: (sticker?.duplicate ?? 0) > 0,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: Container(
                    alignment: Alignment.topRight,
                    padding: const EdgeInsets.all(2),
                    child: Text(
                      sticker?.duplicate.toString() ?? '',
                      style: context.textStyles.textSecondaryFontMedium
                          .copyWith(color: context.colors.yeloow),
                    ),
                  ),
                ),
                Text(
                  countrycode,
                  style: context.textStyles.textSecondaryFontExtraBold.copyWith(
                      color: sticker != null ? Colors.white : Colors.black),
                ),
                Text(
                  stickerNumber,
                  style: context.textStyles.textSecondaryFontExtraBold.copyWith(
                      color: sticker != null ? Colors.white : Colors.black),
                ),
              ],
            )));
  }
}
