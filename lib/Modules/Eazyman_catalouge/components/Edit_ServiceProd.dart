import 'package:eazypizy_eazyman/widgets/EazyTextField.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class EditServiceProduct extends StatelessWidget {
  const EditServiceProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController priceController = TextEditingController();
    return Column(
      children: [
        EazyTextField.stringTextField('Enter New Price', hintText: 'Enter NEw Price', controller: priceController, ),
      ],
    );
  }
}
