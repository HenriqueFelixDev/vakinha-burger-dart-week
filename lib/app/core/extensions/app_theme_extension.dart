import 'package:flutter/material.dart';

import '../theme/app_theme/app_theme_interface.dart';
import '../theme/app_theme/app_theme_widget.dart';
import '../theme/colors/app_colors_interface.dart';
import '../theme/text_styles/app_text_styles_interface.dart';

extension AppThemeExtension on BuildContext {
  AppThemeInterface get appTheme => AppThemeWidget.of(this).appTheme;

  AppColorsInterface get appColors => AppThemeWidget.of(this).appTheme.colors;

  AppTextStylesInterface get appTextStyles => AppThemeWidget.of(this).appTheme.textStyles;
}