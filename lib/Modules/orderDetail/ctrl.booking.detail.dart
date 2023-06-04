import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazypizy_eazyman/Modules/orderDetail/components/accept.booking.sheet.dart';
import 'package:eazypizy_eazyman/Modules/orderDetail/components/complete.service.sheet.dart';
import 'package:eazypizy_eazyman/Modules/orderDetail/components/start.service.sheet.dart';
import 'package:eazypizy_eazyman/Modules/orderDetail/model/mdl.booking.detail.dart';
import 'package:eazypizy_eazyman/constant/firebase_collections.dart';
import 'package:eazypizy_eazyman/core/logger.dart';
import 'package:eazypizy_eazyman/core/typedefs.dart';
import 'package:eazypizy_eazyman/widgets/EasySnackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingDetailController extends GetxController {
  final _log = getLogger('OrderDetail Controller');

  late BookingDetailModel bookingDetail;
  bool loading = false;
  final TextEditingController codeController = TextEditingController();
  bool? reloadRequired;
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
    if (codeController.text.isEmpty) {
      EazySnackBar.buildErronSnackbar(
          'Empty', 'Enter Stating code to start service');
      return;
    }
    if (int.parse(codeController.text) != bookingDetail.service_start_code) {
      EazySnackBar.buildErronSnackbar(
          'Empty', 'Enter valid Stating code to start service');
      return;
    }
    updateBookingStatus(2);
  }

  void confirmCompleteService() {
    if (codeController.text.isEmpty) {
      EazySnackBar.buildErronSnackbar(
          'Empty', 'Enter Ending code to end service');
      return;
    }
    if (int.parse(codeController.text) != bookingDetail.service_start_code) {
      EazySnackBar.buildErronSnackbar(
          'Empty', 'Enter valid Ending code to end service');
      return;
    }
    updateBookingStatus(3);
  }

  VoidFuture updateBookingStatus(int status) async {
    _log.v('updating booking...');
    loading = true;
    update();
    try {
      await FirebaseFirestore.instance
          .collection(FirestoreCollections.bookings)
          .doc(bookingDetail.booking_id)
          .update({
        'booking_status': status,
      });
      getBookingDetails();
      reloadRequired = true;
      EazySnackBar.buildSuccessSnackbar('Success', 'Booking Updated');
    } catch (e) {
      _log.e(e);
      EazySnackBar.buildErronSnackbar('Error', 'Something went wrong');
    } finally {
      loading = false;
      update();
    }
  }

  VoidFuture getBookingDetails() async {
    _log.v('Getting booking details...');
    loading = true;
    update();
    try {
      final response = await FirebaseFirestore.instance
          .collection(FirestoreCollections.bookings)
          .doc(bookingDetail.booking_id)
          .get();

      bookingDetail = BookingDetailModel.fromMap(response.data()!, response.id);

      // EazySnackBar.buildSuccessSnackbar('Success', 'Booking Updated');
    } catch (e) {
      _log.e(e);
      EazySnackBar.buildErronSnackbar(
        'Error',
        'Something went wrong while fetching details',
      );
    } finally {
      loading = false;
      update();
    }
  }
}
