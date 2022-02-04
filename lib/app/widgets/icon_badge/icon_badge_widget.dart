import 'package:flutter/material.dart';

class IconBadgeWidget extends StatelessWidget {
  final int quantity;
  final IconData icon;
  const IconBadgeWidget({
    Key? key,
    required this.icon,
    required this.quantity
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0, top: 8.0),
          child: Icon(icon),
        ),
        Visibility(
          visible: quantity > 0,
          child: Positioned(
            top: 0,
            right: 0,
            child: CircleAvatar(
              child: Text('$quantity', style: const TextStyle(fontSize: 12.0)),
              maxRadius: 10.0
            )
          )
        )
      ]
    );
  }
}