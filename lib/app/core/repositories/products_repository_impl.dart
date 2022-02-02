import 'dart:developer';

import 'iproducts_repository.dart';
import '../rest_client/rest_client.dart';
import '../models/products/product_model.dart';

class ProductsRepositoryImpl implements IProductsRepository {
  final RestClient _client;
  ProductsRepositoryImpl({
    required RestClient client
  }) : _client = client;

  @override
  Future<List<ProductModel>> findAllProducts() async {
    final result = await _client.get('/products');

    if (result.hasError) {
      log(
        'Erro ao carregar os produtos ${result.statusCode}',
        error: result.statusText,
        stackTrace: StackTrace.current
      );

      throw RestClientException('Erro ao carregar os produtos');
    }

    return result.body
      .map<ProductModel>((productMap) => ProductModel.fromMap(productMap))
      .toList();
  }

}