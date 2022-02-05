import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../products/shopping_cart_item_model.dart';

class OrderModel {
  int userId;
  String address;
  String cpf;
  List<ShoppingCartItemModel> products;

  OrderModel({
    required this.userId,
    required this.address,
    required this.cpf,
    required this.products,
  });

  OrderModel copyWith({
    int? userId,
    String? address,
    String? cpf,
    List<ShoppingCartItemModel>? products,
  }) {
    return OrderModel(
      userId: userId ?? this.userId,
      address: address ?? this.address,
      cpf: cpf ?? this.cpf,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'address': address,
      'cpf': cpf,
      'products': products.map((x) => x.toMap()).toList(),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      userId: map['userId']?.toInt() ?? 0,
      address: map['address'] ?? '',
      cpf: map['cpf'] ?? '',
      products: List<ShoppingCartItemModel>.from(map['products']?.map((x) => ShoppingCartItemModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) => OrderModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OrderModel(userId: $userId, address: $address, cpf: $cpf, products: $products)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is OrderModel &&
      other.userId == userId &&
      other.address == address &&
      other.cpf == cpf &&
      listEquals(other.products, products);
  }

  @override
  int get hashCode {
    return userId.hashCode ^
      address.hashCode ^
      cpf.hashCode ^
      products.hashCode;
  }
}
