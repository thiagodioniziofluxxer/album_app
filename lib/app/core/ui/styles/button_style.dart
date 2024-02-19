
import 'package:album_app/app/core/ui/styles/color_app.dart';
import 'package:album_app/app/core/ui/styles/text_style.dart';
import 'package:flutter/material.dart';

class ButtonStyles {
  static ButtonStyles? _instance;
  // Avoid self instance
  ButtonStyles._();
  static ButtonStyles get instance => _instance ??= ButtonStyles._();

  ButtonStyle get yellowButton => ElevatedButton.styleFrom(
        backgroundColor: ColorApp.instance.yeloow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        textStyle: TextStyles.instance.textSecondaryFontExtraBold.copyWith(
          fontSize: 14,
        ),
      );
  ButtonStyle get yellowOutlineButton => OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        side: BorderSide(
          color: ColorApp.instance.yeloow,
        ),
        textStyle: TextStyles.instance.textSecondaryFontExtraBold.copyWith(
          fontSize: 14,
        ),
      );
  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
        backgroundColor: ColorApp.instance.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        textStyle: TextStyles.instance.textSecondaryFontExtraBold.copyWith(
          color: Colors.white,
          fontSize: 14,
        ),
      );
  ButtonStyle get primaryOutlineButton => OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        side: BorderSide(
          color: ColorApp.instance.primary,
        ),
        textStyle: TextStyles.instance.textSecondaryFontExtraBold.copyWith(
          fontSize: 14,
        ),
      );
}
extension ButtonStylesExtensions on BuildContext {
  ButtonStyles get buttonStyles => ButtonStyles.instance;
}
