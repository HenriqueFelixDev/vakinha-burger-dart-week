import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

import 'signup_controller.dart';
import '../../../core/theme/app_theme/app_theme_interface.dart';
import '../../../core/ui/vakinha_state.dart';
import '../../../widgets/app_bar/app_bar_widget.dart';
import '../../../widgets/app_button/app_button_widget.dart';
import '../../../widgets/text_field/text_field_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({ Key? key }) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends VakinhaState<SignUpPage, SignUpController> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _signUp() {
    _formKey.currentState!.save();
    controller.signUp(
      name: _nameController.text,
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: () {
            controller.formValid(_formKey.currentState!.validate());
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Cadastro', style: appTheme.textStyles.heading2),
                  
              const Text('Preencha os campos abaixo para criar o seu cadastro.'),
              
              divider,

              TextFieldWidget(
                label: 'Nome*',
                controller: _nameController,
                validator: Validatorless.required('O campo nome é obrigatório')
              ),
              
              divider,

              TextFieldWidget(
                label: 'E-mail*',
                controller: _emailController,
                validator: Validatorless.multiple([
                  Validatorless.required('O campo e-mail é obrigatório'),
                  Validatorless.email('O e-mail informado é inválido')
                ])
              ),

              divider,

              TextFieldWidget(
                label: 'Senha*',
                controller: _passwordController,
                obscureText: true,
                validator: Validatorless.multiple([
                  Validatorless.required('A senha é obrigatória'),
                  Validatorless.between(6, 32, 'A senha deve possuir entre 6 e 32 caracteres')
                ])
              ),

              divider,

              TextFieldWidget(
                label: 'Confirme sua Senha*',
                obscureText: true,
                validator: Validatorless.multiple([
                  Validatorless.required('Confirme sua senha é obrigatório'),
                  Validatorless.compare(
                    _passwordController,
                    'Os campos senha e confirme sua senha tem valores diferentes'
                  )
                ])
              ),

              divider,
              
              Obx(() =>
                AppButtonWidget(
                  child: const Text('Cadastrar'),
                  onPressed: controller.formValid.isTrue 
                    ? _signUp
                    : null
                )
              )
            ]
          )
        ),
      )
    );
  }
}