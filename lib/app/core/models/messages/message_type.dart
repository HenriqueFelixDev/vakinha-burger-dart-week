import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burguer/app/core/theme/app_theme/app_theme_interface.dart';

abstract class MessageType {
  Color get backgroundColor;
  Color get foregroundColor;

  static MessageType error = ErrorMessageType();
  static MessageType info = InfoMessageType();
}

class ErrorMessageType implements MessageType {
  @override
  Color get backgroundColor => Get.find<AppThemeInterface>().colors.error;

  @override
  Color get foregroundColor => Get.find<AppThemeInterface>().colors.onError;
}

class InfoMessageType implements MessageType {
  @override
  Color get backgroundColor => Get.find<AppThemeInterface>().colors.info;

  @override
  Color get foregroundColor => Get.find<AppThemeInterface>().colors.onInfo;
}