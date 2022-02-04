import 'package:get/get.dart';

import '../../core/models/products/product_model.dart';
import '../../core/services/shopping_cart_service.dart';

class DetailsController extends GetxController {
  final ShoppingCartService _shoppingCartService;
  DetailsController({ required ShoppingCartService shoppingCartService })
    : _shoppingCartService = shoppingCartService;

  final _product = Rx<ProductModel>(Get.arguments);
  ProductModel get product => _product.value;

  final _quantity = 1.obs;
  int get quantity => _quantity.value;

  final _totalPrice = 0.0.obs;
  double get totalPrice => _totalPrice.value;

  final _alreadyAdded = false.obs;
  bool get alreadyAdded => _alreadyAdded.value;

  @override
  onInit() {
    super.onInit();
    
    _totalPrice(product.price);

    ever<int>(_quantity, (quantity) {
      _totalPrice(product.price * quantity);

      if (_alreadyAdded.isTrue) {
        _updateShoppingCartItem();
      }
    });

    _checkIfProductIsInTheCart(updateQuantity: true);
  }

  void incrementQuantity() => _quantity.value++;

  void decrementQuantity() {
    if (_quantity.value > 1) {
      _quantity.value--;
    }
  }

  void addOrRemoveProductInShoppingCart() {
    _shoppingCartService.addOrRemoveShoppingCartItem(product: product, quantity: quantity);
    _checkIfProductIsInTheCart();
  }

  void _updateShoppingCartItem() {
    _shoppingCartService.updateShoppingCartItem(product: product, quantity: quantity);
  }

  void _checkIfProductIsInTheCart({bool updateQuantity = false}) {
    final cartProduct = _shoppingCartService.getItemByProductId(product);
    final productInCart = cartProduct != null;

    if (productInCart && updateQuantity) {
      _quantity(cartProduct.quantity);
    }

    _alreadyAdded(productInCart);
  }
}