import '../models/orders/order_model.dart';
import '../models/orders/pix_model.dart';

abstract class IOrderRepository {
  Future<PixModel> createOrder(OrderModel order);
}