import 'package:eazypizy_eazyman/Modules/onBoarding_Screen/View_OnBoarding_Screens.dart';
import 'package:flutter/material.dart';

import '../BottomNavigationBar/View_Bottom_Navigation_Bar.dart';
import '../SignUp_OR_SignIn/View_EnterMobileNumber.dart';
import 'Components/language_selection_tile.dart';
import 'package:get/get.dart';

class ChooseLanguageScreen extends StatefulWidget {
  static String routeName = '/choose-language-screen';

  ChooseLanguageScreen({super.key});

  bool selected = false;

  @override
  State<ChooseLanguageScreen> createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
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
              const SizedBox(height: 40),
              Text(
                "msg".tr,
                textScaleFactor: 1.2,
                style: Get.textTheme.titleLarge,
                textDirection: TextDirection.ltr,
              ),
              const SizedBox(height: 24),
              ListTile(
                onTap: () {
                  Get.updateLocale(const Locale('hi',' '));
                },
                leading: const Icon(Icons.sort_by_alpha),
                title: Text(
                  'language1'.tr,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              ListTile(
                onTap: () {
                  Get.updateLocale(const Locale('en', 'US'));
                },
                leading: const Icon(Icons.sort_by_alpha),
                title: Text(
                  'language2'.tr,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              Expanded(
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const OnBoardingScreens()));
                    },
                    child:  Text("Continue".tr),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const NavigationView()));
          },
          label: const Text("Skip"),
        ),
      ),
    );
  }
}
