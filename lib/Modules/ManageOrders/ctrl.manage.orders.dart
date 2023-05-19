import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazypizy_eazyman/Modules/orderDetail/model/mdl.booking.detail.dart';
import 'package:eazypizy_eazyman/constant/firebase_collections.dart';
import 'package:eazypizy_eazyman/core/logger.dart';
import 'package:eazypizy_eazyman/core/services/user_service.dart';
import 'package:eazypizy_eazyman/core/typedefs.dart';
import 'package:eazypizy_eazyman/widgets/EasySnackBar.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ManageOrderController extends GetxController {
  final Logger _log = getLogger('ManageOrder Controller');
  final List<BookingDetailModel> bookings = [];
  bool loadingBookings = false;

  VoidFuture getBookings() async {
    final eazymen = EazyMenService.instance.eazyMen;
    loadingBookings = true;
    _log.v('Getting bookings...');
    try {
      final data = await FirebaseFirestore.instance
          .collection(FirestoreCollections.bookings)
          .where('eazymen_id', isEqualTo: eazymen!.eazyManUid)
          .get();
      bookings.clear();
      if (data.docs.isNotEmpty) {
        _log.i(data.docs);
        for (var element in data.docs) {
          bookings.add(BookingDetailModel.fromMap(element.data(), element.id));
        }
      }
    } catch (e) {
      _log.e(e);

      EazySnackBar.buildErronSnackbar(
        'Failed',
        'Failed to fetch bookings. Please check your connection and try again',
      );
    } finally {
      loadingBookings = false;
      update();
    }
  }

  String convertBookingStatus(int status) {
    switch (status) {
      case 0:
        return 'Booking Request';
      case 1:
        return 'Pending';
      case 2:
        return 'Working';
      case 3:
        return 'Done';
      default:
        return 'Pending';
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getBookings();
  }
}
