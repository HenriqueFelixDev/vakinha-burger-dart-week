import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modules/splash/splash_router.dart';
import 'modules/home/home_router.dart';
import 'modules/auth/auth_router.dart';
import 'modules/order/orders_router.dart';
import 'modules/details/details_router.dart';
import 'core/theme/app_theme/app_theme_interface.dart';
import 'core/bindings/application_bindings.dart';
import 'core/theme/app_theme/app_light_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Get.put<AppThemeInterface>(AppLightTheme());
    
    return GetMaterialApp(
      title: 'Vakinha Burguer',
      initialBinding: ApplicationBindings(),
      theme: appTheme.getThemeData(),
      getPages: [
        ...SplashRouter.pages,
        ...AuthRouter.pages,
        ...HomeRouter.pages,
        ...DetailsRouter.pages,
        ...OrdersRouter.pages
      ]
    );
  }
}