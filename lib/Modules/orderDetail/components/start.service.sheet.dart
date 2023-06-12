import 'package:eazypizy_eazyman/Modules/orderDetail/ctrl.booking.detail.dart';
import 'package:eazypizy_eazyman/theme/app_colors.dart';
import 'package:eazypizy_eazyman/widgets/EasyButtons.dart';
import 'package:eazypizy_eazyman/widgets/EazyTextField.dart';
import 'package:eazypizy_eazyman/widgets/easy_container.dart';
import 'package:eazypizy_eazyman/widgets/eazy_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

Future<void> startServiceConfirmationSheet() {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                'Start Service',
                style: Get.textTheme.titleLarge,
                textScaleFactor: 1.5,
              ),
            SizedBox(
                height: 70.h,
                child: Pinput(
                  // defaultPinTheme: defaultPinTheme,
                  // focusedPinTheme: focusedPinTheme,
                  // submittedPinTheme: submittedPinTheme,
                  controller: controller.startCodeController,
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
              // EazyTextField.stringTextField(
              //   'Please Enter Code',
              //   controller: controller.startCodeController, hintText: 'Enter starting code',
              // ),
              Text(
                'Do You want to start this service',
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
                  'Start Service',
                  () {
                    controller.confirmStartService();
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
