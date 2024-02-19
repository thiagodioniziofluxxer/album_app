import 'dart:io';

import 'package:album_app/app/core/constants/local_storage_keys.dart';
import 'package:album_app/app/core/ui/album_nav_global_key.dart';
import 'package:album_app/app/core/ui/styles/color_app.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AuthInterceptors extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final RequestOptions(:headers, :extra) = options;

    const authHeaderKey = 'Authorization';
    headers.remove(authHeaderKey);
    if (extra case {'DIO_AUTH_KEY': true}) {
      final sp = await SharedPreferences.getInstance();
      headers.addAll({
        authHeaderKey: 'Bearer ${sp.getString(LocalStorageKeys.acessToken)}',
      });
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    final DioException(requestOptions: RequestOptions(:extra), :response) = err;
    if (extra case {'DIO_AUTH_KEY': true}) {
      if (response != null && response.statusCode == HttpStatus.forbidden) {
        final sp = await SharedPreferences.getInstance();
        sp.clear();
        showTopSnackBar(
            Overlay.of(AlbumNavGlobalKey.instance.navigatorKey.currentContext!),
            CustomSnackBar.error(
              message: 'Login Expirado',
              backgroundColor: ColorApp.instance.primary,
            ));
        Navigator.of(AlbumNavGlobalKey.instance.navigatorKey.currentContext!)
            .pushReplacementNamed('/auth/login');
      }
    }
    handler.reject(err);
  }
}
