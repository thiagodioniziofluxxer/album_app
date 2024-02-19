import 'package:album_app/app/pages/splash/presenter/splash_presenter.dart';
import 'package:album_app/app/pages/splash/presenter/splash_presenter_impl.dart';
import 'package:album_app/app/pages/splash/splash_page.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';

class SplashRoute extends FlutterGetItPageRouter {
  const SplashRoute({super.key});

  @override
  List<Bind<Object>> get bindings {
    return [
      Bind.lazySingleton<SplashPresenter>((i) => SplashPresenterImpl()),
    ];
  }

  @override
  String get routeName => '/';

  @override
  WidgetBuilder get view => (context) => SplashPage(presenter: context.get());
}
