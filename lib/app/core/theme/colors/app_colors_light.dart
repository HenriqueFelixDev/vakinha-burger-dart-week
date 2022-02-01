import 'dart:ui';

import 'app_colors_interface.dart';

class AppColorsLight implements AppColorsInterface {
  @override
  Color get primary => const Color(0xFF007D21);

  @override
  Color get onPrimary => const Color(0xFFFFFFFF);

  @override
  Color get primaryDark => const Color(0xFF015E1A);



  @override
  Color get secondary => const Color(0xFFFFA126);

  @override
  Color get onSecondary => const Color(0xFFFFFFFF);

  @override
  Color get secondaryDark => const Color(0xFFE68200);



  @override
  Color get background => const Color(0xFFFFFFFF);

  @override
  Color get onBackground => const Color(0xFF000000);

  @override
  Color get surface => const Color(0xFFF9F9F9);

  @override
  Color get onSurface => const Color(0xFF333333);

  

  @override
  Color get error => const Color(0xFFFF6464);

  @override
  Color get onError => const Color(0xFFFFFFFF);

  @override
  Color get success => const Color(0xFF3CEE98);

  @override
  Color get onSuccess => const Color(0xFFFFFFFF);



  @override
  Color get border => const Color(0xFFCCCCCC);
  
  @override
  Color get bodyOpaque => const Color(0xFFCCCCCC);

  @override
  Color get disabled => const Color(0xFF999999);

  @override
  Color get onDisabled => const Color(0xFFFFFFFF);
}