import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/app_bar/app_bar_widget.dart';
import '../../../widgets/app_button/app_button_widget.dart';
import '../../../widgets/text_field/text_field_widget.dart';
import '../../../core/extensions/app_theme_extension.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({ Key? key }) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final divider = SizedBox(height: context.widthTransformer(reducedBy: 90.0));

    return Scaffold(
      appBar: AppBarWidget(),
      backgroundColor: context.appColors.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Cadastro', style: context.appTextStyles.heading2),
                  
              const Text('Preencha os campos abaixo para criar o seu cadastro.'),
              
              divider,

              const TextFieldWidget(
                label: 'Nome*',
              ),
              
              divider,

              const TextFieldWidget(
                label: 'E-mail*',
              ),

              divider,

              const TextFieldWidget(
                label: 'Senha*',
                obscureText: true,
              ),

              divider,

              const TextFieldWidget(
                label: 'Confirmar Senha*',
                obscureText: true,
              ),

              divider,
              
              AppButtonWidget(
                child: const Text('Cadastrar'),
                onPressed: () {},
              )
            ]
          )
        ),
      )
    );
  }
}