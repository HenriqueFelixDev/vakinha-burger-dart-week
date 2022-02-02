import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/models/products/product_model.dart';
import '../../../core/theme/app_theme/app_theme_interface.dart';
import '../../../core/utils/formatter_utils.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onPressed;
  const ProductCardWidget({
    Key? key,
    required this.product,
    this.onPressed
  }) : super(key: key);

  BorderRadius get cardBorderRadius => BorderRadius.circular(10.0);

  Widget get productImage => Container(
    width: 120.0,
    height: 80.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.horizontal(
        left: cardBorderRadius.topLeft
      ),
      image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage('http://dartweek.academiadoflutter.com.br/images${product.image}')
      )
    ),
  );

  @override
  Widget build(BuildContext context) {
    final appTextStyles = Get.find<AppThemeInterface>().textStyles;

    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: cardBorderRadius),
      child: InkWell(
        onTap: onPressed,
        child: Row(
          children: [
            productImage,

            const SizedBox(width: 8.0),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, style: appTextStyles.heading6),
                  
                  const SizedBox(height: 8.0),
                  
                  Text(FormatterUtils.formatCurrency(product.price)),
                ]
              ),
            )
          ]
        )
      )
    );
  }
}