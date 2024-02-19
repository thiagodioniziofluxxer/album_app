import 'dart:developer';

import 'package:album_app/app/core/rest/custom_dio.dart';
import 'package:album_app/app/exceptions/repository_exception.dart';
import 'package:album_app/app/models/user_model.dart';
import 'package:dio/dio.dart';

import './user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final CustomDio dio;
  UserRepositoryImpl({
    required this.dio,
  });

  @override
  Future<UserModel> me() async {
    try {
      final Response(:data) = await dio.auth().get('/api/me');
      return UserModel.fromMap(data);
    } on DioException catch (e, s) {
      log(' Erro ao buscar usuário logado', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar usuário logado');
    } on ArgumentError catch (e, s) {
      log('Erro json error', error: e, stackTrace: s);
      throw RepositoryException(message: e.message);
    }
  }
}
