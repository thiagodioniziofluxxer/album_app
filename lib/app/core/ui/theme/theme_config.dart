import 'package:album_app/app/core/constants/contants.dart';
import 'package:album_app/app/core/ui/styles/color_app.dart';
import 'package:album_app/app/core/ui/styles/text_style.dart';

import 'package:flutter/material.dart';

sealed class ThemeConfig {
  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    fontFamily: Constants.fontFamily,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle: TextStyles.instance.textPrimaryFontBold.copyWith(
        fontSize: 18,
        color: Colors.black,
      ),
    ),
    primaryColor: ColorApp.instance.primary,
    colorScheme: ColorScheme.fromSeed(
        seedColor: ColorApp.instance.primary,
        primary: ColorApp.instance.primary,
        secondary: ColorApp.instance.secondary),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(13),
      labelStyle: TextStyles.instance.labelTextSecondaryFontRegular.copyWith(
        fontSize: 14,
      ),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder
    ),
  );

  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide(
      color: ColorApp.instance.greyDark,
      width: 1,
    ),
  );
}
