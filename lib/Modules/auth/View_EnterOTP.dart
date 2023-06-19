import 'package:eazypizy_eazyman/Modules/auth/ctrl_auth.dart';
import 'package:eazypizy_eazyman/widgets/EasyButtons.dart';
import 'package:eazypizy_eazyman/widgets/eazy_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../theme/app_colors.dart';
import '../../theme/eazy_spaces.dart';
import '../../widgets/startpu_logo.dart';

class VerifyOTPScreen extends StatelessWidget {
  const VerifyOTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),

                const StarterTopLogo(),
                SizedBox(height: 130.h),
                Text(
                  "Verify Your OTP",
                  style: Get.textTheme.titleLarge
                      ?.copyWith(color: EazyColors.primary),
                  textScaleFactor: 2,
                ),
                Row(
                  children: [
                    Text(
                      "We have Sent OTP to ${controller.enteredNo}",
                      style: GoogleFonts.signika(),
                      textScaleFactor: 1,
                    ),
                    Space.horizontal(10.w),
                    EazyButtons.primaryTextButton('Change Number', () {
                      Get.back();
                    }),
                  ],
                ),

                SizedBox(height: 20.h),
                Pinput(
                  controller: controller.otpController,
                  length: 6,
                  validator: (s) {
                    if ((s?.length ?? 0) < 6) {
                      return 'Enter complete digits';
                    }
                    return null;
                  },
                  onCompleted: print,
                ),
                // const SizedBox(height: 4),
                // const SizedBox(height: 10),
                // Row(
                //   children: [
                //     Text(
                //       "00:00",
                //       style: Get.textTheme.titleSmall?.copyWith(color: Colors.green),
                //       textScaleFactor: 2,
                //     ),
                //     Space.horizontal(10.w)  ,
                //     EazyButtons.primaryTextButton('Send Again', () { }),
                //   ],
                // ),
                const Spacer(),
                if (controller.loading)
                  const Center(
                    child: EazyLoadingWidget(),
                  )
                else
                  EazyButtons.fullWidthElevatedButton('Verify OTP', () {
                    controller.verifyOtp();
                  })

                // Align(
                //   alignment: Alignment.centerRight,
                //   child: EazyButtons.flexWidthElevatedButton(
                //     'Continue',
                //     () async {
                //       // EazySnackBar.buildErronSnackbar(
                //       //     "WrongOTP", "Enter again");
                //       // Navigator.of(context).push(
                //       //   MaterialPageRoute(
                //       //     builder: (context) => const BusinessCardSample(),
                //       //   ),
                //       // );
                //       controller.verifyOtp();
                //     },40
                //   ),
                // ),

                // const Expanded(
                //   child: Align(
                //     alignment: Alignment.centerRight,
                //     child: WorkerManImage(),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
