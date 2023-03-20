import 'package:eazypizy_eazyman/Modules/auth/ctrl_auth.dart';
import 'package:eazypizy_eazyman/widgets/CarouselImage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputMobileNumberScreen extends StatelessWidget {
  const InputMobileNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: AuthenticationController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 400,
                      child: Carousel(
                        autoplay: true,
                        width: double.infinity,
                      ),
                    ),
                    Text(
                      "Enter Your Mobile Number",
                      style: Get.textTheme.titleLarge,
                      textScaleFactor: 1.5,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controller.mobileNumberController,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Mobile Number',
                        labelStyle: TextStyle(
                          color: Color(0xFF6200EE),
                        ),
                        helperText:
                            'We will send OTP to verify your mobile number',
                        suffixStyle: TextStyle(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.sendOtp();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: const Text('Get OTP'),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
