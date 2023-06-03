import 'package:eazypizy_eazyman/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';

Future infoPopUp(
  String msg, {
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
}) async =>
    await QuickAlert.show(
      borderRadius: 15,
      animType: QuickAlertAnimType.slideInLeft,
      context: Get.context!,
      type: QuickAlertType.info,
      confirmBtnColor: Colors.green,
      showCancelBtn: onCancel != null,
      confirmBtnText: 'Clear Cart',

      text: msg,
      title: 'Clear Cart',
      confirmBtnTextStyle: const TextStyle(
        color: EazyColors.white,
      ),

      // Get.textTheme.bodyMedium?.copyWith(color: Colors.white),
      onConfirmBtnTap: onConfirm,
      cancelBtnTextStyle:
          Get.textTheme.bodyMedium?.copyWith(color: Colors.redAccent),
      onCancelBtnTap: onCancel,
    );

Future warningPopUp(
  String msg, {
  String? title,
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
}) async =>
    await QuickAlert.show(
      borderRadius: 15,
      animType: QuickAlertAnimType.scale,
      context: Get.context!,
      type: QuickAlertType.warning,
      confirmBtnColor: Colors.green,
      showCancelBtn: onCancel != null,
      confirmBtnText: 'Confirm',
      barrierDismissible: false,
      text: msg,
      title: title,
      confirmBtnTextStyle: const TextStyle(
        color: EazyColors.white,
      ),
      onConfirmBtnTap: onConfirm,
      cancelBtnTextStyle:
          Get.textTheme.bodyMedium?.copyWith(color: Colors.redAccent),
      onCancelBtnTap: onCancel,
    );

Future successPopUp(
  String msg, {
  VoidCallback? onConfirm,
}) async =>
    await QuickAlert.show(
      context: Get.context!,
      type: QuickAlertType.success,
      confirmBtnColor: EazyColors.secondary,
      text: msg,
      confirmBtnTextStyle:
          Get.textTheme.bodyMedium?.copyWith(color: Colors.white),
      onConfirmBtnTap: onConfirm,
    );

Future errorPopUp(String msg, {VoidCallback? onConfirm, String? text}) async =>
    await QuickAlert.show(
      context: Get.context!,
      type: QuickAlertType.error,
      confirmBtnColor: EazyColors.secondary,
      text: msg,
      confirmBtnTextStyle:
          Get.textTheme.bodyMedium?.copyWith(color: Colors.white),
      confirmBtnText: text ?? 'Okay',
      onConfirmBtnTap: onConfirm,
    );
