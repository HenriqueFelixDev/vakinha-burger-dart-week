import 'package:get/get.dart';

import 'home_page.dart';
import 'home_bindings.dart';
import '../../core/constants/app_routes.dart';

class HomeRouter {
  HomeRouter._();

  static List<GetPage> get pages => [
    GetPage(
      name: AppRoutes.home,
      binding: HomeBindings(),
      page: () => const HomePage()
    )
  ];
}