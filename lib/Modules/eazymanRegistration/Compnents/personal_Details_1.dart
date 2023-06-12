import 'package:eazypizy_eazyman/theme/app_colors.dart';
import 'package:eazypizy_eazyman/widgets/EazyTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:validators/validators.dart';

import '../../../theme/eazy_spaces.dart';
import '../../../widgets/easy_container.dart';
import '../ctrl_registration.dart';

import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '../viewBusinessCardSample.dart';

class PersonalDetails1 extends StatefulWidget {
  const PersonalDetails1({
    super.key,
    // required this.controller,
  });

  // final RegistrationController controller;

  @override
  State<PersonalDetails1> createState() => _PersonalDetails1State();
}

class _PersonalDetails1State extends State<PersonalDetails1> {
  bool isEmailRight = false;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegistrationController>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tell us about\nyourself',
          style: Get.textTheme.headlineLarge?.copyWith(
            color: EazyColors.primary,
          ),
          textScaleFactor: 1.5,
        ),
        Space.vertical(10.h),
        Form(
         // key: controller.formKey,
          child: Row(
            children: [
              Flexible(
                child: EazyTextField.stringTextField(
                  'Name cant be empty',
                  hintText: 'First Name',
                  controller: controller.firstName,
                ),
              ),
              Space.horizontal(10.w),
              Flexible(
                child: EazyTextField.stringTextField(
                  'Name cant be empty',
                  hintText: 'Last Name',
                  controller: controller.lastName,
                ),
              ),
            ],
          ),
        ),
        Space.vertical(20.h),
        SizedBox(
          height: 45.h,
          child: TextField(
              controller: controller.email,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                hintText: 'Enter Email',
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: EazyColors.primary),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: EazyColors.blackShade,
                  ),
                ),
                // prefixIcon: const Icon(Icons.email, color: Colors.red,),
                suffixIcon: isEmailRight == false
                    ? const Icon(
                        Icons.email,
                        color: Colors.red,
                      )
                    : const Icon(
                        Icons.email,
                        color: Colors.green,
                      ),
                labelText: 'Email',
              ),
              onChanged: (val) {
                setState(() {
                  isEmailRight = isEmail(val);
                });
                controller.isEmailCorrect = isEmail(val);
              }),
        ),
        Space.vertical(20.h),
        SizedBox(
          height: 45.h,
          child: TextField(
            readOnly: true,
            controller: controller.dob,
            obscureText: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Date of birth',
              //helperText: 'Choose Date',
              suffixIcon: Icon(Icons.calendar_today),
            ),
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2100));

              if (pickedDate != null) {
                print(
                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                String formattedDate =
                    DateFormat('dd-MM-yyyy').format(pickedDate);
                print(
                    formattedDate); //formatted date output using intl package =>  2021-03-16
                setState(() {
                  controller.dob.text =
                      formattedDate; //set output date to TextField value.
                });
              } else {}
            },
          ),
        ),
        Space.vertical(20.h),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 8,
          children: List.generate(controller.choicesList.length, (index) {
            return ChoiceChip(
              labelPadding: const EdgeInsets.all(2.0),
              label: Text(
                controller.choicesList[index],
              ),
              selected: controller.defaultChoiceIndex == index,
              selectedColor: EazyColors.primary,
              labelStyle: (controller.defaultChoiceIndex == index)
                  ? const TextStyle(color: EazyColors.white)
                  : const TextStyle(color: EazyColors.primary),
              backgroundColor: EazyColors.white,
              disabledColor: EazyColors.white,
              onSelected: (value) {
                setState(() {
                  controller.defaultChoiceIndex =
                      value ? index : controller.defaultChoiceIndex;
                });
                print('gender ${controller.defaultChoiceIndex}');
              },
              // backgroundColor: color,
              elevation: 1,
              // padding: EdgeInsets.symmetric(
              //     horizontal: SizeConfig.widthMultiplier * 4),
            );
          }),
        ),
      ],
    );
  }
}
