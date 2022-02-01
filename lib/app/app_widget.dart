import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modules/auth/auth_router.dart';
import 'modules/splash/splash_routers.dart';
import 'core/theme/app_theme/app_light_theme.dart';
import 'core/theme/app_theme/app_theme_widget.dart';
import 'core/extensions/app_theme_extension.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppThemeWidget(
      appTheme: AppLightTheme(),
      builder : (context) {
        return GetMaterialApp(
          title: 'Vakinha Burguer',
          theme: context.appTheme.getThemeData(),
          getPages: [
            ...SplashRouters.pages,
            ...AuthRouter.pages
          ]
        );
      }
    );
  }
}