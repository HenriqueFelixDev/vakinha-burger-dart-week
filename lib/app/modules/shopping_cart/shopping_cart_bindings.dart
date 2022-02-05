import 'package:get/get.dart';

import 'shopping_cart_controller.dart';
import '../../core/repositories/iorder_repository.dart';
import '../../core/repositories/order_repository_impl.dart';

class ShoppingCartBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IOrderRepository>(
      () => OrderRepositoryImpl(client: Get.find())
    );
    
    Get.lazyPut(
      () => ShoppingCartController(
        shoppingCartService: Get.find(),
        authService: Get.find(),
        orderRepository: Get.find()
      )
    );
  }
}