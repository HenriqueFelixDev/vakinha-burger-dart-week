import 'package:flutter/material.dart';

class AppButtonWidget extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final VoidCallback? onPressed;
  const AppButtonWidget({
    Key? key,
    required this.child,
    this.width = double.infinity,
    this.height = 44.0,
    this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        child: child,
        onPressed: onPressed
      ),
    );
  }
}