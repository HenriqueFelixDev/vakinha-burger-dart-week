import 'package:get/get.dart';
import 'pages/splash_page.dart';
import '../../core/constants/app_routes.dart';

class SplashRouters {
  SplashRouters._();
  
  static List<GetPage> get pages => [
    GetPage(name: AppRoutes.splash, page: () => const SplashPage())
  ];
}