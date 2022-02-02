import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/rest_client/rest_client.dart';
import '../../../core/models/messages/messages.dart';
import '../../../core/repositories/iauth_repository.dart';
import '../../../core/mixins/message_mixin.dart';
import '../../../core/mixins/loader_mixin.dart';

class SignUpController extends GetxController with LoaderMixin, MessageMixin {
  final IAuthRepository _authRepository;
  SignUpController(IAuthRepository authRepository)
    : _authRepository = authRepository;

  final _isLoading = false.obs;
  final _message = Rxn<MessageModel>();
  final formValid = false.obs;

  @override
  void onInit() {
    loaderListener(_isLoading);
    messageListener(_message);
    super.onInit();
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      _isLoading.toggle();
      final user = await _authRepository.signUp(name, email, password);
      _isLoading.toggle();

      final storage = GetStorage();
      storage.write(AppConstants.USER_KEY, user.id);
    } on RestClientException catch (e, s) {
      _isLoading.toggle();

      log(
        'Erro ao cadastrar usuário',
        error: e.message,
        stackTrace: s
      );

      _message(
        MessageModel(
          title: 'Erro',
          message: e.message,
          type: MessageType.error
        )
      );
    }  catch (e, s) {
      _isLoading.toggle();

      log(
        'Erro',
        error: 'Erro ao cadastrar usuário',
        stackTrace: s
      );

      _message(
        MessageModel(
          title: 'Erro',
          message: 'Erro ao cadastrar usuário',
          type: MessageType.error
        )
      );
    }
  }
}