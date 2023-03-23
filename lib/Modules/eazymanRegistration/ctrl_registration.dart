import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazypizy_eazyman/Models/EazymanModel.dart';
import 'package:eazypizy_eazyman/core/routes.dart';
import 'package:eazypizy_eazyman/core/services/user_service.dart';
import 'package:eazypizy_eazyman/widgets/EasySnackBar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

import '../../Models/main_service_category.dart';
import '../../core/logger.dart';
import '../../core/services/category_services.dart';

import 'dart:io';

import 'package:path/path.dart' as Path;

class RegistrationController extends GetxController {
  final Logger _log = getLogger('Registration Controller');

  final List<MainCategoryModel> mainServiceCategories =
      CategoryService.instance.mainServiceCategories;

  bool _loading = false;
  late File imageFile;
  bool isImageAdded = false;
  String? imageURL;

  final imagePicker = ImagePicker();
  String imageError = "";

  TextEditingController name = TextEditingController();
  bool isEmailCorrect = false;
  int defaultChoiceIndex = 0;
  int defaultExpIndex = 0;
  final List<String> choicesList = ['Male', 'Female'];
  final List<String> expList = ['Yes', 'No'];
  TextEditingController email = TextEditingController();

  TextEditingController dob = TextEditingController();

  TextEditingController address = TextEditingController();

  TextEditingController city = TextEditingController();

  final List<String> mainService = [];

  List<String> get getMainServices {
    return [...mainService];
  }

  void addSubServicesToEazman(
    String mainServiceID,
  ) {
    if (mainService.contains(mainServiceID)) {
      mainService.remove(
        mainServiceID,
      );
    } else {
      mainService.add((mainServiceID));
    }
    update(['id']);
  }

  Future upload(
    File imageFile,
  ) async {
    final storageReference = FirebaseStorage.instance;
    final String picture = "Eazyman_Images/${Path.basename(imageFile.path)}";
    final uploadTask = storageReference.ref().child(picture).putFile(imageFile);

    TaskSnapshot snapshot = await uploadTask.whenComplete(() => TaskSnapshot);
    //

    imageURL = await snapshot.ref.getDownloadURL();
  }

  Future<void> submit() async {
    final nameS = name.text.trim();
    final emailS = email.text.trim();
    final dobS = dob.text.trim();
    final cityS = city.text.trim();
    try {
      _log.v('Updating eazymen details...');

      final eazyman = EazyMenModel(
        eazyManUid: FirebaseAuth.instance.currentUser!.uid,
        phoneNumber: FirebaseAuth.instance.currentUser!.phoneNumber,
        mainServices: mainService,
        dateOfRegistration: DateTime.now(),
        personalDetail: PersonalDetail(
          firstName: nameS,
          lastName: nameS,
          dob: dobS,
          city: cityS,
          images: imageURL,
          email: emailS,
        ),
      );
      await FirebaseFirestore.instance
          .collection('EazyMen')
          .doc(eazyman.eazyManUid)
          .set(eazyman.toJson());

      // "Date_Of_Registration": DateTime.now(),
      // "Personal_Detail": {
      //   {
      //     'Full Name': nameS,
      //     'Email': emailS,
      //     'DOB': dobS,
      //     'City': cityS,
      //     'Gender': choicesList[defaultChoiceIndex],
      //     'Images': imageURL,
      //   },
      // },
      // "Main_Services": mainService,
      // "Main_Services": {
      //   mainService
      //   // for (int i = 0; i < mainService.length; i++)
      //   //   {
      //   //      mainService[i],
      //   //   }
      // }
      //  });
      EazySnackBar.buildSuccessSnackbar('Success', 'Details updated.');
      await EazyMenService.instance.fetchEazymenData();
      Get.offAllNamed(Routes.navigationScreen);
    } on Exception catch (e) {
      _log.e(e);
    }
  }
}
