import 'dart:developer';

import 'iorder_repository.dart';
import '../models/orders/pix_model.dart';
import '../models/orders/order_model.dart';
import '../rest_client/rest_client.dart';

class OrderRepositoryImpl extends IOrderRepository {
  final RestClient _client;
  OrderRepositoryImpl({
    required RestClient client
  }) : _client = client;

  @override
  Future<PixModel> createOrder(OrderModel order) async {
    final result = await _client.post('/order/', {
      'userId': order.userId,
      'cpf': order.cpf,
      'addres': order.address,
      'items': order.products.map((product) =>
        {
          'quantity': product.quantity,
          'productId': product.product.id
        }
      ).toList()
    });

    if (result.hasError) {
      log(
        'Erro ao criar o pedido ${result.statusCode}',
        error: result.statusText,
        stackTrace: StackTrace.current
      );
      throw RestClientException('Erro ao criar o pedido');
    }

    return PixModel.fromMap(result.body);
  }
}