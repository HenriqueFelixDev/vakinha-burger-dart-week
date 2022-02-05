import 'package:get/get.dart';

import 'pix/pix_page.dart';
import 'finish/order_finish_page.dart';
import '../../core/constants/app_routes.dart';

class OrdersRouter {
  OrdersRouter._();

  static List<GetPage> get pages => [
    GetPage(
      name: AppRoutes.orderFinish,
      page: () => const OrderFinishPage()
    ),
    GetPage(
      name: AppRoutes.orderPix,
      page: () => const PixPage()
    ),
  ];
}