import 'package:carousel_slider/carousel_slider.dart';
import 'package:eazypizy_eazyman/Modules/auth/ctrl_auth.dart';
import 'package:eazypizy_eazyman/widgets/CarouselImage.dart';
import 'package:eazypizy_eazyman/widgets/EasyButtons.dart';
import 'package:eazypizy_eazyman/widgets/EasySnackBar.dart';
import 'package:eazypizy_eazyman/widgets/EazyTextField.dart';
import 'package:eazypizy_eazyman/widgets/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../theme/app_colors.dart';
import '../../theme/eazy_spaces.dart';
import '../../widgets/startpu_logo.dart';

class InputMobileNumberScreen extends StatelessWidget {
  const InputMobileNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      'https://mykit.in/crm/public/uploads/website_section_image/LyOFHmLMIYWEgG8tsBXweUQN7sTCsu.jpg',
      'https://mykit.in/crm/public/uploads/website_section_image/uZ4cJcyKU1PMyIihywU9qyaWzjojB0.jpg',
      'https://mykit.in/crm/public/uploads/website_section_image/BPCbXgEuhKDSpPTsAVXNKZKc26GDQo.jpg',
      'https://mykit.in/crm/public/uploads/website_slider_images/lHXqadJX5rvVfDY14xpuhC35hnioqO.jpg'
    ];
    return GetBuilder(
        init: AuthenticationController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Space.vertical(20.h),
                    const StarterTopLogo(),
                    Space.vertical(130.h),
                    Text(
                      "Enter Your Mobile Number".tr,
                      style: Get.textTheme.titleLarge
                          ?.copyWith(color: EazyColors.primary),
                      textScaleFactor: 2,
                    ),
                    Space.vertical(20.h),

                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          EasyContainer(
                              color: EazyColors.background,
                              borderColor: EazyColors.primary,
                              padding: 10,
                              showBorder: true,
                              height: 55.h,
                              child: const Text('+ 91')),
                          Space.horizontal(
                            10.h,
                          ),
                          Flexible(
                            child: SizedBox(
                              //width: 200.w,
                              height: 75.h,
                              child: TextFormField(
                                autovalidateMode: AutovalidateMode.always,
                                controller: controller.mobileNumberController,
                                keyboardType: TextInputType.number,

                                maxLength: 10,
                                decoration: InputDecoration(

                                  border: const OutlineInputBorder(

                                    borderSide: BorderSide(
                                      width: 5,

                                      color: EazyColors.primary
                                    )


                                  ),
                                  labelText: 'Mobile Number'.tr,

                                  labelStyle:
                                      const TextStyle(color: EazyColors.primary),
                                  helperText:
                                      'We will send OTP to verify your mobile number',
                                  suffixStyle:
                                      const TextStyle(color: EazyColors.primary),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    EazyButtons.fullWidthElevatedButton('Get OTP', () {
                      controller.sendOtp();
                    }),

                    // Align(
                    //   alignment: Alignment.bottomRight,
                    //   child: EazyButtons.flexWidthElevatedButton(
                    //     'Get OTP'.tr,
                    //     () {
                    //       controller.sendOtp();
                    //     },40
                    //   ),
                    // ),
                    Space.vertical(50.h),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
