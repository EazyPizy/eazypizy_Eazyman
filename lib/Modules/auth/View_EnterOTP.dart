import 'package:eazypizy_eazyman/Modules/auth/ctrl_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class VerifyOTPScreen extends StatelessWidget {
  const VerifyOTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(child: SizedBox()),
                Text(
                  "Verify Your OTP",
                  style: GoogleFonts.signika(),
                  textScaleFactor: 2,
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
                Pinput(
                  // defaultPinTheme: defaultPinTheme,
                  // focusedPinTheme: focusedPinTheme,
                  // submittedPinTheme: submittedPinTheme,
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
                //  const TradzeeTextField(hintText: 'Enter OTP'),
                const SizedBox(height: 10),
                Text(
                  "Timer ",
                  style: GoogleFonts.signika(fontSize: 10, color: Colors.green),
                  textScaleFactor: 2,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () async {
                        // EazySnackBar.buildErronSnackbar(
                        //     "WrongOTP", "Enter again");
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => const BusinessCardSample(),
                        //   ),
                        // );
                        controller.verifyOtp();
                      },
                      child: const Text("Continue"),
                    ),
                  ),
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
