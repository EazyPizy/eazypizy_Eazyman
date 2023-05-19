import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazypizy_eazyman/Modules/orderDetail/components/accept.booking.sheet.dart';
import 'package:eazypizy_eazyman/Modules/orderDetail/components/complete.service.sheet.dart';
import 'package:eazypizy_eazyman/Modules/orderDetail/components/start.service.sheet.dart';
import 'package:eazypizy_eazyman/Modules/orderDetail/model/mdl.booking.detail.dart';
import 'package:eazypizy_eazyman/constant/firebase_collections.dart';
import 'package:eazypizy_eazyman/core/logger.dart';
import 'package:eazypizy_eazyman/core/typedefs.dart';
import 'package:eazypizy_eazyman/widgets/EasySnackBar.dart';
import 'package:get/get.dart';

class BookingDetailController extends GetxController {
  final _log = getLogger('OrderDetail Controller');

  late final BookingDetailModel bookingDetail;
  bool loading = false;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    bookingDetail = Get.arguments as BookingDetailModel;
  }

  void acceptBooking() {
    acceptBookingConfirmationSheet();
  }

  void startService() {
    startServiceConfirmationSheet();
  }

  void completeBooking() {
    completeBookingConfirmationSheet();
  }

  void confirmAcceptBooking() {
    updateBookingStatus(1);
  }

  void confirmCancelBooking() {
    updateBookingStatus(4);
  }

  void confirmStartService() {
    updateBookingStatus(2);
  }

  void confirmCompleteService() {
    updateBookingStatus(3);
  }

  VoidFuture updateBookingStatus(int status) async {
    _log.v('Accepting booking...');
    loading = true;
    update();
    try {
      await FirebaseFirestore.instance
          .collection(FirestoreCollections.bookings)
          .doc(bookingDetail.booking_id)
          .update({
        'booking_status': status,
      });

      EazySnackBar.buildSuccessSnackbar('Success', 'Booking Updated');
    } catch (e) {
      _log.e(e);
      EazySnackBar.buildErronSnackbar('Error', 'Something went wrong');
    } finally {
      loading = false;
      update();
    }
  }
}
