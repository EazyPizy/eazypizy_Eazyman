import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazypizy_eazyman/core/logger.dart';
import 'package:eazypizy_eazyman/core/services/user_service.dart';
import 'package:eazypizy_eazyman/core/typedefs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ManageOrderController extends GetxController {
  final Logger _log = getLogger('ManageOrder Controller');
  // late final List<Bookings> bookings;
  bool loadingBookings = false;

  VoidFuture getBookings() async {
    final eazymen = EazyMenService.instance.eazyMen;
    loadingBookings = true;
    _log.v('Getting bookings...');
    try {
      final data = await FirebaseFirestore.instance
          .collection('Bookings')
          .where('eazymen_id', isEqualTo: eazymen!.eazyManUid)
          .get();
      _log.i(data.docs[0].data());
      loadingBookings = false;
      update();
    } catch (e) {
      _log.e(e);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getBookings();
  }
}
