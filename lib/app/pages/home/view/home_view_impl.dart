import 'package:album_app/app/core/ui/helpers/loader.dart';
import 'package:album_app/app/core/ui/helpers/messages.dart';
import 'package:album_app/app/models/user_model.dart';
import 'package:album_app/app/pages/home/home_page.dart';
import 'package:flutter/material.dart';

import './home_view.dart';

abstract class HomeViewImpl extends State<HomePage>
    with Loader<HomePage>, Messages<HomePage>
    implements HomeView {
  UserModel? user;
  @override
  void initState() {
    widget.presenter.view = this;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.presenter.getData();
    });
    super.initState();
  }

  @override
  void error(String message) {
    hideLoader();
    showError(message);
  }

  @override
  void getData() {}

  @override
  void logout() {
    hideLoader();
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/auth/login', (route) => false);
  }

  @override
  void updateUser(UserModel user) {
    setState(() {
      this.user = user;
      hideLoader();
    });
  }
}
