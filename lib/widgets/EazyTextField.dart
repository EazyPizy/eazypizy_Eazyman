import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class EazyTextField {
  EazyTextField._();

  static fullWidthTextField(
    String? labelText,
  ) {
    return SizedBox(
      height: 65.h,
      child: TextFormField(
          autovalidateMode: AutovalidateMode.always,
          keyboardType: TextInputType.number,
          maxLength: 10,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: labelText,
            labelStyle: const TextStyle(color: EazyColors.primary),
            helperText: 'We will send OTP to verify your mobile number',
            suffixStyle: const TextStyle(color: EazyColors.primary),
          )),
    );
  }
}
