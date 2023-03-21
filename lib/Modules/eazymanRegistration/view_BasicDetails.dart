import 'package:eazypizy_eazyman/Modules/eazymanRegistration/ctrl_registration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';
import 'package:intl/intl.dart';

import '../../theme/app_colors.dart';
import 'Compnents/SelectServices_Tile.dart';
import 'Compnents/personal_Details_1.dart';
import 'UserImageUploadScreen.dart';

class BasicDetails extends StatefulWidget {
  static const routeName = '/BasicDetails';

  const BasicDetails({super.key});

  @override
  State<BasicDetails> createState() => _BasicDetailsState();
}

class _BasicDetailsState extends State<BasicDetails> {
  int _activeCurrentStep = 0;
  int dotCount = 5;
  bool isEmailRight = false;

  int activeStep = 0; // Initial step set to 5.

  int upperBound = 6; // upperBound MUST BE total number of icons minus 1.

  late final RegistrationController controller;

  List<Step> stepList() => [
        ///Step 1///
        Step(
            state: _activeCurrentStep <= 0
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 0,
            title: const Text('Account'),
            content: PersonalDetails1(
              controller: controller,
            )),

        ///Step 2///

        Step(
            state: _activeCurrentStep <= 1
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 1,
            title: const Text('Address'),
            content: Column(
              children: [
                const SizedBox(
                  child: Icon(
                    Icons.map_outlined,
                    color: Colors.blueAccent,
                    size: 100,
                  ),
                ),
                SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Choose Location'),
                    )),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  child: TextField(
                    controller: controller.city,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter City',
                    ),
                  ),
                ),
              ],
            )),

        ///Step 3///

        Step(
          state:
              _activeCurrentStep <= 2 ? StepState.editing : StepState.complete,
          isActive: _activeCurrentStep >= 2,
          title: const Text('Select'),
          content: const SelectServiceTile(),
        ),

        ///Step 4///

        Step(
            state: _activeCurrentStep <= 3
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 3,
            title: const Text('Select'),
            content: Column(
              children: [
                Text(
                  'Do you have Experience',
                  style: Get.textTheme.headlineLarge,
                ),
                Wrap(
                  spacing: 8,
                  children:
                  List.generate(controller.expList.length, (index) {
                    return ChoiceChip(
                      labelPadding: const EdgeInsets.all(2.0),
                      label: Text(controller.expList[index],
                          style: Get.textTheme.titleLarge
                      ),
                      selected: controller.defaultExpIndex == index,
                      selectedColor: Colors.blueAccent,
                      backgroundColor: EazyColors.white,


                      onSelected: (value) {
                        setState(() {
                          controller.defaultExpIndex =
                          value ? index : controller.defaultExpIndex;
                        });
                        print('Exp ${controller.defaultExpIndex}');
                      },
                      // backgroundColor: color,
                      elevation: 1,
                      // padding: EdgeInsets.symmetric(
                      //     horizontal: SizeConfig.widthMultiplier * 4),
                    );
                  }),
                ),

                // controller.expList == controller.expList[controller.defaultExpIndex]?
                // TextField(
                //   controller: controller.city,
                //   decoration: const InputDecoration(
                //     border: OutlineInputBorder(),
                //     labelText: 'Enter Year of Experiance',
                //   ),
                // ):Container()  ,
              ],
            )),

        ///Step 5///

        Step(
          state:
              _activeCurrentStep <= 4 ? StepState.editing : StepState.complete,
          isActive: _activeCurrentStep >= 4,
          title: const Text('Select'),
          content:  UserImageUploadScreen
            (controller: controller,),
        ),

        ///Step 6///

        Step(
          state: StepState.complete,
          isActive: _activeCurrentStep >= 5,
          title: const Text('Confirm'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Name: ${controller.name.text}'),
              Text('Email: ${controller.email.text}'),
              Text('Password: ${controller.dob.text}'),
              Text('Address : ${controller.address.text}'),
              Text('PinCode : ${controller.city.text}'),
            ],
          ),
        )
      ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = Get.put(RegistrationController());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(
              height: MediaQuery.of(context).size.height,
            ),
            child: Stepper(
              elevation: 0,
              type: StepperType.horizontal,
              currentStep: _activeCurrentStep,
              steps: stepList(),
              onStepContinue: () {
                // if (_activeCurrentStep < (stepList().length - 4)) {
                //   setState(() {
                //     _activeCurrentStep += 4;
                //   });
                // } else {
                //   controller.submit();
                // }

                if (_activeCurrentStep < (stepList().length - 1)) {
                  setState(() {
                    _activeCurrentStep += 1;
                  });
                } else {
                  controller.submit();
                 // controller.upload();
                }
              },
              onStepCancel: () {
                if (_activeCurrentStep == 0) {
                  return;
                }

                setState(() {
                  _activeCurrentStep -= 1;
                });
              },
              onStepTapped: (int index) {
                setState(() {
                  _activeCurrentStep = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
