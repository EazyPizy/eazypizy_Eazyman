class BookingProductModel {
  final List<String>? serviceIDs;
  final String? serviceProductName;
  final List<String>? subServiceIDs;
  final String? serviceProductId;
  final String? serviceProdImage;

  BookingProductModel({
    this.serviceIDs,
    this.serviceProductName,
    this.subServiceIDs,
    this.serviceProductId,
    this.serviceProdImage,
  });

  BookingProductModel copyWith({
    List<String>? serviceIDs,
    String? serviceProductName,
    List<String>? subServiceIDs,
    String? serviceProductId,
    String? serviceProdImage,
  }) =>
      BookingProductModel(
        serviceIDs: serviceIDs ?? this.serviceIDs,
        serviceProductName: serviceProductName ?? this.serviceProductName,
        subServiceIDs: subServiceIDs ?? this.subServiceIDs,
        serviceProductId: serviceProductId ?? this.serviceProductId,
        serviceProdImage: serviceProdImage ?? this.serviceProdImage,
      );

  factory BookingProductModel.fromJson(Map<String, dynamic> json) =>
      BookingProductModel(
        serviceIDs: json["ServiceIDs"] == null
            ? []
            : List<String>.from(json["ServiceIDs"]!.map((x) => x)),
        serviceProductName: json["ServiceProductName"],
        subServiceIDs: json["SubServiceIDs"] == null
            ? []
            : List<String>.from(json["SubServiceIDs"]!.map((x) => x)),
        serviceProductId: json["ServiceProductID"],
        serviceProdImage: json["serviceProdImage"],
      );

  Map<String, dynamic> toJson() => {
        "ServiceIDs": serviceIDs == null
            ? []
            : List<dynamic>.from(serviceIDs!.map((x) => x)),
        "ServiceProductName": serviceProductName,
        "SubServiceIDs": subServiceIDs == null
            ? []
            : List<dynamic>.from(subServiceIDs!.map((x) => x)),
        "ServiceProductID": serviceProductId,
        "serviceProdImage": serviceProdImage,
      };
}
