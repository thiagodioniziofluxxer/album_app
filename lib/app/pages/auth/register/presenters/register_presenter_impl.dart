import 'dart:developer';

import 'package:album_app/app/models/register_user_model.dart';
import 'package:album_app/app/pages/auth/register/presenters/register_presenter.dart';
import 'package:album_app/app/pages/auth/register/view/register_view.dart';
import 'package:album_app/app/repository/auth/auth_repository.dart';

class RegisterPresenterImpl implements RegisterPresenter {
  final AuthRepository authRepository;
  late final RegisterView _view;
  RegisterPresenterImpl({
    required this.authRepository,
  });
  @override
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final RegisterUserModel registerUserModel = RegisterUserModel(
          name: name,
          email: email,
          password: password,
          passwordConfirmation: passwordConfirmation);
      await authRepository.register(registerUserModel);
      _view.registerSuccess();


    } catch (e, s) {
      log('Erro ao cadastrar usuário,', error: e, stackTrace: s);
      _view.registerError();
    }
  }

  @override
  set view(RegisterView view) => _view = view;
}
