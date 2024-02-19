import 'package:album_app/app/core/ui/helpers/messages.dart';
import 'package:album_app/app/pages/auth/register/register_page.dart';
import 'package:album_app/app/pages/auth/register/view/register_view.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/ui/helpers/loader.dart';

abstract class RegisterViewImpl extends State<RegisterPage>
    with Loader<RegisterPage>, Messages<RegisterPage>
    implements RegisterView {
  @override
  void initState() {
    widget.registerPresenter.view = this;
    
    super.initState();
  }

  @override
  void registerError({String? message}) {
    hideLoader();
    showError(message ?? 'Erro ao cadastrar usuário');
  }

  @override
  void registerSuccess() {
    hideLoader();
    showSuccess('Usuário cadastrado com sucesso');
    Navigator.of(context).pop();
  }
}
