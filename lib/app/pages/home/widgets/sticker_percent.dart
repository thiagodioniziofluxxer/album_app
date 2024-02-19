import 'dart:math';

import 'package:album_app/app/core/ui/styles/text_style.dart';
import 'package:flutter/material.dart';

import 'package:album_app/app/core/ui/styles/color_app.dart';

class StickerPercent extends StatelessWidget {
  final int percent;
  const StickerPercent({
    Key? key,
    required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration:
              BoxDecoration(color: context.colors.grey, shape: BoxShape.circle),
          child: Center(
            child: Text(
              '$percent %',
              style: context.textStyles.titlePrimaryColor,
            ),
          ),
        ),
        SizedBox(
          width: 110,
          height: 110,
          child: Transform.rotate(
            angle: -pi / 2,
            child: CircularProgressIndicator(
              value: percent / 100,
              color: Colors.white,
              backgroundColor: Colors.white.withOpacity(0.5),
              strokeWidth: 5,
            ),
          ),
        ),
      ],
    );
  }
}
