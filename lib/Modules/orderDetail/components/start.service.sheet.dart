import 'package:eazypizy_eazyman/Modules/orderDetail/ctrl.booking.detail.dart';
import 'package:eazypizy_eazyman/theme/app_colors.dart';
import 'package:eazypizy_eazyman/widgets/EasyButtons.dart';
import 'package:eazypizy_eazyman/widgets/EazyTextField.dart';
import 'package:eazypizy_eazyman/widgets/easy_container.dart';
import 'package:eazypizy_eazyman/widgets/eazy_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> startServiceConfirmationSheet() {
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
                'Start Service',
                style: Get.textTheme.titleLarge,
                textScaleFactor: 1.5,
              ),
              EazyTextField.fullWidthTextField(
                'Enter starting code',
                controller: controller.startCodeController,
              ),
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
