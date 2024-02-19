import '../../../models/groups_stickers_model.dart';

abstract interface class MyStickersView {
  void loadedPage(List<GroupsStickersModel> albums);
  void error(String message);
  void updateStatusFilter(status);
  void updateAlbum(List<GroupsStickersModel> albums);
}
