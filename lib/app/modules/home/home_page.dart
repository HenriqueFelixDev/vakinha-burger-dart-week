import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';
import '../../core/ui/vakinha_state.dart';
import '../../widgets/icon_badge/icon_badge_widget.dart';
import '../../widgets/app_bar/app_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends VakinhaState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Navigator(
        initialRoute: '/menu',
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: controller.onGenerateRoute
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          onTap: (page) => controller.tabIndex = page,
          currentIndex: controller.tabIndex,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Menu'
            ),
            BottomNavigationBarItem(
              icon: Obx(() =>
                IconBadgeWidget(
                  icon: Icons.shopping_cart,
                  quantity: controller.shoppingCartProductsCount,
                )
              ),
              label: 'Carrinho'
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app),
              label: 'Sair'
            ),
          ]
        );
      }),
    );
  }
}