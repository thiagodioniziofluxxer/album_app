
import 'package:album_app/app/core/rest/interceptors/auth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class CustomDio extends DioForNative {
  CustomDio()
      : super(BaseOptions(
          baseUrl: 'https://stingray-app-qn7mo.ondigitalocean.app',
          connectTimeout: const Duration(seconds: 60),
          receiveTimeout: const Duration(seconds: 60),
        )) {
    interceptors.addAll([
     
      AuthInterceptors(),
       LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    ]);
  }

  CustomDio auth() {
    options.extra['DIO_AUTH_KEY'] = true;
    return this;
  }

  CustomDio unAuth() {
    options.extra['DIO_AUTH_KEY'] = false;
    return this;
  }
}
