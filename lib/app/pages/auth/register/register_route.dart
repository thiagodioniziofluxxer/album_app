import 'package:album_app/app/pages/auth/register/presenters/register_presenter.dart';
import 'package:album_app/app/pages/auth/register/presenters/register_presenter_impl.dart';
import 'package:album_app/app/pages/auth/register/register_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_getit/flutter_getit.dart';

class RegisterRoute extends FlutterGetItPageRouter {
  const RegisterRoute({super.key});

  @override
  List<Bind<Object>> get bindings {
    return [
      Bind.lazySingleton<RegisterPresenter>(
          (i) => RegisterPresenterImpl(authRepository: i())),
    ];
  }

  @override
  String get routeName => '/auth/register';

  @override
  WidgetBuilder get view => (context) => RegisterPage(
        registerPresenter: context.get(),
      );
}
