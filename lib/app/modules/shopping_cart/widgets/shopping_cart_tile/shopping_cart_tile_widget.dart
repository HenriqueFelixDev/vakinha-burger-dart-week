import 'package:flutter/material.dart';

import '../../../../widgets/product_quantity/product_quantity_widget.dart';

class ShoppingCartTileWidget extends StatelessWidget {
  final String label;
  final int quantity;
  final double price;
  final VoidCallback onPlusPressed;
  final VoidCallback onMinusPressed;
  final bool calculateTotalPrice;

  const ShoppingCartTileWidget({
    Key? key,
    required this.label,
    required this.quantity,
    required this.price,
    required this.onPlusPressed,
    required this.onMinusPressed,
    this.calculateTotalPrice = false
  }) : super(key: key);

  double get productValue => calculateTotalPrice
    ? price * quantity
    : price;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
              )
            ),
            Expanded(
              flex: 2,
              child: ProductQuantityWidget(
                quantity: quantity,
                price: productValue,
                onPlusPressed: onPlusPressed,
                onMinusPressed: onMinusPressed
              ),
            )
          ]
        ),
      )
    );
  }
}