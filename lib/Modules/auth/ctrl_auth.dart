import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazypizy_eazyman/Modules/auth/View_EnterOTP.dart';
import 'package:eazypizy_eazyman/core/logger.dart';
import 'package:eazypizy_eazyman/core/routes.dart';
import 'package:eazypizy_eazyman/core/services/user_service.dart';
import 'package:eazypizy_eazyman/widgets/EasySnackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class AuthenticationController extends GetxController {
  final Logger _log = getLogger('Authentication Controller');

  final mobileNumberController = TextEditingController();
  final otpController = TextEditingController();
  bool loading = false;
  late String _verificationId;
  late String enteredNo;

  Future<void> verifyOtp() async {
    final otp = otpController.text.trim();
    if (otp.isEmpty || otp.length < 6) {
      return EazySnackBar.buildErronSnackbar('Fields Empty', 'Enter OTP');
    }
    _log.i('OTP - $otp');
    await _signIn(
      PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: otp,
      ),
    );
  }

  Future<void> _signIn(PhoneAuthCredential credentials) async {
    loading = true;
    update();
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
        EazyMenService.instance.fetchEazymenData();
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
    } finally {
      loading = false;
      update();
    }
  }

  Future<void> sendOtp() async {
    loading = true;
    update();
    enteredNo = mobileNumberController.text.trim();
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
          loading = false;
          update();
          EazySnackBar.buildSnackbar('OTP Sent', 'OTP sent on given number');
          Get.to(const VerifyOTPScreen());
        },
        codeAutoRetrievalTimeout: (verificationId) {
          _log.v('codeAutoRetrievalTimeout');
        },
      );
    } catch (e) {
      _log.e(e);
    } finally {
      // loading = false;
      // update();
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

  final _firebaseAuth = FirebaseAuth.instance;

  Future<void> logout() async {
    await _firebaseAuth.signOut();
    // TODO: delete from offline storage
  }
}
