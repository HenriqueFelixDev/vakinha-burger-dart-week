import 'package:flutter/material.dart';

abstract class AppColorsInterface {
  Color get primary;
  Color get onPrimary;
  Color get primaryDark;

  Color get secondary;
  Color get secondaryDark;
  Color get onSecondary;

  Color get surface;
  Color get onSurface;
  Color get background;
  Color get onBackground;

  Color get error;
  Color get onError;

  Color get info;
  Color get onInfo;

  Color get success;
  Color get onSuccess;

  // Customs
  Color get border;

  Color get bodyOpaque;

  Color get disabled;
  Color get onDisabled;
}