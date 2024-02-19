import 'dart:developer';
import 'dart:io';

import 'package:album_app/app/core/rest/custom_dio.dart';
import 'package:album_app/app/exceptions/repository_exception.dart';
import 'package:album_app/app/exceptions/unauthorized_exception.dart';
import 'package:album_app/app/models/register_user_model.dart';
import 'package:album_app/app/repository/auth/auth_repository.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio customDio;

  AuthRepositoryImpl({required this.customDio});
  @override
  Future<void> register(RegisterUserModel registerUserModel) async {
    try {
      await customDio
          .unAuth()
          .post('/api/register', data: registerUserModel.toMap());
    } on DioException catch (e, s) {
      log('Erro ao realizar login', error: e, stackTrace: s);
      throw RepositoryException(message: "Erro ao regisrar usuário");
    }
  }

  @override
  Future<String> login(
      {required String email, required String password}) async {
    try {
      final Response(:data) = await customDio
          .unAuth()
          .post('/api/auth', data: {"email": email, "password": password});
      if (data['access_token'] == null) {
        throw UnauthorizedException(message: "Erro ao Realizar o loigin");
      }

      return data['access_token'];
    } on DioException catch (e, s) {
      log('Erro ao realizar login', error: e, stackTrace: s);
      if (e.response != null) {
        if (e.response!.statusCode == HttpStatus.unauthorized) {
          throw UnauthorizedException(message: e.response!.data);
        }
      }
      throw RepositoryException(message: "Erro ao realizar o login");
    }
  }

  @override
  Future<void> loggout() async {}
}
