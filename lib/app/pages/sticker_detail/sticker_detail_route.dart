
import 'package:album_app/app/pages/sticker_detail/services/sticker_detail_service.dart';
import 'package:album_app/app/pages/sticker_detail/services/sticker_detail_service_impl.dart';
import 'package:album_app/app/pages/sticker_detail/sticker_detail_page.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'presenter/sticker_detail_presenter.dart';
import 'presenter/sticker_detail_presenter_impl.dart';

class StickerDetailRoute extends FlutterGetItPageRouter {
  const StickerDetailRoute({super.key});

  @override
  List<Bind<Object>> get bindings {
    return [
      Bind.lazySingleton<StickerDetailService>((i) => StickerDetailServiceImpl()),
      Bind.lazySingleton<StickerDetailPresenter>((i) => StickerDetailPresenterImpl()),
    ];
  }

  @override
  String get routeName => '/sticker_detail';

  @override
  WidgetBuilder get view => (context) => StickerDetailPage(presenter: context.get());
}
