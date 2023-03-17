// To parse this JSON data, do
//
//     final mainCategoryModel = mainCategoryModelFromJson(jsonString);


import '../core/typedefs.dart';


class MainCategoryModel {
  MainCategoryModel({
    this.serviceName,
    this.imageUrl,
    this.serviceId,
  });
  factory MainCategoryModel.fromJson(Map<String, dynamic> json) =>
      MainCategoryModel(
        serviceName: json['ServiceName'] as String?,
        imageUrl: json['imageURL'] as String?,
        serviceId: json['ServiceID'] as String?,
      );

  final String? serviceName;
  final String? imageUrl;
  final String? serviceId;

  static List<MainCategoryModel> jsonListToObject(List data) {
    final temp = <MainCategoryModel>[];
    for (final element in data) {
      temp.add(MainCategoryModel.fromJson(element.data() as DynamicMap));
    }
    return temp;
  }

  Map<String, dynamic> toJson() => {
        'ServiceName': serviceName,
        'imageURL': imageUrl,
        'ServiceID': serviceId,
      };
}
