import 'package:get/get.dart';
import 'package:vakinha_burguer/app/core/services/auth_service.dart';

class SplashController extends GetxController {
  void checkLogin() {
    Get.putAsync(() => AuthService().init());
  }
}