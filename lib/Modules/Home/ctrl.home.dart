import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazypizy_eazyman/Modules/orderDetail/model/mdl.booking.detail.dart';
import 'package:eazypizy_eazyman/constant/firebase_collections.dart';
import 'package:eazypizy_eazyman/core/logger.dart';
import 'package:eazypizy_eazyman/core/services/user_service.dart';
import 'package:eazypizy_eazyman/core/typedefs.dart';
import 'package:eazypizy_eazyman/widgets/EasySnackBar.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _log = getLogger('Home Controller');
  final _eazymenService = EazyMenService.instance;

  bool loading = false;
  int bookingCount = 0;
  double amountMade = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getBookings();
  }

  VoidFuture getBookings() async {
    final eazymen = _eazymenService.eazyMen;
    loading = true;
    update();
    _log.v('Getting bookings count...');
    try {
      final data = await FirebaseFirestore.instance
          .collection(FirestoreCollections.bookings)
          .where('eazymen_id', isEqualTo: eazymen!.eazyManUid)
          .where('booking_status', isEqualTo: 3)
          // .count()
          .get();
      bookingCount = data.size;
      if (data.docs.isNotEmpty) {
        for (var element in data.docs) {
          amountMade += BookingDetailModel.fromMap(element.data(), element.id)
                  .payment_items_total
                  ?.toDouble() ??
              0;
        }
      }
    } catch (e) {
      _log.e(e);
      EazySnackBar.buildErronSnackbar(
        'Failed',
        'Failed to fetch data. Please check your connection and try again!',
      );
    } finally {
      loading = false;
      update();
    }
  }
}
