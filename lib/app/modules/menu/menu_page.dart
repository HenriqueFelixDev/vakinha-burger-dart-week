import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'menu_controller.dart';
import 'widgets/product_card_widget.dart';
import '../../core/constants/app_routes.dart';

class MenuPage extends GetView<MenuController> {
  const MenuPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      RefreshIndicator(
        onRefresh: () async => await controller.refreshProducts(),
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            final product = controller.products[index];

            return ProductCardWidget(
              product: product,
              onPressed: () => Get.toNamed(AppRoutes.productDetails, arguments: product)
            );
          }
        )
      )
    );
  }
}