import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

// ignore: must_be_immutable

class EazyTextField {
  EazyTextField._();

  static SizedBox stringTextField(String validateMsg,
      {required String hintText, required TextEditingController controller ,}) {
    return SizedBox(
      height: 45.h,
      child: TextFormField(
        controller: controller,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          hintText: hintText,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: EazyColors.primary),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: EazyColors.blackShade,
            ),
          ),
        ),
        validator: (val) => (val!.isEmpty) ? validateMsg : null,
      ),
    );
  }

  static SizedBox optionalTextField(
      {required String hintText}) {
    return SizedBox(
      height: 45.h,
      child: TextFormField(
        // controller: controller.mobileNumberController,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          hintText: hintText,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: EazyColors.primary),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: EazyColors.blackShade,
            ),
          ),
        ),
      ),
    );
  }

  static SizedBox numberTextField(String validateMsg, int length,

      {required String hintText}) {
    return SizedBox(
      height: 45.h,
      child: TextFormField(
        maxLength: length,
        buildCounter: (
            context, {
              required currentLength,
              required isFocused,
              maxLength,
            }) {
          return null;
        },
        validator: (val) =>
        (val!.isEmpty || val.length < length) ? validateMsg : null,
        keyboardType: TextInputType.number,
        // controller: controller.mobileNumberController,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          hintText: hintText,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: EazyColors.primary),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: EazyColors.blackShade,
            ),
          ),
        ),
        //   validator: (val) => (val!.isEmpty) ? validateMsg : null,
      ),
    );
  }
}
