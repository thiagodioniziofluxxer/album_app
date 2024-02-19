import 'package:album_app/app/models/groups_stickers_model.dart';
import 'package:album_app/app/models/register_sticker_model.dart';

import '../../models/sticker_model.dart';

abstract interface class StickersRepository {
Future<List<GroupsStickersModel>> getMyAlbum();
Future<StickerModel?> findStickerByCode(String stickerCode, String stickerNumber);
Future<StickerModel> create(RegisterStickerModel registerStickerModel);


}