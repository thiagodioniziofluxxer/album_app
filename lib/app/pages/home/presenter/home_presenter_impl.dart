import 'dart:developer';

import 'package:album_app/app/pages/home/view/home_view.dart';
import 'package:album_app/app/repository/user/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './home_presenter.dart';

class HomePresenterImpl implements HomePresenter {
  late final HomeView _view;
  final UserRepository userRepository;

  HomePresenterImpl({required this.userRepository});
  @override
  Future<void> getData() async {
    try {
      _view.showLoader();
      final user = await userRepository.me();
      _view.updateUser(user);
    } on Exception catch (e) {
      log('Erro ao buscar dados do usuário', error: e);
      _view.error('Erro ao buscar dados do usuário');
    }
  }

  @override
  Future<void> logout() async {
    _view.showLoader();
    final sp = await SharedPreferences.getInstance();
    sp.clear();
    _view.logout();
  }

  @override
  set view(HomeView view) => _view = view;
}
