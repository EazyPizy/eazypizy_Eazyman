import 'package:eazypizy_eazyman/Modules/orderDetail/ctrl.booking.detail.dart';
import 'package:eazypizy_eazyman/theme/app_colors.dart';
import 'package:eazypizy_eazyman/theme/eazy_spaces.dart';
import 'package:eazypizy_eazyman/widgets/EasyButtons.dart';
import 'package:eazypizy_eazyman/widgets/easy_container.dart';
import 'package:eazypizy_eazyman/widgets/eazy_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

Future<void> completeBookingConfirmationSheet() {
  return Get.bottomSheet(
    GetBuilder<BookingDetailController>(builder: (controller) {
      return EasyContainer(
        height: 250.h,
        customBorderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(0),
            bottomLeft: Radius.circular(0),
            topLeft: Radius.circular(10)),
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
                'Complete Booking',
                style: Get.textTheme.titleLarge,
                textScaleFactor: 1.5,
              ),
              Space.vertical(12),
              SizedBox(
                height: 70.h,
                child: Pinput(
                  // defaultPinTheme: defaultPinTheme,
                  // focusedPinTheme: focusedPinTheme,
                  // submittedPinTheme: submittedPinTheme,
                  controller: controller.endCodeController,
                  length: 4,
                  //  key: some,
                  validator: (s) {
                    if ((s?.length ?? 0) < 4) {
                      return 'Enter complete digits';
                    }
                    return null;
                  },
                  onCompleted: print,
                ),
              ),
              Text(
                'Do You want to complete Booking?',
                style: Get.textTheme.titleSmall,
                // textScaleFactor: 1.5,
              ),
              const Spacer(),
              if (controller.loading)
                const Center(
                  child: EazyLoadingWidget(),
                )
              else
                EazyButtons.flexWidthElevatedButton(
                  'Complete Booking',
                  () {
                    controller.confirmCompleteService();
                    Get.back();
                  },
                  40.h,
                ),
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
