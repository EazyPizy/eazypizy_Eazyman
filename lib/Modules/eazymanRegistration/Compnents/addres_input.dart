import 'package:eazypizy_eazyman/Modules/eazymanRegistration/ctrl_registration.dart';
import 'package:eazypizy_eazyman/theme/app_colors.dart';
import 'package:eazypizy_eazyman/theme/eazy_spaces.dart';
import 'package:eazypizy_eazyman/widgets/EasyButtons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TakeAddress extends StatelessWidget {
  const TakeAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: GetBuilder<RegistrationController>(builder: (controller) {
        return Form(
          key: formKey,
          child: Column(
            children: [
              Text(
                'Enter Your Current City',
                style: Get.textTheme.headlineLarge
                    ?.copyWith(color: EazyColors.primary),
                textScaleFactor: 1.5,
              ),
              const SizedBox(
                child: Icon(
                  Icons.map_outlined,
                  color: Colors.green,
                  size: 100,
                ),
              ),
              Space.vertical(100.h),
              // EazyTextField.stringTextField(
              //   'Please Enter your locality',
              //   hintText: 'Locality',
              //   controller: controller.currentCity,
              // ),
              Space.vertical(12.h),
              // EazyTextField.stringTextField(
              //   'Please Enter your city',
              //   hintText: 'City',
              //   controller: controller.currentCity,
              // ),
              Space.vertical(12.h),
              // EazyTextField.stringTextField(
              //   'Please Enter your state',
              //   hintText: 'State',
              //   controller: controller.currentCity,
              // ),
            ],
          ),
        );
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            EazyButtons.flexWidthElevatedButton2(
              'Back',
              () {
                // if (_activeCurrentStep == 0) {
                //   return;
                // }

                // setState(() {
                //   _activeCurrentStep -= 1;
                // });
              },
              EazyColors.primary,
              68,
            ),
            EazyButtons.flexWidthElevatedButton(
              'Next',
              () {
                // if (_activeCurrentStep < (stepList().length - 1)) {
                //   setState(() {
                //     _activeCurrentStep += 1;
                //   });
                // } else if (_activeCurrentStep == 4) {
                //   setState(() {
                //     _activeCurrentStep += 4;
                //     controller.upload(controller.imageFile);
                //   });
                // } else {
                //   controller.submit();
                //   // controller.upload();
                // }
              },
              68,
            ),
          ],
        ),
      ),
    );
  }
}
