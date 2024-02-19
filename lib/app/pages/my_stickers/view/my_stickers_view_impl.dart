import 'package:album_app/app/core/constants/status_filter_stage.dart';
import 'package:album_app/app/core/ui/helpers/loader.dart';
import 'package:album_app/app/core/ui/helpers/messages.dart';
import 'package:album_app/app/models/groups_stickers_model.dart';
import 'package:album_app/app/pages/my_stickers/my_stickers_page.dart';
import 'package:flutter/widgets.dart';

import './my_stickers_view.dart';

abstract class MyStickersViewImpl extends State<MyStickersPage>
    with Messages<MyStickersPage>, Loader<MyStickersPage>
    implements MyStickersView {
  var albums = <GroupsStickersModel>[];
  var statusFilter = StatusFilterState.all.value;
  var countries = <String, String>{};
  @override
  void initState() {
    widget.presenter.view = this;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showLoader();
      widget.presenter.getMyAlbum();
    });
    super.initState();
  }

  @override
  void error(String message) {
    hideLoader();
    showError(message);
  }

  @override
  void loadedPage(List<GroupsStickersModel> albums) {
    hideLoader();
    setState(() {
      this.albums = albums;
      countries = {for (var c in albums) c.countryCode: c.countryName};
    });
  }

  @override
  void updateStatusFilter(status) {
    setState(() {
      statusFilter = status;
    });
  }

  @override
  void updateAlbum(List<GroupsStickersModel> albums) {
    hideLoader();
    setState(() {
      this.albums = albums;
    });
  }
}
