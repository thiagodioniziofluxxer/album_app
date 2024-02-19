import 'dart:developer';

import 'package:album_app/app/core/ui/helpers/form_helper.dart';
import 'package:album_app/app/core/ui/styles/color_app.dart';
import 'package:album_app/app/core/ui/styles/text_style.dart';
import 'package:album_app/app/core/ui/widgets/button.dart';
import 'package:album_app/app/pages/auth/register/presenters/register_presenter.dart';
import 'package:album_app/app/pages/auth/register/view/register_view_impl.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  final RegisterPresenter registerPresenter;
  const RegisterPage({super.key, required this.registerPresenter});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends RegisterViewImpl {
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final passwordConfirmationEC = TextEditingController();
  @override
  void initState() {
    nameEC.text = 'Thiago dionizio';
    emailEC.text = 'thiago.o.dionizio@gmail.com';
    passwordEC.text = '12341234';
    passwordConfirmationEC.text = '12341234';

    super.initState();
  }

  @override
  void dispose() {
    nameEC.dispose();
    emailEC.dispose();
    passwordEC.dispose();
    passwordConfirmationEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 106.82,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/bola.png',
                        ),
                        fit: BoxFit.fill)),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Cadastrar Usuário',
                    style: context.textStyles.titleBlack,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: nameEC,
                      validator: Validatorless.required('Nome é obrigatório'),
                      onTapOutside: (_) => context.unfocus(),
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          label: Text('Nome'),
                          hintText: "Digite o nome completo",
                          floatingLabelBehavior: FloatingLabelBehavior.never),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: emailEC,
                      onTapOutside: (_) => context.unfocus(),
                      keyboardType: TextInputType.emailAddress,
                      validator: Validatorless.multiple([
                        Validatorless.required('Email é obrigatório'),
                        Validatorless.email('Email inválido'),
                      ]),
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
                    TextFormField(
                      obscureText: false,
                      controller: passwordConfirmationEC,
                      validator: Validatorless.multiple([
                        Validatorless.required(
                            'Confirmação de senha é obrigatória'),
                        Validatorless.compare(
                          passwordEC,
                          'Senhas não conferem',
                        ),
                      ]),
                      decoration: const InputDecoration(
                          label: Text('Confirma Senha'),
                          hintText: "Digite sua senha",
                          floatingLabelBehavior: FloatingLabelBehavior.never),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Button.primary(
                width: MediaQuery.of(context).size.width * .9,
                label: "Cadastrar",
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
                      widget.registerPresenter.register(
                          name: nameEC.text,
                          email: emailEC.text,
                          password: passwordEC.text,
                          passwordConfirmation: passwordConfirmationEC.text);
                  }
                },
              )
            ]),
          )),
    );
  }
}
