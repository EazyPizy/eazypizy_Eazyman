import 'package:eazypizy_eazyman/widgets/CarouselImage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'View_EnterOTP.dart';
import 'package:get/get.dart';

class InputMobileNumberScreen extends StatefulWidget {
  static const routeName = '/input-mobile-screen';

  const InputMobileNumberScreen({super.key});

  @override
  State<InputMobileNumberScreen> createState() =>
      _InputMobileNumberScreenState();
}

class _InputMobileNumberScreenState extends State<InputMobileNumberScreen> {
  bool isLoading = false;

  TextEditingController phoneNumber = TextEditingController();
  TextEditingController otpCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 400,
                child: const Carousel(
                  autoplay: true,
                  width: double.infinity,
                ),
              ),
              Text(
                "Enter Your Mobile Number".tr,
                style: Get.textTheme.titleLarge,
                textScaleFactor: 1.5,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: phoneNumber,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Mobile Number',
                    labelStyle: TextStyle(
                      color: Color(0xFF6200EE),
                    ),
                    helperText: 'We will send OTP to verify your mobile number',
                    suffixStyle: TextStyle()
                    // suffixIcon: Icon(
                    //   Icons.check_circle,
                    // ),
                    // enabledBorder: UnderlineInputBorder(
                    //   borderSide: BorderSide(color: Color(0xFF6200EE)),
                    // ),
                    ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const VerifyOTPScreen()));
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
  }
}
