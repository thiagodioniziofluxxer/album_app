import 'package:album_app/app/core/constants/status_filter_stage.dart';
import 'package:album_app/app/models/groups_stickers_model.dart';
import 'package:album_app/app/pages/my_stickers/view/my_stickers_view.dart';
import 'package:album_app/app/repository/stickers/stickers_repository.dart';

import './my_stickers_presenter.dart';

class MyStickersPresenterImpl implements MyStickersPresenter {
  final StickersRepository repository;
  late final MyStickersView _view;
  MyStickersPresenterImpl({required this.repository});
  var albums = <GroupsStickersModel>[];
  var statusSelected = StatusFilterState.all.value;
  List<String>? countries;
  @override
  Future<void> getMyAlbum() async {
    albums = await repository.getMyAlbum();
    _view.loadedPage([...albums]);
  }

  @override
  set view(MyStickersView view) => _view = view;

  @override
  Future<void> statusFilter(String status) async {
    statusSelected = status;
    _view.updateStatusFilter(status);
  }

  @override
  void countryFilter(List<String>? countries) {
    this.countries = countries;
    if (countries == null) {
      //atualizar todos os grupos
      _view.updateAlbum(albums);
    } else {
      //filtrar
      final albumFilter = [
        ...albums.where((element) => countries.contains(element.countryCode))
      ];

      _view.updateAlbum(albumFilter);
    }
  }
}
