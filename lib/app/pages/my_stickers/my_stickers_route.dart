import 'package:album_app/app/pages/my_stickers/my_stickers_page.dart';
import 'package:album_app/app/pages/my_stickers/presenter/my_stickers_presenter.dart';
import 'package:album_app/app/pages/my_stickers/presenter/my_stickers_presenter_impl.dart';
import 'package:album_app/app/repository/stickers/stickers_repository.dart';
import 'package:album_app/app/repository/stickers/stickers_repository_impl.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';

class MyStickersRoute extends FlutterGetItPageRouter {
  const MyStickersRoute({super.key});
  @override
  List<Bind<Object>> get bindings {
    return [
      Bind.lazySingleton<StickersRepository>((i) => StickersRepositoryImpl(dio:i())),
      Bind.lazySingleton<MyStickersPresenter>((i) => MyStickersPresenterImpl(repository: i())),
    ];
  }

  @override
  String get routeName => '/my-stickers';

  @override
  WidgetBuilder get view => (context) => MyStickersPage(presenter: context.get() ,);
}
