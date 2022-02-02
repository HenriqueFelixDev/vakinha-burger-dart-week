import 'package:get/get.dart';

import '../models/messages/messages.dart';

mixin MessageMixin on GetxController {
  void messageListener(Rxn<MessageModel> message) {
    ever<MessageModel?>(message, (messageModel) {
      if (messageModel == null) return;
      
      Get.snackbar(
        messageModel.title,
        messageModel.message,
        backgroundColor: messageModel.type.backgroundColor,
        colorText: messageModel.type.foregroundColor,
      );
    });
  }
}