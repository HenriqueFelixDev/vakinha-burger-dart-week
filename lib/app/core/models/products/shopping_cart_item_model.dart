import 'dart:convert';

import 'product_model.dart';

class ShoppingCartItemModel {
  final int quantity;
  final ProductModel product;

  const ShoppingCartItemModel({
    required this.quantity,
    required this.product,
  });

  ShoppingCartItemModel copyWith({
    int? quantity,
    ProductModel? product,
  }) {
    return ShoppingCartItemModel(
      quantity: quantity ?? this.quantity,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quantity': quantity,
      'product': product.toMap(),
    };
  }

  factory ShoppingCartItemModel.fromMap(Map<String, dynamic> map) {
    return ShoppingCartItemModel(
      quantity: map['quantity']?.toInt() ?? 0,
      product: ProductModel.fromMap(map['product']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShoppingCartItemModel.fromJson(String source) => ShoppingCartItemModel.fromMap(json.decode(source));

  @override
  String toString() => 'ShoppingCartItemModel(quantity: $quantity, product: $product)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ShoppingCartItemModel &&
      other.quantity == quantity &&
      other.product == product;
  }

  @override
  int get hashCode => quantity.hashCode ^ product.hashCode;
}
