import 'dart:io';
import 'package:eazypizy_eazyman/core/typedefs.dart';
import 'package:eazypizy_eazyman/widgets/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

import '../../theme/app_colors.dart';
import '../../theme/eazy_spaces.dart';
import 'ctrl_registration.dart';

class UserImageUploadScreen extends StatefulWidget {
  static const routeName = '/UserImageUploadScreen';

  const UserImageUploadScreen({super.key, required this.controller});

  final RegistrationController controller;

  @override
  _UserImageUploadScreenState createState() => _UserImageUploadScreenState();
}

bool isVisible = true;

class _UserImageUploadScreenState extends State<UserImageUploadScreen> {
  bool _loading = false;
  File? imageFile;
  bool isImageAdded = false;

  final imagePicker = ImagePicker();
  String imageError = "";

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(),
          Text(
            "Upload Your Image",
            style: Get.textTheme.headlineLarge
                ?.copyWith(color: EazyColors.primary),
            textScaleFactor: 1.5,
          ),
          Space.vertical(50.h),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  showPickers();
                  setState(() {
                    // isTapped = true;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.all(3),
                  width: 100,
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
          ElevatedButton(
              onPressed: () {
                widget.controller.upload(imageFile!);
              },
              child: const Text('Upload'))
        ]);
  }

  VoidFuture showPickers() {
    return Get.bottomSheet(EasyContainer(
      color: EazyColors.white,
      height: 150.h,
      customBorderRadius: const BorderRadius.only(
          topRight: Radius.circular(10), topLeft: Radius.circular(10)),
      child: SafeArea(
        child: Wrap(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                EasyContainer(
                  color: EazyColors.white,
                  onTap: () {
                    _imgFromGallery();
                    Navigator.of(context).pop();
                  },
                  child: Column(
                    children: [
                      const Icon(
                        Icons.image,
                        size: 30,
                      ),
                      Text(
                        'Photo Library',
                        style: Get.textTheme.titleMedium,
                      )
                    ],
                  ),
                ),
                EasyContainer(
                  color: EazyColors.white,
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                  child: Column(
                    children: [
                      const Icon(
                        Icons.camera_alt,
                        size: 30,
                      ),
                      Text(
                        'Camara',
                        style: Get.textTheme.titleMedium,
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  Future _imgFromCamera() async {
    final PickedFile? image =
        await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      widget.controller.imageFile = (File(image?.path ?? ''));
      imageFile = (File(image?.path ?? ''));
      _loading = false;
      imageError = "";
    });
  }

  Future _imgFromGallery() async {
    final PickedFile? image =
        await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      widget.controller.imageFile = (File(image?.path ?? ''));
      imageFile = (File(image?.path ?? ''));
      _loading = false;
      imageError = "";
    });
  }
}
