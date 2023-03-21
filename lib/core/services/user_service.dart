import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazypizy_eazyman/Models/EazymanModel.dart';
import 'package:eazypizy_eazyman/core/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../Models/EazymanModel.dart';
import '../../Models/EazymanModel.dart';
import '../../Models/EazymanModel.dart';

class EazyMenService extends GetxService {
  static EazyMenService get instance => Get.find<EazyMenService>();
  final Logger _log = getLogger('EazyMen Service');

  final _firebaseAuth = FirebaseAuth.instance;

  EazyMenModel? _eazyMen;

  /// returns true if user is logged in, else false
  bool get isLoggedIn => _firebaseAuth.currentUser != null;

  /// null if the customer is not logged in.
  EazyMenModel? get eazyMen => _eazyMen;

  Stream<User?> stateChange() => _firebaseAuth.authStateChanges();

  /// fetches the customer if they are logged in
  Future<EazyMenService> init() async {
    if (isLoggedIn) {
      // TODO: change to offline fetch
      await fetchEazymenData();
    }
    return this;
  }

  Future<void> fetchEazymenData() async {
    _log.v('Getting eazymen details...');

    _eazyMen = EazyMenModel.fromJson(
      (await FirebaseFirestore.instance
              .collection('EazyMen')
              .doc(_firebaseAuth.currentUser!.uid)
              // .doc('1ABxdhC163jgDXUxhhFBehCyyjSzcg5pPZ')
              .get())
          .data()!,
    );

    _log.i(_eazyMen?.toJson());
  }

  Future<void> logout() async {
    _log.v('logging out eazymen...');
    await _firebaseAuth.signOut();
    // TODO: delete from offline storage
  }

  @override
  void onInit() {
    super.onInit();
    // logout();
  }
}
