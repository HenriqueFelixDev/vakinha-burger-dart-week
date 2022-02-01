import 'package:flutter/material.dart';

import 'app_text_styles_interface.dart';
import '../colors/app_colors_interface.dart';

class AppTextStylesDefault implements AppTextStylesInterface {

  final AppColorsInterface _colors;

  AppTextStylesDefault(AppColorsInterface appColors)
    : _colors = appColors;

  @override
  AppColorsInterface get colors => _colors;

  // Titles
  @override
  TextStyle get heading1 => const TextStyle(fontWeight: FontWeight.bold, fontSize: 36.0);

  @override
  TextStyle get heading2 => const TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0);

  @override
  TextStyle get heading3 => const TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0);

  @override
  TextStyle get heading4 => const TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0);

  @override
  TextStyle get heading5 => const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0);

  @override
  TextStyle get heading6 => const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0);


  // Subtitles
  @override
  TextStyle get subtitle => const TextStyle(fontSize: 16.0);

  @override
  TextStyle get subtitle2 => TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: colors.bodyOpaque);


  // Body
  @override
  TextStyle get body => const TextStyle(fontSize: 16.0);

  @override
  TextStyle get body2 => const TextStyle(fontSize: 14.0); 
  
  @override
  TextStyle get textBold => const TextStyle(fontWeight: FontWeight.bold); 
}