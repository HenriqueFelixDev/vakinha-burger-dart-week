import 'package:flutter/material.dart';

import 'app_theme_interface.dart';
import '../colors/app_colors_interface.dart';
import '../colors/app_colors_light.dart';
import '../text_styles/app_text_styles_default.dart';
import '../text_styles/app_text_styles_interface.dart';

class AppLightTheme implements AppThemeInterface {
  
  @override
  AppColorsInterface get colors => AppColorsLight();

  @override
  AppTextStylesInterface get textStyles => AppTextStylesDefault(colors);

  @override
  ThemeData getThemeData() {
    return ThemeData(
      fontFamily: 'mplus1',
      colorScheme: ColorScheme(
        primary: colors.primary,
        onPrimary: colors.onPrimary,
        primaryVariant: colors.primaryDark,
        secondary: colors.secondary,
        onSecondary: colors.onSecondary,
        secondaryVariant: colors.secondaryDark,
        background: colors.background,
        onBackground: colors.onBackground,
        surface: colors.surface,
        onSurface: colors.onSurface,
        error: colors.error,
        onError: colors.onError,
        brightness: Brightness.light
      ),
      textTheme: TextTheme(
        headline1: textStyles.heading1,
        headline2: textStyles.heading2,
        headline3: textStyles.heading3,
        headline4: textStyles.heading4,
        headline5: textStyles.heading5,
        headline6: textStyles.heading6,
        bodyText1: textStyles.body,
        bodyText2: textStyles.body2,
        subtitle1: textStyles.subtitle,
        subtitle2: textStyles.subtitle2,
        button: textStyles.body
      ),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: colors.onBackground
        )
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: colors.primary,
          shape: const StadiumBorder()
        )
      )
    );
  }

}