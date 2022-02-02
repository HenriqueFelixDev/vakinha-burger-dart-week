import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_controller.dart';
import '../../core/constants/app_images.dart';
import '../../widgets/app_button/app_button_widget.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: context.heightTransformer(reducedBy: 85.0),
              left: context.widthTransformer(reducedBy: 90.0),
              right: context.widthTransformer(reducedBy: 90.0)
            ),
            child: Column(
              children: [
                Image.asset(
                  AppImages.logo,
                  height: 250.0
                ),

                AppButtonWidget(
                  child: const Text('Acessar'),
                  onPressed: () => controller.checkLogin()
                )
              ]
            ),
          ),
          Image.asset(
            AppImages.burger,
            fit: BoxFit.cover,
            height: 250.0
          ),
        ]
      )
    );
  }
}