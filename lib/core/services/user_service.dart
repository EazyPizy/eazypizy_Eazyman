import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazypizy_eazyman/Models/EazymanModel.dart';
import 'package:eazypizy_eazyman/core/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

// class CustomerModel {
//   CustomerModel({
//     required this.id,
//     required this.phoneNumber,
//     this.name,
//     this.address,
//     this.pincode,
//   });
//   factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
//         id: json['id'] as String,
//         phoneNumber: json['phoneNumber'] as String,
//         address: json['address'] != null
//             ? List.from(json['address'] as Iterable)
//             : null,
//         name: json['name'] as String?,
//         pincode: json['pincode'] as String?,
//       );

//   DynamicMap toJson() => {
//         'id': id,
//         'name': name,
//         'address': address,
//         'pincode': pincode,
//         'phoneNumber': phoneNumber
//       };

//   final String id;
//   final String phoneNumber;
//   final String? name;
//   final List<String>? address;
//   final String? pincode;

//   /// if the customer has address and name to complete checkout
//   bool isApplicable() {
//     if (address != null && name != null) {
//       return true;
//     }
//     return false;
//   }
// }

class EazyMenService extends GetxService {
  static EazyMenService get instance => Get.find<EazyMenService>();
  final Logger _log = getLogger('EazyMen Service');

  final _firebaseAuth = FirebaseAuth.instance;

  late bool exists;

  EazyMenModel? _eazyMen;

  /// returns true if user is logged in, else false
  bool get isLoggedIn => _firebaseAuth.currentUser != null;

  /// null if the customer is not logged in.
  // EazyMenModel? get eazyMen => _eazyMen;
  get eazyMenID => _firebaseAuth.currentUser!.uid;

  // Stream<User?> stateChange() => _firebaseAuth.authStateChanges();

  /// fetches the customer if they are logged in
  Future<EazyMenService> init() async {
    // some();
    if (isLoggedIn) {
      // TODO: change to offline fetch

      // _eazyMen = await getCustomerData();
      final data = await FirebaseFirestore.instance
          .collection('EazyMen')
          .doc(_firebaseAuth.currentUser!.uid)
          .get();
      exists = data.exists;
      _log.i(_eazyMen);
    }
    return this;
  }

  // void some() {
  //   stateChange().listen((user) async {
  //     _log.v('Customer state change');
  //     if (user != null) {
  //       _customer = await getCustomerData();
  //     } else {
  //       _customer = null;
  //     }
  //   });
  // }

  Future<EazyMenModel> getCustomerData() async {
    _log.v('Getting eazymen details...');

    return EazyMenModel.fromJson(
      (await FirebaseFirestore.instance
              .collection('EazyMen')
              .doc(_firebaseAuth.currentUser!.uid)
              .get())
          .data()!,
    );
  }

  Future<void> logout() async {
    _log.v('logging out eazymen...');
    await _firebaseAuth.signOut();
    // TODO: delete from offline storage
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // logout();
  }
}
