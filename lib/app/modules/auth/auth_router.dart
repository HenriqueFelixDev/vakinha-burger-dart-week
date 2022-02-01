import 'package:get/get.dart';

import 'pages/login_page.dart';
import 'pages/signup_page.dart';
import '../../core/constants/app_routes.dart';

class AuthRouter {
  AuthRouter._();

  static List<GetPage> get pages => [
    GetPage(name: AppRoutes.login, page: () => const LoginPage()),
    GetPage(name: AppRoutes.signUp, page: () => const SignUpPage()),
  ];
}