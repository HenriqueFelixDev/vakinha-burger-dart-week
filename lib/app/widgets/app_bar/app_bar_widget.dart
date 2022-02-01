import 'package:flutter/material.dart';

import '../../core/constants/app_images.dart';

class AppBarWidget extends AppBar {
  AppBarWidget({
    Key? key,
    List<Widget>? actions
  })
    : super(
      key: key,
      title: Image.asset(
        AppImages.logo,
        width: 80.0
      ),
      centerTitle: true,
      actions: actions,
      elevation: 0.0,
      backgroundColor: Colors.white
    );
}