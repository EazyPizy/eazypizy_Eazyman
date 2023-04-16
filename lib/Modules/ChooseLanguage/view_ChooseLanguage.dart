import 'package:eazypizy_eazyman/Modules/onBoarding_Screen/View_OnBoarding_Screens.dart';
import 'package:eazypizy_eazyman/theme/app_colors.dart';
import 'package:eazypizy_eazyman/widgets/EasyButtons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/easy_container.dart';
import '../BottomNavigationBar/View_Bottom_Navigation_Bar.dart';
import 'Components/language_selection_tile.dart';

class ChooseLanguageScreen extends StatefulWidget {
  static String routeName = '/choose-language-screen';

  ChooseLanguageScreen({super.key});

  @override
  State<ChooseLanguageScreen> createState() => _ChooseLanguageScreenState();
}

bool selected = false;

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
                textScaleFactor: 1.8,
                style: Get.textTheme.titleLarge,
                textDirection: TextDirection.ltr,
              ),
              const SizedBox(height: 24),
              EasyContainer(
                  borderRadius: 10,
                  height: 75,
                  color: EazyColors.white,
                  showBorder: true,
                  borderColor: selected ? EazyColors.primary : Colors.grey,
                  onTap: () {
                    setState(() {
                      Get.updateLocale(const Locale('hi', ' '));
                      selected = true;
                    });
                  },
                  child: ListTile(
                      leading: const Icon(
                        Icons.sort_by_alpha,
                        color: Colors.grey,
                      ),
                      title: Text(
                        'language1'.tr,
                        style: const TextStyle(color: Colors.black),
                      ),
                      trailing: selected
                          ? Icon(
                              Icons.radio_button_on,
                              color: EazyColors.primary,
                            )
                          //: Icons.radio_button_off),
                          : Icon(
                              Icons.radio_button_off,
                              color: Colors.grey,
                            ))),
              const SizedBox(height: 24),
              EasyContainer(
                borderRadius: 10,
                height: 75,
                color: EazyColors.white,
                showBorder: true,
                onTap: () {
                  setState(() {
                    Get.updateLocale(const Locale('en', 'US'));
                    selected = false;
                  });
                },
                borderColor: selected ? Colors.grey : EazyColors.primary,
                child: ListTile(
                  leading: const Icon(Icons.sort_by_alpha),
                  title: Text(
                    'language2'.tr,
                    style: TextStyle(color: Colors.black),
                  ),
                    trailing: selected
                        ? Icon(
                      Icons.radio_button_off,
                      color: Colors.grey,
                    )
                    //: Icons.radio_button_off),
                        : Icon(
                      Icons.radio_button_on,
                      color: EazyColors.primary,
                    )
                ),
              ),
              Spacer(),
              Expanded(
                child: Center(
                  child: EazyButtons.fullWidthElevatedButton('Continue'.tr, () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const OnBoardingScreens()));
                  }),
                ),
              ),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: () {
        //     Navigator.of(context).push(MaterialPageRoute(
        //         builder: (context) => const NavigationView()));
        //   },
        //   label: const Text("Skip"),
        // ),
      ),
    );
  }
}
