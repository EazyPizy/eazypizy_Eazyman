import 'package:eazypizy_eazyman/Models/model_subService_product.dart';

class EazymenProductModel {
  final String productId;
  final SubServiceProductModel? productDetails;
  final String subServiceId;
  final int price;
  final bool isActive;

  EazymenProductModel({
    required this.subServiceId,
    required this.productId,
    required this.price,
    required this.isActive,
    this.productDetails,
  });

  factory EazymenProductModel.fromJson(Map<String, dynamic> json,
          [SubServiceProductModel? productModel]) =>
      EazymenProductModel(
        productId: json['productId'] as String,
        price: json['price'] as int,
        isActive: json['active'] as bool,
        subServiceId: json['subServiceId'] as String,
        productDetails: productModel,
      );
}
