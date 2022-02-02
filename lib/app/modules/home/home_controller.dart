import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../menu/menu_page.dart';
import '../menu/menu_bindings.dart';
import '../../core/services/auth_service.dart';

class HomeController extends GetxController {

  static const NAVIGATOR_KEY = 1;
  
  final _tabIndex = 0.obs;
  int get tabIndex => _tabIndex.value;
  final _tabs = ['/menu', '/shopping-cart', '/exit'];

  set tabIndex(value) {
    _tabIndex(value);

    if (_tabs[value] == '/exit') {
      Get.find<AuthService>().logout();
    }

    Get.toNamed(_tabs[value], id: NAVIGATOR_KEY);
  }

  Route<dynamic>? onGenerateRoute (RouteSettings settings) {
    if (settings.name == '/menu') {
      return GetPageRoute(
        settings: settings,
        binding: MenuBindings(),
        page: () => const MenuPage()
      );
    }

    if (settings.name == '/shopping-cart') {
      return GetPageRoute(
        settings: settings,
        binding: MenuBindings(),
        page: () => const MenuPage()
      );
    }
  }
}