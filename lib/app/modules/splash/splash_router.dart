import 'package:get/get.dart';

import 'splash_page.dart';
import 'splash_bindings.dart';
import '../../core/constants/app_routes.dart';

class SplashRouter {
  SplashRouter._();
  
  static List<GetPage> get pages => [
    GetPage(
      name: AppRoutes.splash,
      binding: SplashBindings(),
      page: () => const SplashPage()
    )
  ];
}