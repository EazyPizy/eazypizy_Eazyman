import 'package:eazypizy_eazyman/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';

void showOnAppExit({
  required VoidCallback onConfirm,
  VoidCallback? onCancel,
}) =>
    QuickAlert.show(
      context: Get.context!,
      type: QuickAlertType.warning,
      confirmBtnColor: Colors.red,
      showCancelBtn: onCancel != null,
      confirmBtnText: 'Exit',

      text: 'Are you sure wanna exit the app?',
      title: 'Leaving us',
      confirmBtnTextStyle: const TextStyle(
        color: EazyColors.white,
      ),

      // Get.textTheme.bodyMedium?.copyWith(color: Colors.white),
      onConfirmBtnTap: onConfirm,
      cancelBtnTextStyle:
          Get.textTheme.bodyMedium?.copyWith(color: Colors.redAccent),
      onCancelBtnTap: onCancel,
    );
