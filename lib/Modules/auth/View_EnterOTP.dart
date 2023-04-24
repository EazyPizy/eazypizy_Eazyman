import 'package:eazypizy_eazyman/Modules/auth/ctrl_auth.dart';
import 'package:eazypizy_eazyman/widgets/EasyButtons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../theme/eazy_spaces.dart';
import '../../widgets/startpu_logo.dart';

class VerifyOTPScreen extends StatelessWidget {
  const VerifyOTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            padding: Space.scaffoldPadding,
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                StarterTopLogo(),
                const SizedBox(height: 150),
                Text(
                  "Enter OTP".tr,
                  style: Get.textTheme.titleSmall,
                  textScaleFactor: 2,
                ),
               // const SizedBox(height: 20),

                Text(
                  "Verify Your OTP",
                  style: Get.textTheme.titleLarge,
                  textScaleFactor: 2,
                ),
                const SizedBox(height: 20),


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
                const SizedBox(height: 4),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "00:00",
                      style: GoogleFonts.signika(fontSize: 10, color: Colors.green),
                      textScaleFactor: 2,
                    ),
                    TextButton(onPressed: (){}, child: Text('Send Again'))
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: EazyButtons.flexWidthElevatedButton(
                    'Continue',
                    () async {
                      // EazySnackBar.buildErronSnackbar(
                      //     "WrongOTP", "Enter again");
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => const BusinessCardSample(),
                      //   ),
                      // );
                      controller.verifyOtp();
                    },
                  ),
                ),

                Row(
                  children: [
                    Text(
                      "We have Sent OTP to xxxxxxxxxx}",
                      style: GoogleFonts.signika(),
                      textScaleFactor: 1,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Change Number"),
                    )
                  ],
                ),
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
