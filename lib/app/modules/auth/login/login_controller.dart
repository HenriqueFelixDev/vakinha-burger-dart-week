import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burguer/app/core/constants/app_constants.dart';
import 'package:vakinha_burguer/app/core/exceptions/user_not_found_exception.dart';
import 'package:vakinha_burguer/app/core/mixins/loader_mixin.dart';
import 'package:vakinha_burguer/app/core/mixins/message_mixin.dart';
import 'package:vakinha_burguer/app/core/models/messages/message_model.dart';
import 'package:vakinha_burguer/app/core/repositories/iauth_repository.dart';

class LoginController extends GetxController with LoaderMixin, MessageMixin {
  final IAuthRepository _authRepository;
  LoginController(IAuthRepository authRepository)
    : _authRepository = authRepository;

  final _isLoading = false.obs;
  final _message = Rxn<MessageModel>();

  final formValid = false.obs;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_isLoading);
    messageListener(_message);
  }

  Future<void> login({
    required String email,
    required String password
  }) async {
    try {
      _isLoading.toggle();
      final user = await _authRepository.login(email, password);

      final storage = GetStorage();
      storage.write(AppConstants.USER_KEY, user.id);

      _isLoading.toggle();
    } on UserNotFoundException catch (e, s) {
      _isLoading.toggle();

      log(
        'Erro ao fazer login',
        error: 'Usuário e/ou senha incorretos',
        stackTrace: s
      );
      _message(
        MessageModel(
          title: 'Erro',
          message: 'Usuário e/ou senha incorretos',
          type: MessageType.error
        )
      );
    } catch (e, s) {
      _isLoading.toggle();

      log(
        'Erro',
        error: 'Erro ao fazer login',
        stackTrace: s
      );
      _message(
        MessageModel(
          title: 'Erro',
          message: 'Erro ao fazer login',
          type: MessageType.error
        )
      );
    }
  } 
}