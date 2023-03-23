import 'package:eazypizy_eazyman/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

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
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
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
                  hintText: 'Email (Optional)'),
              onChanged: (val) {
                setState(() {
                  isEmailRight = isEmail(val);
                });

                // controller.isEmailCorrect = isEmail(val);
              }),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 50,
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
        const SizedBox(
          height: 20,
        ),
        Wrap(
          spacing: 8,
          children:
          List.generate(controller.choicesList.length, (index) {
            return ChoiceChip(
              labelPadding: const EdgeInsets.all(2.0),
              label: Text(
                  controller.choicesList[index],
                  style: Get.textTheme.titleLarge
              ),
              selected: controller.defaultChoiceIndex == index,
              selectedColor: Colors.blueAccent,
              backgroundColor: EazyColors.white,


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
