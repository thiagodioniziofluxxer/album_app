import 'package:album_app/app/core/mvp/fwc_presenter.dart';
import 'package:album_app/app/pages/my_stickers/view/my_stickers_view.dart';

abstract interface class MyStickersPresenter extends FwcPresenter<MyStickersView> {
  Future<void> getMyAlbum();
  Future<void> statusFilter(String status);
  void countryFilter(List<String>? countries);
}