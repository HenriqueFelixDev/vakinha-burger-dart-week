import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/app_theme/app_theme_interface.dart';

class CircleButtonWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  const CircleButtonWidget({
    Key? key,
    required this.child,
    this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = Get.find<AppThemeInterface>().colors;

    return ElevatedButton(
      child: child,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        primary: appColors.background,
        onPrimary: appColors.onBackground,
        minimumSize: const Size(45.0, 45.0),
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      onPressed: onPressed
    );
  }
}