import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../menu/menu_page.dart';
import '../menu/menu_bindings.dart';
import '../shopping_cart/shopping_cart_bindings.dart';
import '../shopping_cart/shopping_cart_page.dart';
import '../../core/constants/app_routes.dart';
import '../../core/services/auth_service.dart';
import '../../core/services/shopping_cart_service.dart';

class HomeController extends GetxController {
  final ShoppingCartService _shoppingCartService;
  HomeController({ required ShoppingCartService shoppingCartService })
    : _shoppingCartService = shoppingCartService;

  static const NAVIGATOR_KEY = 1;
  
  final _tabIndex = 0.obs;
  int get tabIndex => _tabIndex.value;

  final _tabs = [AppRoutes.menu, AppRoutes.shoppingCart, AppRoutes.exit];

  int get shoppingCartProductsCount => _shoppingCartService.shoppingCartCount;

  set tabIndex(value) {
    _tabIndex(value);

    if (_tabs[value] == AppRoutes.exit) {
      Get.find<AuthService>().logout();
    }

    Get.toNamed(_tabs[value], id: NAVIGATOR_KEY);
  }

  Route<dynamic>? onGenerateRoute (RouteSettings settings) {
    if (settings.name == AppRoutes.menu) {
      return GetPageRoute(
        settings: settings,
        binding: MenuBindings(),
        page: () => const MenuPage()
      );
    }

    if (settings.name == AppRoutes.shoppingCart) {
      return GetPageRoute(
        settings: settings,
        binding: ShoppingCartBindings(),
        page: () => const ShoppingCartPage()
      );
    }

    return null;
  }
}