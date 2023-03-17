import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../eazymanResigstration/viewBusinessCardSample.dart';

class VerifyOTPScreen extends StatefulWidget {
  //static const routeName = '/verify-otp-screen';


  const VerifyOTPScreen( {super.key}
      );

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {

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
                      child: const Text("Change Number"))
                ],
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: const InputDecoration(
                  helperText: 'Resend OTP In',
                  errorText: "Enter OTP",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6200EE)),
                  ),
                ),
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const BusinessCardSample(
                          )));
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
  }







}
