// To parse this JSON data, do
//
//     final subServiceModel = subServiceModelFromJson(jsonString);


import '../core/typedefs.dart';

class SubServiceModel {
  SubServiceModel({
    this.subServiceName,
    this.serviceName,
    this.imageUrl,
    this.subServiceId,
    this.serviceId,
  });
  factory SubServiceModel.fromJson(Map<String, dynamic> json) =>
      SubServiceModel(
        subServiceName: json['SubServiceName'] as String?,
        serviceName: json['ServiceName'] == null
            ? []
            : List<String>.from(json['ServiceName']!.map((x) => x) as Iterable),
        imageUrl: json['ImageURL'] as String?,
        subServiceId: json['SubServiceID'] as String?,
        serviceId: json['ServiceID'] == null
            ? []
            : List<String>.from(json['ServiceID']!.map((x) => x) as Iterable),
      );

  final String? subServiceName;
  final List<String>? serviceName;
  final String? imageUrl;
  final String? subServiceId;
  final List<String>? serviceId;

  Map<String, dynamic> toJson() => {
        'SubServiceName': subServiceName,
        'ServiceName': serviceName == null
            ? []
            : List<dynamic>.from(serviceName!.map((x) => x)),
        'ImageURL': imageUrl,
        'SubServiceID': subServiceId,
        'ServiceID': serviceId == null
            ? []
            : List<dynamic>.from(serviceId!.map((x) => x)),
      };

  static List<SubServiceModel> jsonListToObject(List data) {
    final temp = <SubServiceModel>[];
    for (final element in data) {
      temp.add(SubServiceModel.fromJson(element.data() as DynamicMap));
    }
    return temp;
  }
}
