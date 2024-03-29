import 'package:album_app/app/pages/home/home_page.dart';
import 'package:album_app/app/pages/home/presenter/home_presenter.dart';
import 'package:album_app/app/pages/home/presenter/home_presenter_impl.dart';
import 'package:album_app/app/repository/user/user_repository.dart';
import 'package:album_app/app/repository/user/user_repository_impl.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';

class HomeRoute extends FlutterGetItPageRouter {
  const HomeRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [

        Bind.lazySingleton<UserRepository>((i) => UserRepositoryImpl(dio: i())),
        Bind.lazySingleton<HomePresenter>((i) => HomePresenterImpl(userRepository: i())),
      ];

  @override
  String get routeName => '/home';

  @override
  WidgetBuilder get view => (context) =>  HomePage(presenter: context.get(),);
}
