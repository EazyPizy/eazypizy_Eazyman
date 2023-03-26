import 'package:eazypizy_eazyman/Models/model_subService_product.dart';

class MyCustomerModel {
  final String myCustomerUID;
  final String myCustomerName;
  final String myCustomerPhone;

  MyCustomerModel({
    required this.myCustomerName,
    required this.myCustomerUID,
    required this.myCustomerPhone,
  });

  factory MyCustomerModel.fromJson(Map<String, dynamic> json,
          [SubServiceProductModel? productModel]) =>
      MyCustomerModel(
        myCustomerUID: json['my_CustomerUID'] as String,
        myCustomerName: json['customer_Name'] as String,
        myCustomerPhone: json['customer_Number'] as String,
      );

  Map<String, dynamic> toJson() => {
        'my_CustomerUID': myCustomerUID,
        'customer_Name': myCustomerName,
        'customer_Number': myCustomerPhone,
      };
}
