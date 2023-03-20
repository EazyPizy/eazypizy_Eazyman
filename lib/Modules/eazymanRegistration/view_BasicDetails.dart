import 'package:eazypizy_eazyman/Modules/eazymanRegistration/ctrl_registration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Compnents/SelectServices_Tile.dart';
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

  int activeStep = 0; // Initial step set to 5.

  int upperBound = 6; // upperBound MUST BE total number of icons minus 1.

  late final RegistrationController controller;

  List<Step> stepList() => [
        Step(
          state:
              _activeCurrentStep <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeCurrentStep >= 0,
          title: const Text('Account'),
          content: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: TextField(
                      controller: controller.name,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Full Name',
                        // hintText: 'Full name'
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      controller: controller.email,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 50,
                    child: TextField(
                      // controller: pass,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Date of birth',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Chip(
                        label: Text("Male"),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Chip(
                        label: Text("Female"),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Step(
            state: _activeCurrentStep <= 1
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 1,
            title: const Text('Address'),
            content: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  child: TextField(
                    controller: controller.address,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Location',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  child: TextField(
                    controller: controller.pincode,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Pin Code',
                    ),
                  ),
                ),
              ],
            )),
        Step(
          state:
              _activeCurrentStep <= 2 ? StepState.editing : StepState.complete,
          isActive: _activeCurrentStep >= 2,
          title: const Text('Select'),
          content: const SelectServiceTile(),
        ),
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
                Row(
                  children: const [
                    Chip(
                      label: Text("Yes"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Chip(
                      label: Text("No"),
                    ),
                  ],
                ),
              ],
            )),
        Step(
          state:
              _activeCurrentStep <= 4 ? StepState.editing : StepState.complete,
          isActive: _activeCurrentStep >= 4,
          title: const Text('Select'),
          content: const UserImageUploadScreen(),
        ),
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
              Text('Password: ${controller.pass.text}'),
              Text('Address : ${controller.address.text}'),
              Text('PinCode : ${controller.pincode.text}'),
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
              type: StepperType.vertical,
              currentStep: _activeCurrentStep,
              steps: stepList(),
              onStepContinue: () {
                if (_activeCurrentStep < (stepList().length - 1)) {
                  setState(() {
                    _activeCurrentStep += 1;
                  });
                } else {
                  controller.submit();
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
