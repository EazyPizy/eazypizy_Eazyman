
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'View_EnterOTP.dart';

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
              // const StarterTopLogo(),
              const SizedBox(height: 80),
              Text(
                "Enter Your Mobile Number",
                style: GoogleFonts.signika(fontSize: 15),
                textScaleFactor: 1.5,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: phoneNumber,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: const InputDecoration(
                  //icon: Icon(Icons.favorite),
                  prefix: Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("+91"),
                      )),

                  labelText: 'Mobile Number',
                  labelStyle: TextStyle(
                    color: Color(0xFF6200EE),
                  ),
                  helperText: '"We will send OTP to verify your mobile number"',
                  // suffixIcon: Icon(
                  //   Icons.check_circle,
                  // ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6200EE)),
                  ),
                ),
              ),
              // TradzeeTextField(
              //   maxLegnt: 10,
              //   keyboardType: TextInputType.number,
              //   controller: phoneNumber,
              //   hintText: "Mobile Number",
              //   helperText: "We will send OTP to verify your mobile number",
              //   lableText: "Mobile Number",
              //   // errorText: "Enter Number",
              // ),

              const SizedBox(height: 15),
              //  Text("We will send OTP to verify your mobile number"),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const VerifyOTPScreen(
                          )));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: const Text('Get OTP'),
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
  }
}
