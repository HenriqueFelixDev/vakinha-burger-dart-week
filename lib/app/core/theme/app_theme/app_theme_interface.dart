import 'package:flutter/material.dart';

import '../colors/app_colors_interface.dart';
import '../text_styles/app_text_styles_interface.dart';

abstract class AppThemeInterface {
  AppColorsInterface get colors;
  AppTextStylesInterface get textStyles;

  ThemeData getThemeData();
}