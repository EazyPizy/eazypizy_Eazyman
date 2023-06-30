// To parse this JSON data, do
//
//     final subServiceProductModel = subServiceProductModelFromJson(jsonString);

import '../core/typedefs.dart';

class SubServiceProductModel {
  SubServiceProductModel(
      {this.serviceIDs,
      this.serviceProductName,
      this.subServiceIDs,
      this.serviceProductId,
      this.serviceProdImage,
      this.serviceRetailPrice});

  factory SubServiceProductModel.fromJson(Map<String, dynamic> json) =>
      SubServiceProductModel(
        serviceIDs: json['ServiceIDs'] == null
            ? []
            : List<String>.from(json['ServiceIDs']!.map((x) => x) as Iterable),
        serviceProductName: json['ServiceProductName'] as String?,
        subServiceIDs: json['SubServiceIDs'] == null
            ? []
            : List<String>.from(
                json['SubServiceIDs']!.map((x) => x) as Iterable,
              ),
        serviceProductId: json['ServiceProductID'] as String?,
        serviceProdImage: json['serviceProdImage'] as String?,
        serviceRetailPrice: json['ServiceRetail_Price'] as double?,
      );

  final List<String>? serviceIDs;
  final String? serviceProductName;
  final List<String>? subServiceIDs;
  final String? serviceProductId;
  final String? serviceProdImage;
  final double? serviceRetailPrice;

  Map<String, dynamic> toJson() => {
        'ServiceIDs': serviceIDs == null
            ? []
            : List<dynamic>.from(serviceIDs!.map((x) => x)),
        'ServiceProductName': serviceProductName,
        'SubServiceIDs': subServiceIDs == null
            ? []
            : List<dynamic>.from(subServiceIDs!.map((x) => x)),
        'ServiceProductID': serviceProductId,
        'serviceProdImage': serviceProdImage,
        'ServiceRetail_Price': serviceRetailPrice,
      };

  static List<SubServiceProductModel> jsonListToObject(List data) {
    final temp = <SubServiceProductModel>[];
    for (final element in data) {
      temp.add(SubServiceProductModel.fromJson(element.data() as DynamicMap));
    }
    return temp;
  }
}
