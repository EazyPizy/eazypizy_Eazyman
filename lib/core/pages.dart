import 'package:eazypizy_eazyman/Modules/BottomNavigationBar/View_Bottom_Navigation_Bar.dart';
import 'package:eazypizy_eazyman/Modules/ChooseLanguage/view_ChooseLanguage.dart';
import 'package:eazypizy_eazyman/Modules/auth/View_EnterMobileNumber.dart';
import 'package:eazypizy_eazyman/Modules/auth/View_EnterOTP.dart';
import 'package:eazypizy_eazyman/Modules/eazymanRegistration/viewBusinessCardSample.dart';
import 'package:eazypizy_eazyman/Modules/eazymanRegistration/view_basicDetails.dart';
import 'package:eazypizy_eazyman/core/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<GetPage> pages = [
  GetPage(
    name: Routes.HOME,
    page: SizedBox.new,
  ),
  GetPage(
    name: Routes.BasicDetails,
    page: SizedBox.new,
  ),
  GetPage(
    name: Routes.basicDetailsScreen,
    page: () => const BasicDetails(),
  ),
  GetPage(
    name: Routes.bussinessCardScreen,
    page: () => const BusinessCardSample(),
  ),
  GetPage(
    name: Routes.choseLanguage,
    page: () => ChooseLanguageScreen(),
  ),
  GetPage(
    name: Routes.enterMobileNumber,
    page: () => const InputMobileNumberScreen(),
  ),
  GetPage(
    name: Routes.enterOtp,
    page: () => const VerifyOTPScreen(),
  ),
  GetPage(
    name: Routes.navigationScreen,
    page: () => const NavigationView(),
  ),
];
