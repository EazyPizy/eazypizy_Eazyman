import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazypizy_eazyman/core/routes.dart';
import 'package:eazypizy_eazyman/core/services/user_service.dart';
import 'package:eazypizy_eazyman/widgets/EasySnackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../Models/main_service_category.dart';
import '../../core/logger.dart';
import '../../core/services/category_services.dart';

class RegistrationController extends GetxController {
  final Logger _log = getLogger('Registration Controller');

  final List<MainCategoryModel> mainServiceCategories =
      CategoryService.instance.mainServiceCategories;

  TextEditingController name = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController pass = TextEditingController();

  TextEditingController address = TextEditingController();

  TextEditingController pincode = TextEditingController();

  Future<void> submit() async {
    final nameS = name.text.trim();
    final emailS = email.text.trim();
    try {
      _log.v('Updating eazymen details...');
      await FirebaseFirestore.instance
          .collection('EazyMen')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'name': nameS,
        'email': emailS,
      });
      EazySnackBar.buildSuccessSnackbar('Success', 'Details updated.');
      await EazyMenService.instance.fetchEazymenData();
      Get.offAllNamed(Routes.navigationScreen);
    } on Exception catch (e) {
      _log.e(e);
    }
  }
}
