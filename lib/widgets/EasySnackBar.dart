import 'package:eazypizy_eazyman/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EazySnackBar {
  EazySnackBar._();

  static buildSnackbar(String title, String message) {
    Get.snackbar(title, message,
        colorText: EazyColors.blackShade,
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(15),
        backgroundColor: EazyColors.primary);
  }

  static buildSuccessSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      colorText: EazyColors.blackShade,
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(15),
      backgroundColor: Colors.greenAccent,
    );
  }

  static buildErronSnackbar(String title, String message) {
    Get.snackbar(title, message,
        colorText: EazyColors.white,
        duration: const Duration(seconds: 4),
        snackPosition: SnackPosition.BOTTOM,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(15),
        backgroundColor: Colors.red);
  }
}

// This is any page in your project

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       //        Always create body with Builder method so you can
//       //        get exact context to pass
//       body: Builder(
//         builder: (context) =>
//             Center(
//               child: ElevatedButton(
//                 onPressed: (){
//                   CustomWidgets.buildErrorSnackbar(context,"Your message here");
//                 },
//                 child: Text('Display SnackBar'),
//               ),
//             ),
//       ),
//     );
//   }
// }
