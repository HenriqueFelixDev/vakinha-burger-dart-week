import 'dart:developer';

import 'package:get/get.dart';

import '../../core/mixins/loader_mixin.dart';
import '../../core/mixins/message_mixin.dart';
import '../../core/models/messages/messages.dart';
import '../../core/repositories/iproducts_repository.dart';
import '../../core/rest_client/rest_client.dart';

class MenuController extends GetxController with LoaderMixin, MessageMixin {
  final IProductsRepository _productsRepository;

  MenuController({
    required IProductsRepository productsRepository
  }) : _productsRepository = productsRepository;

  final _isLoading = false.obs;
  final _message = Rxn<MessageModel>();
  final products = [].obs;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_isLoading);
    messageListener(_message);
  }

  @override
  void onReady() {
    super.onReady();
    _loadProducts(showLoader: true);
  }

  Future<void> refreshProducts() => _loadProducts();

  Future<void> _loadProducts({bool showLoader = false}) async {
    try {
      if(showLoader) _isLoading.toggle();

      final productsResult = await _productsRepository.findAllProducts();
      products.assignAll(productsResult);
      if(showLoader) _isLoading.toggle();
    } on RestClientException catch (e, s) {
      if(showLoader) _isLoading.toggle();

      log(
        'Erro ao carregar os produtos',
        error: e.message,
        stackTrace: s
      );

      _message(
        MessageModel(
          title: 'Erro',
          message: e.message,
          type: MessageType.error
        )
      );
    } catch (e, s) {
      if(showLoader) _isLoading.toggle();

      log(
        'Erro',
        error: 'Erro ao carregar os produtos $e',
        stackTrace: s
      );

      _message(
        MessageModel(
          title: 'Erro',
          message: 'Erro ao carregar os produtos',
          type: MessageType.error
        )
      );
    }
  }
}