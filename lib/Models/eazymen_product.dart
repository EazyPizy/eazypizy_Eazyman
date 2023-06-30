import 'package:eazypizy_eazyman/Models/model_subService_product.dart';

class EazymenProductModel {
  final String productId;
  final SubServiceProductModel? productDetails;
  final String subServiceId;
  int price;
  final bool isActive;

  EazymenProductModel({
    required this.subServiceId,
    required this.productId,
    required this.price,
    required this.isActive,
    this.productDetails,
  });

  EazymenProductModel copyWith({
    String? productId,
    SubServiceProductModel? productDetails,
    String? subServiceId,
    int? price,
    bool? isActive,
  }) {
    return EazymenProductModel(
      productId: productId ?? this.productId,
      productDetails: productDetails ?? this.productDetails,
      subServiceId: subServiceId ?? this.subServiceId,
      price: price ?? this.price,
      isActive: isActive ?? this.isActive,
    );
  }

  factory EazymenProductModel.fromJson(Map<String, dynamic> json,
          [SubServiceProductModel? productModel]) =>
      EazymenProductModel(
        productId: json['productId'] as String,
        price: json['price'] as int,
        isActive: json['active'] as bool,
        subServiceId: json['subServiceId'] as String,
        productDetails: productModel,
      );

  Map<String, dynamic> toJson() => {
        'productId': productId,
        'price': price,
        'active': isActive,
        'subServiceId': subServiceId,
      };
}
