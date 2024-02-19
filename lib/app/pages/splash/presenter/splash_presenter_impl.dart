import 'package:album_app/app/core/constants/local_storage_keys.dart';
import 'package:album_app/app/pages/splash/presenter/splash_presenter.dart';
import 'package:album_app/app/pages/splash/view/splash_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPresenterImpl implements SplashPresenter {
  late final SplashView _view;
  @override
  Future<void> checkLogged() async {
    _view.showLoader();
    final sp = await SharedPreferences.getInstance();

    _view.logged(sp.containsKey(LocalStorageKeys.acessToken) &&
        sp.getString(LocalStorageKeys.acessToken) != null);
  }

  @override
  set view(view) => _view = view;
}
