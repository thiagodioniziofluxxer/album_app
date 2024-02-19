import 'package:album_app/app/pages/auth/login/login_page.dart';
import 'package:album_app/app/pages/auth/login/presenter/login_presenter.dart';
import 'package:album_app/app/pages/auth/login/presenter/login_presenter_impl.dart';
import 'package:album_app/app/services/login/login_service.dart';
import 'package:album_app/app/services/login/login_service_impl.dart';
import 'package:flutter/material.dart';

import 'package:flutter_getit/flutter_getit.dart';

class LoginRoute extends FlutterGetItPageRouter {
  const LoginRoute({super.key});

  @override
  List<Bind<Object>> get bindings {
    return [
      Bind.lazySingleton<LoginService>(
          (i) => LoginServiceImpl(authRepository: i())),
      Bind.lazySingleton<LoginPresenter>(
          (i) => LoginPresenterImpl(loginService: i())),
    ];
  }

  @override
  String get routeName => '/auth/login';

  @override
  WidgetBuilder get view => (context) => LoginPage(
        loginPresenter: context.get(),
      );
}
