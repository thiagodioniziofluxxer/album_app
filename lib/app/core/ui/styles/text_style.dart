import 'package:album_app/app/core/ui/styles/color_app.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static TextStyles? _instance;
  // Avoid self instance
  TextStyles._();
  static TextStyles get instance => _instance ??= TextStyles._();

  String get primaryFont => 'Poppins';
  String get secondaryFont => 'MPlus1P';
  TextStyle get textPrimaryFontRegular => TextStyle(
        fontWeight: FontWeight.normal,
        fontFamily: primaryFont,
      );
  TextStyle get textPrimaryFontMedium => TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: primaryFont,
      );
  TextStyle get textPrimaryFontSemiBold => TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: primaryFont,
      );
  TextStyle get textPrimaryFontBold => TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: primaryFont,
      );
  TextStyle get textPrimaryFontExtraBold => TextStyle(
        fontWeight: FontWeight.w800,
        fontFamily: primaryFont,
      );

  TextStyle get textSecondaryFontRegular => TextStyle(
        fontWeight: FontWeight.normal,
        fontFamily: secondaryFont,
      );
  TextStyle get textSecondaryFontMedium => TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: secondaryFont,
      );

  TextStyle get textSecondaryFontBold => TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: secondaryFont,
      );
  TextStyle get textSecondaryFontExtraBold => TextStyle(
        fontWeight: FontWeight.w800,
        fontFamily: secondaryFont,
      );
  TextStyle get labelTextSecondaryFontRegular =>
      textSecondaryFontRegular.copyWith(
        color: ColorApp.instance.greyDark,
      );
  TextStyle get textSecondaryExtraBoldPrimaryColor =>
      textSecondaryFontExtraBold.copyWith(color: ColorApp.instance.primary);

  TextStyle get titleWhite =>
      textPrimaryFontBold.copyWith(color: Colors.white, fontSize: 22);

  TextStyle get titleBlack =>
      textPrimaryFontBold.copyWith(color: Colors.black, fontSize: 22);

  TextStyle get titlePrimaryColor => textPrimaryFontBold.copyWith(
      color: ColorApp.instance.primary, fontSize: 22);
}

extension TextStylesExtensions on BuildContext {
  TextStyles get textStyles => TextStyles.instance;
}
