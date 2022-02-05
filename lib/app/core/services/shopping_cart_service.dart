import 'package:get/get.dart';

import '../models/products/product_model.dart';
import '../models/products/shopping_cart_item_model.dart';

class ShoppingCartService extends GetxService {
  final _shoppingCart = <int, ShoppingCartItemModel>{}.obs;

  @override
  void onInit() {
    super.onInit();
    ever<Map<int, ShoppingCartItemModel>>(_shoppingCart, (cart) {
      isEmpty(cart.values.isEmpty);
    });
    isEmpty(_shoppingCart.values.isEmpty);
  }

  void addOrRemoveShoppingCartItem({
      required ProductModel product,
      required int quantity
  }) {

    if (_shoppingCart.containsKey(product.id)) {
      _shoppingCart.remove(product.id);
      return;
    }

    _shoppingCart[product.id] =
      ShoppingCartItemModel(quantity: quantity, product: product);
  }

  void updateShoppingCartItem({
    required ProductModel product,
    required int quantity
  }) {
    
    if (_shoppingCart.containsKey(product.id)) {
      _shoppingCart.update(
        product.id,
        (cartItem) => cartItem.copyWith(quantity: quantity)
      );
    }
  }

  final isEmpty = false.obs;

  ShoppingCartItemModel? getItemByProductId(ProductModel product) =>
    _shoppingCart[product.id];

  List<ShoppingCartItemModel> get shoppingCartProducts =>
    _shoppingCart.values.toList();

  int get shoppingCartCount => _shoppingCart.values.length;

  double get totalPrice => _shoppingCart.values
    .fold(0.0, (total, item) => (item.product.price * item.quantity) + total);

  void clear() => _shoppingCart.clear();
}