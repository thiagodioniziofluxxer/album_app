import 'package:album_app/app/core/ui/helpers/loader.dart';
import 'package:album_app/app/core/ui/helpers/messages.dart';
import 'package:album_app/app/pages/splash/splash_page.dart';
import 'package:album_app/app/pages/splash/view/splash_view.dart';
import 'package:flutter/material.dart';

abstract class SplashViewImpl extends State<SplashPage>
    with Loader<SplashPage>, Messages<SplashPage>
    implements SplashView {
  @override
  void initState() {
    widget.presenter.view = this;

    super.initState();
  }

  @override
  void logged(bool islogged) {
    hideLoader();
    if (islogged) {
      Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/auth/login', (route) => false);
    }
  }
}
