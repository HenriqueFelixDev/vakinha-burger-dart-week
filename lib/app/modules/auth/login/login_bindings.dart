import 'package:get/get.dart';

import 'login_controller.dart';
import '../../../core/repositories/auth_repository_impl.dart';
import '../../../core/repositories/iauth_repository.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IAuthRepository>(() => AuthRepositoryImpl(Get.find()));
    Get.lazyPut(() => LoginController(Get.find()));
  }
}