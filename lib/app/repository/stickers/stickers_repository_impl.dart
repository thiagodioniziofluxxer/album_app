import 'dart:developer';
import 'dart:io';

import 'package:album_app/app/core/rest/custom_dio.dart';
import 'package:album_app/app/exceptions/repository_exception.dart';
import 'package:album_app/app/models/groups_stickers_model.dart';
import 'package:album_app/app/models/register_sticker_model.dart';
import 'package:album_app/app/models/sticker_model.dart';
import 'package:dio/dio.dart';

import './stickers_repository.dart';

class StickersRepositoryImpl implements StickersRepository {
  CustomDio dio;
  StickersRepositoryImpl({
    required this.dio,
  });
  @override
  Future<List<GroupsStickersModel>> getMyAlbum() async {
    try {
      final Response(:List data) = await dio.auth().get('/api/countries');
      return data.map((s) => GroupsStickersModel.fromMap(s)).toList();
    } on DioException catch (e, s) {
      log('Erro ao buscar figurinhas', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar figurinhas');
    } on ArgumentError catch (e, s) {
      log('Erro ao converter figurinhas', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao converter figurinhas');
    }
  }

  @override
  Future<StickerModel?> findStickerByCode(
      String stickerCode, String stickerNumber) async {
    try {
      final Response(:data) = await dio.auth().get('/api/sticker-search',
          queryParameters: {
            "sticker_code": stickerCode,
            "sticker_number": stickerNumber
          });
      return StickerModel.fromMap(data);
    } on DioException catch (e, s) {
      if (e.response?.statusCode == HttpStatus.notFound) {
        return null;
      }
      log('Erro ao buscar figurinhas', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar figurinhas');
    } on ArgumentError catch (e, s) {
      log('Erro ao converter figurinhas', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao converter figurinhas');
    }
  }

  @override
  Future<StickerModel> create(RegisterStickerModel registerStickerModel) async {
    try {
      final body = FormData.fromMap({
        ...registerStickerModel.toMap(),
      });

      final Response(:data) = await dio.auth().post(
            '/api/sticker',
            data: body,
          );
      return StickerModel.fromMap(data);
    } on DioException catch (e, s) {
      log('Erro ao registrar figurinhas', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao registrar figurinhas');
    } on ArgumentError catch (e, s) {
      log('Erro ao converter figurinhas', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao converter figurinhas');
    }
  }
}
