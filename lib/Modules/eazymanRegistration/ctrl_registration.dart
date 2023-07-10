import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazypizy_eazyman/Models/EazymanModel.dart';
import 'package:eazypizy_eazyman/core/routes.dart';
import 'package:eazypizy_eazyman/core/services/notification_service.dart';
import 'package:eazypizy_eazyman/core/services/user_service.dart';
import 'package:eazypizy_eazyman/widgets/EasySnackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart' as Path;

import '../../Models/main_service_category.dart';
import '../../core/logger.dart';
import '../../core/services/category_services.dart';

class RegistrationController extends GetxController {
  final Logger _log = getLogger('Registration Controller');

  final List<MainCategoryModel> mainServiceCategories =
      CategoryService.instance.mainServiceCategories;

  bool loading = false;
  File? imageFile;
  bool isImageAdded = false;
  String? imageURL;

  final imagePicker = ImagePicker();
  String imageError = "";

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController workingSince = TextEditingController();

  // TextEditingController address = TextEditingController();
  TextEditingController localityController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  final GlobalKey<FormState> personalDetailsformKey = GlobalKey<FormState>();
  final GlobalKey<FormState> addressformKey = GlobalKey<FormState>();

  bool isEmailCorrect = false;
  int defaultChoiceIndex = 0;
  int defaultExpIndex = 1;
  final List<String> choicesList = ['Male', 'Female'];
  final List<String> expList = ['Yes', 'No'];

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
      if (mainService.length < 2) {
        mainService.add((mainServiceID));
      } else {
        EazySnackBar.buildErronSnackbar(
          'Services Limit',
          'Only upto 2 services allowed!',
        );
      }
    }
    update(['id']);
  }

  Future upload(
      // File imageFile,
      ) async {
    final storageReference = FirebaseStorage.instance;
    final String picture = "Eazyman_Images/${Path.basename(imageFile!.path)}";
    final uploadTask =
        storageReference.ref().child(picture).putFile(imageFile!);

    TaskSnapshot snapshot = await uploadTask.whenComplete(() => TaskSnapshot);
    //

    imageURL = await snapshot.ref.getDownloadURL();
  }

  Future<void> submit() async {
    final firstname = firstName.text.trim();
    final lastname = lastName.text.trim();
    final emailS = email.text.trim();
    final dobS = dob.text.trim();
    final workingSinceS = workingSince.text.trim();
    final cityS = cityController.text.trim();
    final locality = localityController.text.trim();
    final state = stateController.text.trim();
    final gender = defaultChoiceIndex;
    final isExp = defaultExpIndex;
    try {
      _log.v('Updating eazymen details...');
      loading = true;
      update();
      final token = await NotificationService.instance.getToken();
      if (imageFile != null) {
        await upload();
      }

      final eazyman = EazyMenModel(
        eazyManUid: FirebaseAuth.instance.currentUser!.uid,
        phoneNumber: FirebaseAuth.instance.currentUser!.phoneNumber,
        mainServices: mainService,
        dateOfRegistration: DateTime.now(),
        personalDetail: PersonalDetail(
          firstName: firstname,
          lastName: lastname,
          dob: dobS,
          workingSince: workingSinceS.isEmpty ? null : workingSinceS,
          city: cityS,
          locality: locality,
          state: state,
          images: imageURL,
          email: emailS,
          gender: defaultChoiceIndex.toString(),
          experiance: isExp,
        ),
        fcmToken: token,
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
      EazySnackBar.buildErronSnackbar('Error', 'Something went wrong');
    } finally {
      loading = false;
      update();
    }
  }
}
