import 'package:eazypizy_eazyman/widgets/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';

import 'Compnents/SelectServices_Tile.dart';
import 'UserImageUploadScreen.dart';

// enum Gender { male, female, other }

class BasicDetails extends StatefulWidget {
  static const routeName = '/BasicDetails';

  BasicDetails({super.key});

  @override
  State<BasicDetails> createState() => _BasicDetailsState();
}

class _BasicDetailsState extends State<BasicDetails> {
  int _activeCurrentStep = 0;
  int dotCount = 5;

  int activeStep = 0; // Initial step set to 5.

  int upperBound = 6; // upperBound MUST BE total number of icons minus 1.

  TextEditingController name = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController pass = TextEditingController();

  TextEditingController address = TextEditingController();

  TextEditingController pincode = TextEditingController();

  List<Step> stepList() => [
        Step(
          state:
              _activeCurrentStep <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeCurrentStep >= 0,
          title: Column(
            children: [
              Icon(Icons.access_alarm),
              const Text('Account'),
            ],
          ),
          content: EasyContainer(
            child: Column(
              children: [
                TextField(
                  controller: name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full Name',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: email,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: pass,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ],
            ),
          ),
        ),
        Step(
            state: _activeCurrentStep <= 1
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 1,
            subtitle: Text(
              'subtitle',
              style: Get.textTheme.titleSmall,
            ),
            title: const Text('Address'),
            content: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: address,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Full House Address',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: pincode,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Pin Code',
                    ),
                  ),
                ],
              ),
            )),
        Step(
            state: _activeCurrentStep <= 2
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 2,
            title: const Text('Select'),
            content: const SelectServiceTile()),
        Step(
            state: _activeCurrentStep <= 3
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 3,
            title: const Text('Select'),
            content: const UserImageUploadScreen()),
        Step(
            state: StepState.complete,
            isActive: _activeCurrentStep >= 4,
            title: const Text('Confirm'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Name: ${name.text}'),
                Text('Email: ${email.text}'),
                Text('Password: ${pass.text}'),
                Text('Address : ${address.text}'),
                Text('PinCode : ${pincode.text}'),
              ],
            ))
      ];

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Registration', style: Get.textTheme.titleMedium),
        ),
        body: ConstrainedBox(
          constraints: BoxConstraints.tightFor(
              height: MediaQuery.of(context).size.height - 20),
          child: Stepper(
            elevation: 0,
            type: StepperType.horizontal,
            currentStep: _activeCurrentStep,
            steps: stepList(),
            onStepContinue: () {
              if (_activeCurrentStep < (stepList().length - 1)) {
                setState(() {
                  _activeCurrentStep += 1;
                });
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
    );
  }
}
