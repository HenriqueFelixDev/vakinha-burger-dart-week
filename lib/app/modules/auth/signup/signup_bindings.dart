import 'package:get/get.dart';

import 'signup_controller.dart';
import '../../../core/repositories/auth_repository_impl.dart';
import '../../../core/repositories/iauth_repository.dart';

class SignUpBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IAuthRepository>(() => AuthRepositoryImpl(Get.find()));
    Get.lazyPut(() => SignUpController(Get.find()));
  }
}