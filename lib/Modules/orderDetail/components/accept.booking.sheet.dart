import 'package:eazypizy_eazyman/Modules/orderDetail/ctrl.booking.detail.dart';
import 'package:eazypizy_eazyman/theme/app_colors.dart';
import 'package:eazypizy_eazyman/widgets/EasyButtons.dart';
import 'package:eazypizy_eazyman/widgets/EasySnackBar.dart';
import 'package:eazypizy_eazyman/widgets/easy_container.dart';
import 'package:eazypizy_eazyman/widgets/eazy_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/eazy_spaces.dart';

Future<void> acceptBookingConfirmationSheet() {
  return Get.bottomSheet(
    GetBuilder<BookingDetailController>(builder: (controller) {
      return EasyContainer(
        customBorderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(0),
            bottomLeft: Radius.circular(0),
            topLeft: Radius.circular(10)),
        height: 250.h,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.cancel,
                    )),
              ),
              Text(
                'Accept Booking',
                style: Get.textTheme.titleLarge,
                textScaleFactor: 1.5,
              ),
              Text(
                'Do You want to accept this new order',
                style: Get.textTheme.titleSmall,
                // textScaleFactor: 1.5,
              ),
              const Spacer(),
              if (controller.loading)
                const Center(
                  child: EazyLoadingWidget(),
                )
              else
                EazyButtons.fullWidthShareButton(
                  'Yes, Accept Order',
                  () {
                    controller.confirmAcceptBooking();
                    Get.back();
                  },
                ),
              Space.vertical(10.h)
            ],
          ),
        ),
      );
    }),
    backgroundColor: EazyColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  );
}
