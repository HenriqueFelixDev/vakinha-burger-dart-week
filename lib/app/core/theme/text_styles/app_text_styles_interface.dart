import 'package:flutter/material.dart';

import '../colors/app_colors_interface.dart';

abstract class AppTextStylesInterface {
  AppColorsInterface get colors;
  
  // Titles
  TextStyle get heading1;
  TextStyle get heading2;
  TextStyle get heading3;
  TextStyle get heading4;
  TextStyle get heading5;
  TextStyle get heading6;

  // Subtitles
  TextStyle get subtitle;
  TextStyle get subtitle2;

  // Body
  TextStyle get body;
  TextStyle get body2;

  // Customs
  TextStyle get textBold;
}