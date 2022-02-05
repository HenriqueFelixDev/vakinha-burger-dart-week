import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/app_theme/app_theme_interface.dart';
import '../../core/utils/formatter_utils.dart';
import '../../widgets/circle_button/circle_button_widget.dart';

class ProductQuantityWidget extends StatelessWidget {
  final int quantity;
  final double price;
  final VoidCallback onPlusPressed;
  final VoidCallback onMinusPressed;
  const ProductQuantityWidget({
    Key? key,
    required this.quantity,
    required this.price,
    required this.onPlusPressed,
    required this.onMinusPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyles = Get.find<AppThemeInterface>().textStyles;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleButtonWidget(
              child: const Icon(Icons.remove),
              onPressed: onMinusPressed
            ),

            const SizedBox(width: 8.0),

            Text('$quantity'),

            const SizedBox(width: 8.0),

            CircleButtonWidget(
              child: const Icon(Icons.add),
              onPressed: onPlusPressed
            )
          ]
        ),
        
        Text(
          FormatterUtils.formatCurrency(price),
          style: textStyles.textBold
        ),
      ]
    );
  }
}