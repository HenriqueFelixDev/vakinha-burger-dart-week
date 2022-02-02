import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

import 'login_controller.dart';
import '../../../core/theme/app_theme/app_theme_interface.dart';
import '../../../core/ui/vakinha_state.dart';
import '../../../core/constants/app_routes.dart';
import '../../../widgets/app_bar/app_bar_widget.dart';
import '../../../widgets/app_button/app_button_widget.dart';
import '../../../widgets/text_field/text_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends VakinhaState<LoginPage, LoginController> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _login() {
    _formKey.currentState!.save();
    controller.login(
      email: _emailController.text,
      password: _passwordController.text
    );
  }

  @override
  Widget build(BuildContext context) {
    final divider = SizedBox(height: context.widthTransformer(reducedBy: 90.0));
    final appTheme = Get.find<AppThemeInterface>();

    return Scaffold(
      appBar: AppBarWidget(),
      backgroundColor: appTheme.colors.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: () {
            controller.formValid(_formKey.currentState!.validate());
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Login', style: appTheme.textStyles.heading2),
                  
                  divider,

                  TextFieldWidget(
                    label: 'E-mail',
                    controller: _emailController,
                    validator: Validatorless.multiple([
                      Validatorless.required('O e-mail é obrigatório'),
                      Validatorless.email('O e-mail informado é inválido')
                    ])
                  ),

                  divider,

                  TextFieldWidget(
                    label: 'Senha',
                    obscureText: true,
                    controller: _passwordController,
                    validator: Validatorless.multiple([
                      Validatorless.required('A senha é obrigatória'),
                      Validatorless.between(6, 32, 'A senha deve ter entre 6 e 32 caracteres')
                    ]),
                  ),

                  divider,
                  
                  Obx(() =>
                    AppButtonWidget(
                      child: const Text('Entrar'),
                      onPressed: controller.formValid.isTrue
                        ? _login
                        : null
                    )
                  )
                ]
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Não possui uma conta?'),
                  TextButton(
                    child: Text('Cadastre-se', style: appTheme.textStyles.textBold),
                    onPressed: () => Get.offAndToNamed(AppRoutes.signUp)
                  )
                ]
              )
            ]
          )
        ),
      )
    );
  }
}