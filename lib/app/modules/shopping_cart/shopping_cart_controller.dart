import 'dart:developer';

import 'package:get/get.dart';

import '../home/home_controller.dart';
import '../../core/constants/app_routes.dart';
import '../../core/mixins/loader_mixin.dart';
import '../../core/mixins/message_mixin.dart';
import '../../core/models/messages/messages.dart';
import '../../core/models/orders/order_model.dart';
import '../../core/models/products/shopping_cart_item_model.dart';
import '../../core/repositories/iorder_repository.dart';
import '../../core/services/auth_service.dart';
import '../../core/services/shopping_cart_service.dart';

class ShoppingCartController extends GetxController with LoaderMixin, MessageMixin {
  final ShoppingCartService _shoppingCartService;
  final AuthService _authService;
  final IOrderRepository _orderRepository;
  
  ShoppingCartController({
    required ShoppingCartService shoppingCartService,
    required AuthService authService,
    required IOrderRepository orderRepository
  }) : _shoppingCartService = shoppingCartService,
       _authService = authService,
       _orderRepository = orderRepository;

  final _isLoading = false.obs;
  final _message = Rxn<MessageModel>();

  @override
  void onInit() {
    super.onInit();
    loaderListener(_isLoading);
    messageListener(_message);
  }

  final _cpf = "".obs;
  set cpf(String value) => _cpf.value = value;

  final _address = "".obs;
  set address(String value) => _cpf.value = value;

  final _formIsValid = false.obs;
  bool get formIsValid => _formIsValid.value;
  set formIsValid(bool value) => _formIsValid.value = value;

  double get totalPrice => _shoppingCartService.totalPrice;

  List<ShoppingCartItemModel> get shoppingCartItems => _shoppingCartService.shoppingCartProducts;

  RxBool get isEmpty => _shoppingCartService.isEmpty;

  void clear() => _shoppingCartService.clear();

  void incrementItemQuantity(ShoppingCartItemModel shoppingCartItem) {
    _shoppingCartService.updateShoppingCartItem(
      product: shoppingCartItem.product,
      quantity: shoppingCartItem.quantity + 1
    );
  }

  void decrementItemQuantity(ShoppingCartItemModel shoppingCartItem) {
    final newQuantity = shoppingCartItem.quantity - 1;

    if (newQuantity <= 0) {
      _shoppingCartService.addOrRemoveShoppingCartItem(
        product: shoppingCartItem.product,
        quantity: newQuantity
      );
      return;
    }

    _shoppingCartService.updateShoppingCartItem(
      product: shoppingCartItem.product,
      quantity: newQuantity
    );

  }

  void createOrder() async {
    try {
      _isLoading.toggle();

      final userId = _authService.getUserId();
      final order = OrderModel(
        userId: userId!,
        address: _address.value,
        cpf: _cpf.value,
        products: shoppingCartItems
      );

      var pixData = await _orderRepository.createOrder(order);
      pixData = pixData.copyWith(totalValue: totalPrice);

      _isLoading.toggle();
      clear();
      Get.offNamed(AppRoutes.orderFinish, arguments: pixData);
      Get.back(id: HomeController.NAVIGATOR_KEY);
    } catch (e, s) {
      _isLoading.toggle();

      log(
        'Erro ao criar pedido',
        error: e,
        stackTrace: s
      );

      _message(
        MessageModel(
          title: 'Erro',
          message: 'Erro ao criar pedido',
          type: MessageType.error
        )
      );
    }
  }

}