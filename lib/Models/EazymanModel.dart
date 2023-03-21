// To parse this JSON data, do
//
//     final eazyMenModel = eazyMenModelFromJson(jsonString);

import '../core/typedefs.dart';

class EazyMenModel {
  EazyMenModel({
    required this.eazyManUid,
    required this.phoneNumber,
    this.personalDetail,
    this.bankDetails,
    this.dateOfRegistration,
    this.lastActive,
    this.lastStatus,
    this.mainServices,
    this.subServices,
    this.subServiceProdcuts,
    this.deviceInfo,
  });
  factory EazyMenModel.fromJson(Map<String, dynamic> json) => EazyMenModel(
        personalDetail:
            PersonalDetail.fromJson(json['Personal_Detail'][0] as DynamicMap),
        //  == null
        //     ? []
        //     : List<PersonalDetail>.from(
        //         json['Personal_Detail']!
        //                 .map((e) => PersonalDetail.fromJson(e as DynamicMap))
        //             as Iterable,
        //       ),
        bankDetails: BankDetail.fromJson(json['BankDetails'][0] as DynamicMap),
        //  == null
        //     ? []
        //     : List<BankDetail>.from(
        //         json['BankDetails']!
        //                 .map((e) => BankDetail.fromJson(e as DynamicMap))
        //             as Iterable,
        //       ),
        eazyManUid: json['EazyMan_UID'] as String,
        phoneNumber: json['phoneNumber'] as String?,
        dateOfRegistration: json['Date_Of_Registration'],
        lastActive: json['Last_Active'] as String?,
        lastStatus: json['Last_Status'] as String?,
        // mainServices: List.from(elements) json['Main_Services'] as List<String>?,
        mainServices: json['Main_Services'] == null
            ? []
            : List<String>.from(
                json['Main_Services']!.map((e) => e.toString()) as Iterable,
              ),
        // subServices: json['Sub_Services'] as List<String>?,
        subServices: json['Sub_Services'] == null
            ? []
            : List<String>.from(
                json['Sub_Services']!.map((e) => e.toString()) as Iterable,
              ),
        subServiceProdcuts: json['Service_Product'] == null
            ? []
            : List<String>.from(
                json['Service_Product']!.map((e) => e.toString()) as Iterable,
              ),
        deviceInfo: json['Device_Info'] == null
            ? []
            : List<DeviceInfo>.from(
                json['Device_Info']!.map((e) => DeviceInfo.fromJson())
                    as Iterable,
              ),
      );

  final String eazyManUid;
  final String? phoneNumber;
  final PersonalDetail? personalDetail;
  final BankDetail? bankDetails;
  final DateTime? dateOfRegistration;
  final String? lastActive;
  final String? lastStatus;
  final List<String>? mainServices;
  final List<String>? subServices;
  final List<String>? subServiceProdcuts;
  final List<DeviceInfo>? deviceInfo;

  Map<String, dynamic> toJson() => {
        'Personal_Detail': [personalDetail?.toJson()],
        //  personalDetail == null
        //     ? []
        //     : List<dynamic>.from(personalDetail!.map((x) => x.toJson())),
        'BankDetails': [bankDetails?.toJson()],
        // bankDetails == null
        //     ? []
        //     : List<dynamic>.from(bankDetails!.map((x) => x.toJson())),
        'EazyMan_UID': eazyManUid,
        'Date_Of_Registration': dateOfRegistration,
        'Last_Active': lastActive,
        'Last_Status': lastStatus,
        'Main_Services': mainServices ?? [],
        'Sub_Services': subServices ?? [],
        'Service_Product': subServiceProdcuts ?? [],
        'Device_Info': deviceInfo == null
            ? []
            : List<dynamic>.from(deviceInfo!.map((x) => x.toJson())),
      };
}

class BankDetail {
  BankDetail({
    this.bankName,
    this.ifsc,
    this.accountNumber,
    this.accountHolder,
    this.upiId,
  });
  factory BankDetail.fromJson(Map<String, dynamic> json) => BankDetail(
        bankName: json['BankName'] as String?,
        ifsc: json['IFSC'] as String?,
        accountNumber: json['AccountNumber'] as String?,
        accountHolder: json['AccountHolder'] as String?,
        upiId: json['UPI_ID'] as String?,
      );

  final String? bankName;
  final String? ifsc;
  final String? accountNumber;
  final String? accountHolder;
  final String? upiId;

  Map<String, dynamic> toJson() => {
        'BankName': bankName,
        'IFSC': ifsc,
        'AccountNumber': accountNumber,
        'AccountHolder': accountHolder,
        'UPI_ID': upiId,
      };
}

class DeviceInfo {
  DeviceInfo();

  factory DeviceInfo.fromJson() => DeviceInfo();

  Map<String, dynamic> toJson() => {};
}

class PersonalDetail {
  PersonalDetail({
    this.gender,
    this.firstName,
    this.lastName,
    this.email,
    this.city,
    this.images,
    this.age,
    this.dob,
    this.experiance,
    this.phoneNumber,
    this.whatsAppNumber,
  });
  factory PersonalDetail.fromJson(Map<String, dynamic> json) => PersonalDetail(
        gender: json['Gender'] as String?,
        firstName: json['FirstName'] as String?,
        lastName: json['LastName'] as String?,
        email: json['Email'] as String?,
        city: json['City'] as String?,
        images: json['Images'] as String?,
        age: json['Age'] as String?,
        dob: json['DOB'] as String?,
        experiance: json['Experiance'] as int?,
        phoneNumber: json['PhoneNumber'] as String?,
        whatsAppNumber: json['WhatsAppNumber'] as String?,
      );

  final String? gender;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? city;
  final String? images;
  final String? age;
  final String? dob;
  final int? experiance;
  final String? phoneNumber;
  final String? whatsAppNumber;

  Map<String, dynamic> toJson() => {
        'Gender': gender,
        'FirstName': firstName,
        'LastName': lastName,
        'Email': email,
        'City': city,
        'Images': images,
        'Age': age,
        'DOB': dob,
        'Experiance': experiance,
        'PhoneNumber': phoneNumber,
        'WhatsAppNumber': whatsAppNumber,
      };
}
