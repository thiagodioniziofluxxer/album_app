import 'dart:developer';

import 'package:album_app/app/core/ui/helpers/form_helper.dart';
import 'package:album_app/app/pages/auth/login/view/login_view_impl.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:album_app/app/core/ui/styles/button_style.dart';
import 'package:album_app/app/core/ui/styles/color_app.dart';
import 'package:album_app/app/core/ui/styles/text_style.dart';
import 'package:album_app/app/core/ui/widgets/button.dart';
import 'package:album_app/app/pages/auth/login/presenter/login_presenter.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  final LoginPresenter loginPresenter;
  const LoginPage({
    Key? key,
    required this.loginPresenter,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends LoginViewImpl {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  
  @override
  void initState() {
    emailEC.text = 'thiago.o.dionizio@gmail.com';
    passwordEC.text = '12341234';
    super.initState();
  }

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background_login.png'))),
          child: CustomScrollView(slivers: [
            SliverList(
              delegate: SliverChildListDelegate.fixed([
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      (MediaQuery.of(context).size.width > 250 ? .30 : 0.25),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Login',
                      style: context.textStyles.titleWhite,
                    ),
                  ),
                ),
                TextFormField(
                  controller: emailEC,
                   validator: Validatorless.multiple([
                        Validatorless.required('Email é obrigatório'),
                        Validatorless.email('Email inválido'),
                      ]),
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      label: Text('E-mail'),
                      hintText: "Digite seu email",
                      floatingLabelBehavior: FloatingLabelBehavior.never),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    onTapOutside: (_) => context.unfocus(),
                      controller: passwordEC,
                      obscureText: false,
                   validator: Validatorless.multiple([
                        Validatorless.required('Senha é obrigatória'),
                        Validatorless.min(6, 'Senha muito curta'),
                      ]),
                  decoration: const InputDecoration(
                      label: Text('Senha'),
                      hintText: "Digite sua senha",
                      floatingLabelBehavior: FloatingLabelBehavior.never),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Esqueceu a senha?',
                  style: context.textStyles.textSecondaryFontMedium
                      .copyWith(color: context.colors.yeloow, fontSize: 14),
                ),
                const SizedBox(
                  height: 20,
                ),
                Button(
                  width: MediaQuery.of(context).size.width * .9,
                  style: context.buttonStyles.yellowButton,
                  labelStyle:
                      context.textStyles.textSecondaryExtraBoldPrimaryColor,
                  label: "Entrar",
                  onPressed: () {
                    switch (formKey.currentState?.validate()) {
                      case null || false:
                        log('Existem erros no formulario, favor validar');
                        showError('Existem erros no formulário');
                        showTopSnackBar(
                            Overlay.of(context),
                            CustomSnackBar.error(
                              message: 'Existem erros no formulário',
                              backgroundColor: context.colors.primary,
                            ));
                        break;
                      case true:
                        showLoader();
                        widget.loginPresenter.login(
                          email: emailEC.text,
                          password: passwordEC.text,
                        );
                    }
                  },
                )
              ]),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const Spacer(),
                  Text.rich(
                      TextSpan(text: 'Não possue uma conta? ', children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.of(context)
                                  .pushNamed('/auth/register'),
                            text: "Cadastre-se",
                            style: context.textStyles.textSecondaryFontMedium
                                .copyWith(color: context.colors.yeloow))
                      ]),
                      style: context.textStyles.textSecondaryFontMedium
                          .copyWith(color: Colors.white)),
                  Text.rich(
                      TextSpan(text: 'Versão: ', children: [
                        TextSpan(
                            text: "1.0.0",
                            style: context.textStyles.textSecondaryFontMedium
                                .copyWith(
                                    color: context.colors.grey, fontSize: 10))
                      ]),
                      style: context.textStyles.textSecondaryFontMedium
                          .copyWith(color: Colors.white, fontSize: 10))
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
