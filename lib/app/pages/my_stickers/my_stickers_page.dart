import 'package:flutter/material.dart';

import 'package:album_app/app/pages/my_stickers/presenter/my_stickers_presenter.dart';

import 'view/my_stickers_view_impl.dart';
import 'widgets/sticker_group.dart';
import 'widgets/sticker_group_filter.dart';
import 'widgets/sticker_status_filter.dart';

class MyStickersPage extends StatefulWidget {
  final MyStickersPresenter presenter;
  const MyStickersPage({
    super.key,
    required this.presenter,
  });

  @override
  State<MyStickersPage> createState() => _MyStickerPageState();
}

class _MyStickerPageState extends MyStickersViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Figurinhas'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(children: [
              StickerStatusFilter(
                filterSelected: statusFilter,
              ),
              StickerGroupFilter(countries: countries),
            ]),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => StickerGroup(
                        group: albums[index],
                        statusFilter: statusFilter,
                      ),
                  childCount: albums.length)),
        ],
      ),
    );
  }
}
