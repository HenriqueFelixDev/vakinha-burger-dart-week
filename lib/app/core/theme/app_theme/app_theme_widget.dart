import 'package:flutter/material.dart';

import 'app_theme_interface.dart';

class AppThemeWidget extends InheritedWidget {

  final AppThemeInterface appTheme;
  
  AppThemeWidget({
    Key? key,
    required this.appTheme,
    required WidgetBuilder builder
  }) : super(
    key: key,
    child: Builder(builder: builder)
  );

  static AppThemeWidget of(BuildContext context) {
    final themeWidget = context.dependOnInheritedWidgetOfExactType<AppThemeWidget>();
    assert(themeWidget != null, 'No AppThemeWidget found in context');
    return themeWidget!;
  }
  
  @override
  bool updateShouldNotify(covariant AppThemeWidget oldWidget) => 
    oldWidget.appTheme != appTheme;
}