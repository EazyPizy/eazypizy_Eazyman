import 'package:eazypizy_eazyman/Modules/orderDetail/ctrl.booking.detail.dart';
import 'package:eazypizy_eazyman/theme/app_colors.dart';
import 'package:eazypizy_eazyman/widgets/EasyButtons.dart';
import 'package:eazypizy_eazyman/widgets/EazyTextField.dart';
import 'package:eazypizy_eazyman/widgets/easy_container.dart';
import 'package:eazypizy_eazyman/widgets/eazy_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> completeBookingConfirmationSheet() {
  return Get.bottomSheet(
    GetBuilder<BookingDetailController>(builder: (controller) {
      return EasyContainer(
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
                      size: 20,
                      color: EazyColors.primary,
                    )),
              ),
              Text(
                'Complete Booking',
                style: Get.textTheme.titleLarge,
                textScaleFactor: 1.5,
              ),
              EazyTextField.fullWidthTextField(
                'Enter Ending code',
                controller: controller.codeController,
              ),
              Text(
                'Do You want to complete Booking',
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