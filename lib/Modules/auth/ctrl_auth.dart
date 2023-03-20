import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazypizy_eazyman/Modules/auth/View_EnterOTP.dart';
import 'package:eazypizy_eazyman/core/logger.dart';
import 'package:eazypizy_eazyman/core/routes.dart';
import 'package:eazypizy_eazyman/widgets/EasySnackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class AuthenticationController extends GetxController {
  final Logger _log = getLogger('Authentication Controller');

  final mobileNumberController = TextEditingController();
  final otpController = TextEditingController();

  late String _verificationId;

  Future<void> verifyOtp() async {
    final otp = otpController.text.trim();
    _log.i('OTP - $otp');
    await _signIn(
      PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: otp,
      ),
    );
  }

  Future<void> _signIn(PhoneAuthCredential credentials) async {
    try {
      _log.v('signing in...');
      final userCredentials = await FirebaseAuth.instance.signInWithCredential(
        credentials,
      );
      if (userCredentials.additionalUserInfo?.isNewUser == true) {
        EazySnackBar.buildSuccessSnackbar(
            'Welcome!', 'Hope you enjoy this new journey!');
      } else {
        EazySnackBar.buildSuccessSnackbar('Login Successfull', 'Welcome back!');
      }

      final eazyMenData = await FirebaseFirestore.instance
          .collection('EazyMen')
          .doc(userCredentials.user!.uid)
          .get();

      if (eazyMenData.exists) {
        Get.toNamed(Routes.navigationScreen);
      } else {
        Get.toNamed(Routes.bussinessCardScreen);
      }

      // if (userCredentials.additionalUserInfo?.isNewUser == true) {
      //   _log.v('new customer, setting customer...');
      //   final customer = CustomerModel(
      //     id: userCredentials.user!.uid,
      //     phoneNumber: userCredentials.user!.phoneNumber!,
      //   );
      //   await FirebaseFirestore.instance
      //       .collection('EazyMen')
      //       .doc(customer.id)
      //       .set(customer.toJson());
      // } else {
      //   /// if old user
      // }
      // Get.back();
      // Get.back();
    } on FirebaseAuthException catch (e) {
      _log.e(e);
      if (e.code == 'invalid-verification-code') {
        EazySnackBar.buildSnackbar('Invalid OTP!', 'Wrong OTP code entered.');
      }
    } catch (e) {
      _log.e(e);
    }
  }

  Future<void> sendOtp() async {
    final number = mobileNumberController.text.trim();
    _log
      ..v('Sending OTP...')
      ..i(number);
    try {
      _validateNumber(mobileNumberController);
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91 $number',
        verificationCompleted: (phoneAuthCredential) {
          _log.v('Verification completed');
          _signIn(phoneAuthCredential);
        },
        verificationFailed: (error) {
          _log
            ..v('verificationFailed:')
            ..i(error);
        },
        codeSent: (verificationId, forceResendingToken) {
          _log.v('OTP sent');
          _verificationId = verificationId;
          EazySnackBar.buildErronSnackbar(
              'OTP Sent', 'OTP sent on given number');
          Get.to(const VerifyOTPScreen());
        },
        codeAutoRetrievalTimeout: (verificationId) {
          _log.v('codeAutoRetrievalTimeout');
        },
      );
    } catch (e) {
      _log.e(e);
    }
  }

  void _validateNumber(TextEditingController mobileNumberController) {}

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    otpController.dispose();
    mobileNumberController.dispose();
  }
}
