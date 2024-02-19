import 'package:album_app/app/core/rest/custom_dio.dart';
import 'package:album_app/app/core/ui/album_nav_global_key.dart';
import 'package:album_app/app/core/ui/theme/theme_config.dart';
import 'package:album_app/app/pages/auth/login/login_route.dart';
import 'package:album_app/app/pages/auth/register/register_route.dart';
import 'package:album_app/app/pages/home/home_route.dart';
import 'package:album_app/app/pages/my_stickers/my_stickers_route.dart';

import 'package:album_app/app/pages/splash/splash_route.dart';
import 'package:album_app/app/repository/auth/auth_repository.dart';
import 'package:album_app/app/repository/auth/auth_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'pages/sticker_detail/sticker_detail_route.dart';

class AlbumApp extends StatelessWidget {
  const AlbumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
      bindingsBuilder: () {
        return [
          Bind.lazySingleton<CustomDio>((i) => CustomDio()),
          Bind.lazySingleton<AuthRepository>(
              (i) => AuthRepositoryImpl(customDio: i())),
        ];
      },
      pages: const [
        // Adicione aqui a instancia da sua rota.
        LoginRoute(),
        RegisterRoute(),
        SplashRoute(),
        HomeRoute(),
        MyStickersRoute(),
        StickerDetailRoute(),
      ],
      builder: (context, routes, flutterGetItNavObserver) {
        return MaterialApp(
          title: 'Album Demo',
          navigatorKey: AlbumNavGlobalKey.instance.navigatorKey,
          debugShowCheckedModeBanner: false,
          navigatorObservers: [flutterGetItNavObserver],
          theme: ThemeConfig.themeData,
          routes: routes,
        );
      },
    );
  }
}
