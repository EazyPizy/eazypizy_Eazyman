import 'package:eazypizy_eazyman/Modules/eazymanRegistration/ctrl_registration.dart';
import 'package:eazypizy_eazyman/widgets/EasyButtons.dart';
import 'package:eazypizy_eazyman/widgets/EasySnackBar.dart';
import 'package:eazypizy_eazyman/widgets/EazyTextField.dart';
import 'package:eazypizy_eazyman/widgets/easy_container.dart';
import 'package:eazypizy_eazyman/widgets/eazy_loading.dart';
import 'package:eazypizy_eazyman/widgets/startpu_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/app_colors.dart';
import '../../theme/eazy_spaces.dart';
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
          // state: StepState.disabled,
          state:
              _activeCurrentStep <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeCurrentStep >= 0,
          title: const Text('Basic Details'),
          content: const PersonalDetails1(),
        ),

        ///Step 2///

        Step(
          //state: StepState.disabled,

          state:
              _activeCurrentStep <= 1 ? StepState.editing : StepState.complete,
          isActive: _activeCurrentStep >= 1,
          title: const Text('Locations'),
          content: Form(
            key: controller.addressformKey,
            child: Column(
              children: [
                Text(
                  'Enter Your Current City',
                  style: Get.textTheme.headlineLarge
                      ?.copyWith(color: EazyColors.primary),
                  textScaleFactor: 1.5,
                ),
                const SizedBox(
                  child: Icon(
                    Icons.map_outlined,
                    color: Colors.green,
                    size: 100,
                  ),
                ),
                Space.vertical(100.h),
                EazyTextField.stringTextField(
                  'Please Enter your locality',
                  hintText: 'Locality',
                  controller: controller.localityController,
                ),
                Space.vertical(12.h),
                EazyTextField.stringTextField(
                  'Please Enter your city',
                  hintText: 'City',
                  controller: controller.cityController,
                ),
                Space.vertical(12.h),
                EazyTextField.stringTextField(
                  'Please Enter your state',
                  hintText: 'State',
                  controller: controller.stateController,
                ),
              ],
            ),
          ),
        ),

        ///Step 3///

        Step(
          state:
              _activeCurrentStep <= 2 ? StepState.editing : StepState.complete,
          isActive: _activeCurrentStep >= 2,
          title: const Text('Select Services'),
          content: const SelectServiceTile(),
        ),

        ///Step 4///

        // Step(
        //     state: _activeCurrentStep <= 3
        //         ? StepState.editing
        //         : StepState.complete,
        //     isActive: _activeCurrentStep >= 3,
        //     title: const Text('4'),
        //     content: Column(
        //       children: [
        //         Text(
        //           'Do you have Experience',
        //           style: Get.textTheme.headlineLarge
        //               ?.copyWith(color: EazyColors.primary),
        //           textScaleFactor: 1.5,
        //         ),
        //         Space.vertical(50.h),
        //         Wrap(
        //           spacing: 8,
        //           children: List.generate(controller.expList.length, (index) {
        //             return ChoiceChip(
        //               labelPadding: const EdgeInsets.all(2.0),
        //               label: Text(
        //                 controller.expList[index],
        //               ),
        //               selected: controller.defaultExpIndex == index,
        //               selectedColor: EazyColors.primary,
        //               backgroundColor: EazyColors.white,
        //               disabledColor: EazyColors.white,
        //               labelStyle: (controller.defaultExpIndex == index)
        //                   ? const TextStyle(color: EazyColors.white)
        //                   : const TextStyle(color: EazyColors.primary),
        //               onSelected: (value) {
        //                 setState(() {
        //                   controller.defaultExpIndex =
        //                       value ? index : controller.defaultExpIndex;
        //                 });
        //                 print('Exp ${controller.defaultExpIndex}');
        //               },
        //               // backgroundColor: color,
        //               elevation: 1,
        //               // padding: EdgeInsets.symmetric(
        //               //     horizontal: SizeConfig.widthMultiplier * 4),
        //             );
        //           }),
        //         ),

        //         // controller.expList == controller.expList[controller.defaultExpIndex]?
        //         // TextField(
        //         //   controller: controller.city,
        //         //   decoration: const InputDecoration(
        //         //     border: OutlineInputBorder(),
        //         //     labelText: 'Enter Year of Experiance',
        //         //   ),
        //         // ):Container()  ,
        //       ],
        //     )),

        ///Step 5///
        Step(
          state:
              _activeCurrentStep <= 3 ? StepState.editing : StepState.complete,
          isActive: _activeCurrentStep >= 3,
          title: const Text('4'),
          content: UserImageUploadScreen(
            controller: controller,
          ),
        ),

        ///Step 6///

        Step(
          state:
              _activeCurrentStep <= 4 ? StepState.editing : StepState.complete,
          isActive: _activeCurrentStep >= 4,
          title: const Text('5'),
          content: EasyContainer(
            padding: 10,
            showBorder: true,
            color: Colors.blue.shade50,
            width: double.infinity,
            borderRadius: 10,
            borderColor: EazyColors.appBarBG,
            // height: 180.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                    'Full Name: ${controller.firstName.text + controller.lastName.text}'),
                Space.vertical(4),
                Text('Email: ${controller.email.text}'),
                Space.vertical(4),
                Text('Date Of Birth: ${controller.dob.text}'),
                // Text('City : ${controller.address.text}'),
                Space.vertical(4),
                Text('Locality : ${controller.localityController.text}'),
                Space.vertical(4),
                Text('City : ${controller.cityController.text}'),
                Space.vertical(4),
                Text('State : ${controller.stateController.text}'),
                Space.vertical(18),
                if (controller.imageFile != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      controller.imageFile!,
                      width: 100.w,
                      height: 100.h,
                      fit: BoxFit.cover,
                    ),
                  )
              ],
            ),
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
    return GetBuilder<RegistrationController>(builder: (controller) {
      return SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: const StarterTopLogo(),
          automaticallyImplyLeading: false,
        ),
        backgroundColor: EazyColors.white,
        body: EasyContainer(
          color: EazyColors.white,
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor:  EazyColors.white,
              colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: EazyColors.primary,
                background: Colors.red,
                secondary: Colors.green,
              ),
            ),
            child: Stepper(
              controlsBuilder: (
                BuildContext context,
                ControlsDetails details,
              ) {
                return Container();
                //   width: 500,
                // );
                //   Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: <Widget>[
                //     EazyButtons.flexWidthElevatedButton2('Back', () {
                //       if (_activeCurrentStep == 0) {
                //         return;
                //       }
                //
                //       setState(() {
                //         _activeCurrentStep -= 1;
                //       });
                //     }, EazyColors.primary),
                //
                //     EazyButtons.flexWidthElevatedButton('Next', () {
                //       if (_activeCurrentStep < (stepList().length - 1)) {
                //         setState(() {
                //           _activeCurrentStep += 1;
                //         });
                //       } else {
                //         controller.submit();
                //         // controller.upload();
                //       }
                //     }, 40),
                //     // ElevatedButton(
                //     //   child: Text('Elevated Button'),
                //     //   style: ElevatedButton.styleFrom(
                //     //     primary: Colors.green,
                //     //   ),
                //     //   onPressed: () {
                //     //     details.onStepContinue;
                //     //   },
                //     // ),
                //     // TextButton(
                //     //   onPressed: details.onStepCancel,
                //     //   child: const Text('CANCEL'),
                //     // ),
                //   ],
                // );
              },
              elevation: 0,
              type: StepperType.horizontal,
              currentStep: _activeCurrentStep,
              steps: stepList(),
              onStepContinue: () {
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
              // onStepTapped: (int index) {
              //   if (index == 0 &&
              //       !controller.personalDetailsformKey.currentState!.validate()) {
              //     return;
              //   }
              //   if (index == 1 &&
              //       !controller.addressformKey.currentState!.validate()) {
              //     return;
              //   }
              //   if (index == 2 && controller.mainService.isEmpty) {
              //     EazySnackBar.buildErronSnackbar(
              //         'No Service selected', 'Select atleast 1 service!');
              //     return;
              //   }
              //   setState(() {
              //     _activeCurrentStep = index;
              //   });
              // },
            ),
          ),
        ),
                 bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              EazyButtons.flexWidthElevatedButton2('Back', () {
                if (_activeCurrentStep == 0) {
                  EazySnackBar.buildErronSnackbar(
                    'Complete Process',
                    'You can not go back from this stage!',
                  );
                  return;
                }

                setState(() {
                  _activeCurrentStep -= 1;
                });
              }, EazyColors.primary, 68),
              if (controller.loading)
                const Expanded(
                  child: SizedBox(
                    height: 58,
                    child: Center(
                      child: EazyLoadingWidget(),
                    ),
                  ),
                )
              else
                EazyButtons.flexWidthElevatedButton('Next', () {
                  if (_activeCurrentStep < (stepList().length - 1)) {
                    if (_activeCurrentStep == 0 &&
                        !controller.personalDetailsformKey.currentState!
                            .validate()) {
                      return;
                    }
                    if (_activeCurrentStep == 1 &&
                        !controller.addressformKey.currentState!.validate()) {
                      return;
                    }
                    if (_activeCurrentStep == 2 &&
                        controller.mainService.isEmpty) {
                      EazySnackBar.buildErronSnackbar(
                          'No Service selected', 'Select atleast 1 service!');
                      return;
                    }
                    if (_activeCurrentStep == 3 &&
                        controller.imageFile == null) {
                      EazySnackBar.buildErronSnackbar(
                        'Image missing',
                        'Please upload image',
                      );
                      return;
                    }
                    setState(() {
                      _activeCurrentStep += 1;
                    });
                    // } else if (_activeCurrentStep == 4) {
                    //   setState(() {
                    //     _activeCurrentStep += 4;
                    //     controller.upload(controller.imageFile);
                    //   });
                  } else {
                    controller.submit();
                    // controller.upload();
                  }
                }, 68),
              // ElevatedButton(
              //   child: Text('Elevated Button'),
              //   style: ElevatedButton.styleFrom(
              //     primary: Colors.green,
              //   ),
              //   onPressed: () {
              //     details.onStepContinue;
              //   },
              // ),
              // TextButton(
              //   onPressed: details.onStepCancel,
              //   child: const Text('CANCEL'),
              // ),
            ],
          ),
        ),
        //  ),
      ));
    });
  }
}
