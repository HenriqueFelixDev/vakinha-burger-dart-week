import 'package:get/get.dart';

import 'login/login_page.dart';
import 'login/login_bindings.dart';
import 'signup/signup_page.dart';
import 'signup/signup_bindings.dart';
import '../../core/constants/app_routes.dart';

class AuthRouter {
  AuthRouter._();

  static List<GetPage> get pages => [
    GetPage(
      name: AppRoutes.login,
      binding: LoginBindings(),
      page: () => const LoginPage()
    ),
    GetPage(
      name: AppRoutes.signUp,
      binding: SignUpBindings(),
      page: () => const SignUpPage()
    ),
  ];
}