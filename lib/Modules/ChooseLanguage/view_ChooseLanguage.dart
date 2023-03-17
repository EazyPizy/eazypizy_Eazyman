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
                "Choose Your Language",
                textScaleFactor: 1.2,
                style: Get.textTheme.titleLarge,
                textDirection: TextDirection.ltr,
              ),
              const SizedBox(height: 24),
              const LanguageSelectionTile(),
              const SizedBox(height: 16),
              const LanguageSelectionTile(),
              const SizedBox(height: 16),
              const LanguageSelectionTile(),
              const SizedBox(height: 16),
              Expanded(
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const InputMobileNumberScreen()));
                    },
                    child: const Text("Continue"),
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
