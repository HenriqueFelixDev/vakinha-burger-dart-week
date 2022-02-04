import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'details_controller.dart';
import '../../widgets/app_bar/app_bar_widget.dart';
import '../../widgets/app_button/app_button_widget.dart';
import '../../widgets/product_quantity/product_quantity_widget.dart';
import '../../core/theme/app_theme/app_theme_interface.dart';
import '../../core/ui/vakinha_state.dart';
import '../../core/utils/formatter_utils.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({ Key? key }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends VakinhaState<DetailsPage, DetailsController> {
  @override
  Widget build(BuildContext context) {
    final textStyles = Get.find<AppThemeInterface>().textStyles;

    return Scaffold(
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'http://dartweek.academiadoflutter.com.br/images${controller.product.image}',
              height: 250.0,
              width: context.width,
              fit: BoxFit.cover
            ),

            const SizedBox(height: 16.0),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(controller.product.name, style: textStyles.heading3),
                  
                  const SizedBox(height: 16.0),

                  Text(controller.product.description),

                  const SizedBox(height: 16.0),

                  Obx(() {
                    return ProductQuantityWidget(
                      quantity: controller.quantity,
                      price: controller.product.price,
                      onMinusPressed: controller.decrementQuantity,
                      onPlusPressed: controller.incrementQuantity,
                    );
                  }),

                  const SizedBox(height: 16.0),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total', style: textStyles.heading6),

                      Obx(() =>
                        Text(
                          FormatterUtils.formatCurrency(controller.totalPrice),
                          style: textStyles.heading6
                        ),
                      )
                    ]
                  ),
                  
                  const SizedBox(height: 16.0),

                  Obx(() =>
                    AppButtonWidget(
                      outlined: controller.alreadyAdded,
                      child: Text(controller.alreadyAdded ? 'Remover do carrinho' : 'Adicionar ao carrinho'),
                      onPressed: controller.addOrRemoveProductInShoppingCart
                    )
                  )
                ]
              ),
            )
          ]
        )
      )
    );
  }
}