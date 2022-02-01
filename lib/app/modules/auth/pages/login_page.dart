import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/app_bar/app_bar_widget.dart';
import '../../../widgets/app_button/app_button_widget.dart';
import '../../../widgets/text_field/text_field_widget.dart';
import '../../../core/constants/app_routes.dart';
import '../../../core/extensions/app_theme_extension.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final divider = SizedBox(height: context.widthTransformer(reducedBy: 90.0));

    return Scaffold(
      appBar: AppBarWidget(),
      backgroundColor: context.appColors.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Login', style: context.appTextStyles.heading2),
                  
                  divider,

                  const TextFieldWidget(
                    label: 'E-mail',
                  ),

                  divider,

                  const TextFieldWidget(
                    label: 'Senha',
                    obscureText: true,
                  ),

                  divider,
                  
                  AppButtonWidget(
                    child: const Text('Entrar'),
                    onPressed: () {},
                  )
                ]
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Não possui uma conta?'),
                  TextButton(
                    child: Text('Cadastre-se', style: context.appTextStyles.textBold),
                    onPressed: () => Get.toNamed(AppRoutes.signUp)
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