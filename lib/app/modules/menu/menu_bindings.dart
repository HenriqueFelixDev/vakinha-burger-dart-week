import 'package:get/get.dart';

import 'menu_controller.dart';
import '../../core/repositories/iproducts_repository.dart';
import '../../core/repositories/products_repository_impl.dart';

class MenuBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IProductsRepository>(() => ProductsRepositoryImpl(client: Get.find()));
    Get.lazyPut(() => MenuController(productsRepository: Get.find()));
  }
  
}