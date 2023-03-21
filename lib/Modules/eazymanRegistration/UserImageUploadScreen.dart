import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

import 'ctrl_registration.dart';


class UserImageUploadScreen extends StatefulWidget {
  static const routeName = '/UserImageUploadScreen';

  const UserImageUploadScreen(
      {super.key, required this.controller});
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
    return  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(),
          Text(
            "Upload Your Image",
            style: GoogleFonts.signika(),
            textScaleFactor: 2,
          ),
          const SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                _showPicker(context);
                setState(() {
                  // isTapped = true;
                });
              },
              child: Container(
                margin: EdgeInsets.all(3),
                width: 100,
                child: imageFile != null
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    imageFile!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.fitHeight,
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

          ElevatedButton(onPressed: (){
            widget.controller.upload(imageFile!);

          }, child: Text('Upload'))

        ]);
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
      imageFile = (File(image?.path?? ''));
      _loading = false;
      imageError = "";
    });
  }

  Future _imgFromGallery() async {
    final PickedFile? image =
    await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      imageFile = (File(image?.path ?? ''));
      _loading = false;
      imageError = "";
    });
  }



}
