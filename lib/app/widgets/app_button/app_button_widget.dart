import 'package:flutter/material.dart';

class AppButtonWidget extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final VoidCallback? onPressed;
  final bool outlined;
  const AppButtonWidget({
    Key? key,
    required this.child,
    this.width = double.infinity,
    this.height = 44.0,
    this.onPressed,
    this.outlined = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final button = outlined
      ? OutlinedButton(child: child, onPressed: onPressed)
      : ElevatedButton(child: child, onPressed: onPressed);
      
    return SizedBox(width: width, height: height, child: button);
  }
}