import 'dart:convert';

class PixModel {
  String code;
  String image;
  double totalValue;
  
  PixModel({
    required this.code,
    required this.image,
    required this.totalValue,
  });

  PixModel copyWith({
    String? code,
    String? image,
    double? totalValue,
  }) {
    return PixModel(
      code: code ?? this.code,
      image: image ?? this.image,
      totalValue: totalValue ?? this.totalValue,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'image': image,
      'totalValue': totalValue,
    };
  }

  factory PixModel.fromMap(Map<String, dynamic> map) {
    return PixModel(
      code: map['code'] ?? '',
      image: map['image'] ?? '',
      totalValue: map['totalValue']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PixModel.fromJson(String source) => PixModel.fromMap(json.decode(source));

  @override
  String toString() => 'PixModel(code: $code, image: $image, totalValue: $totalValue)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PixModel &&
      other.code == code &&
      other.image == image &&
      other.totalValue == totalValue;
  }

  @override
  int get hashCode => code.hashCode ^ image.hashCode ^ totalValue.hashCode;
}
