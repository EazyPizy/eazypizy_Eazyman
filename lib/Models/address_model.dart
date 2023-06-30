class AddressModel {
  AddressModel({
    required this.houseNumber,
    required this.localArea,
    required this.city,
    required this.state,
    required this.pincode,
    this.landMark,
  });
  AddressModel.fromMap(Map<String, dynamic> map)
      : houseNumber = map['houseNumber'] as String,
        localArea = map['localArea'] as String,
        city = map['city'] as String,
        state = map['state'] as String,
        pincode = map['pincode'] as String,
        landMark = map['landMark'] as String?;
  final String houseNumber;
  final String localArea;
  final String city;
  final String state;
  final String pincode;
  final String? landMark;

  Map<String, dynamic> toMap() {
    return {
      'houseNumber': houseNumber,
      'localArea': localArea,
      'city': city,
      'state': state,
      'pincode': pincode,
      'landMark': landMark,
    };
  }

  AddressModel copyWith({
    String? houseNumber,
    String? localArea,
    String? city,
    String? state,
    String? pincode,
    String? landMark,
  }) =>
      AddressModel(
        houseNumber: houseNumber ?? this.houseNumber,
        localArea: localArea ?? this.localArea,
        city: city ?? this.city,
        state: state ?? this.state,
        pincode: pincode ?? this.pincode,
        landMark: landMark ?? this.landMark,
      );

  @override
  String toString() {
    return '$houseNumber, $localArea - $pincode, $city';
  }
}
