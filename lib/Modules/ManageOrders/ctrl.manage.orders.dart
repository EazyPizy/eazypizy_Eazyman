import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazypizy_eazyman/Modules/orderDetail/model/mdl.booking.detail.dart';
import 'package:eazypizy_eazyman/constant/firebase_collections.dart';
import 'package:eazypizy_eazyman/core/logger.dart';
import 'package:eazypizy_eazyman/core/routes.dart';
import 'package:eazypizy_eazyman/core/services/user_service.dart';
import 'package:eazypizy_eazyman/core/typedefs.dart';
import 'package:eazypizy_eazyman/widgets/EasySnackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../theme/eazy_spaces.dart';

class ManageOrderController extends GetxController {
  final Logger _log = getLogger('ManageOrder Controller');
  final List<BookingDetailModel> bookings = [];
  bool loadingBookings = false;

  VoidFuture getBookings() async {
    final eazymen = EazyMenService.instance.eazyMen;
    loadingBookings = true;
    update();
    _log.v('Getting bookings...');
    try {
      final data = await FirebaseFirestore.instance
          .collection(FirestoreCollections.bookings)
          .where('eazymen_id', isEqualTo: eazymen!.eazyManUid)
          .orderBy('booking_date', descending: true)
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

  VoidFuture toDetails(BookingDetailModel booking) async {
    final routeResult =
        await Get.toNamed(Routes.detailOrderScreen, arguments: booking);
    _log.i(routeResult);
    if (routeResult != null) {
      getBookings();
    }
  }

  Widget convertBookingStatus(
    int status,
  ) {
    switch (status) {
      case 0:
        return Row(
          children: [
            const Icon(
              Icons.circle,
              color: Colors.orange,
              size: 10,
            ),
            Space.horizontal(4),
            Text('Booking Request', style: Get.textTheme.titleMedium),
          ],
        );
      case 1:
        return Row(children: [
          const Icon(
            Icons.circle,
            color: Colors.yellow,
            size: 10,
          ),
          Space.horizontal(10),
          Text('Pending', style: Get.textTheme.titleMedium)
        ]);
      case 2:
        return Row(
          children: [
            const Icon(
              Icons.circle,
              color: Colors.blue,
              size: 10,
            ),
            Space.horizontal(10),
            Text(
              'Working',
              style: Get.textTheme.titleMedium,
            ),
          ],
        );
      case 3:
        return Row(
          children: [
            const Icon(
              Icons.circle,
              color: Colors.green,
              size: 10,
            ),
            Space.horizontal(10),
            Text('Done', style: Get.textTheme.titleMedium),
          ],
        );
      case 4:
        return Row(
          children: [
            const Icon(
              Icons.circle,
              color: Colors.red,
              size: 10,
            ),
            Space.horizontal(10),
            Text('Canceled', style: Get.textTheme.titleMedium),
          ],
        );
      default:
        return Row(
          children: [
            const Icon(
              Icons.circle,
              color: Colors.yellow,
              size: 10,
            ),
            Space.horizontal(10),
            Text('Pending', style: Get.textTheme.titleMedium),
          ],
        );
    }
  }

  // Widget convertBookingStatus(int status,) {
  //   switch (status) {
  //     case 0:
  //       return  Text('Booking Request',style: TextStyle(color: Colors.red),);
  //     case 1:
  //       return 'Pending';
  //     case 2:
  //       return 'Working';
  //     case 3:
  //       return 'Done';
  //     case 4:
  //       return 'Canceled';
  //     default:
  //       return 'Pending';
  //   }
  // }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getBookings();
  }
}
