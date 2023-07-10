import 'package:eazypizy_eazyman/widgets/EasyButtons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/eazy_spaces.dart';
import '../../../widgets/EazyTextField.dart';
import 'dart:io';

class EditBusinessCard extends StatefulWidget {
  const EditBusinessCard({Key? key}) : super(key: key);

  @override
  State<EditBusinessCard> createState() => _EditBusinessCardState();
}

class _EditBusinessCardState extends State<EditBusinessCard> {
  File? imageFile;
  bool isEmailRight = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Business Card',
          style: Get.textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.all(3),
                      //width: 100,
                      child: imageFile != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                imageFile!,
                                width: 100.w,
                                height: 100.h,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10)),
                              width: 100,
                              height: 100,
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.grey[800],
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 88,
                right: 110,
                child: InkWell(
                  onTap: () {},
                  child: const SizedBox(
                    height: 30,
                    width: 30,
                    child: CircleAvatar(
                      backgroundColor: EazyColors.primary,
                      child: Icon(
                        Icons.add,
                        color: EazyColors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              )
            ]),
            Space.vertical(10.h),
            EazyTextField.stringTextField('Please Enter Name',
                hintText: 'Enter Name', controller: nameController),
            Space.vertical(10.h),
            SizedBox(
              height: 45.h,
              child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) => (val!.isEmpty) ? 'Enter Email' : null,
                  // controller: controller.email,
                  decoration: InputDecoration(
                    // border: const OutlineInputBorder(),
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
                    //  controller.isEmailCorrect = isEmail(val);
                    //  controller.isEmailCorrect = isEmail(val);
                  }),
            ),
            const Spacer(),

            EazyButtons.fullWidthElevatedButton('Update', () {})
          ],
        ),
      ),
    );
  }
}
