import 'package:album_app/app/core/ui/styles/color_app.dart';
import 'package:flutter/material.dart';

import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

mixin Messages<T extends StatefulWidget> on State<T> {
  void showError(String message) {
    showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: message,
          backgroundColor: context.colors.primary,
        ));
  }

  void showInfo(String message) {
    showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.info(
          message: message,
          backgroundColor: context.colors.secondary,
        ));
  }

  void showSuccess(String message) {
    showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.success(
          message: message,
          backgroundColor: context.colors.yeloow,
        ));
  }
}
