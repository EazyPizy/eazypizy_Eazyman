import 'package:eazypizy_eazyman/Modules/eazymanRegistration/view_BasicDetails.dart';
import 'package:eazypizy_eazyman/theme/app_colors.dart';

import 'package:eazypizy_eazyman/widgets/EasySnackBar.dart';
import 'package:eazypizy_eazyman/widgets/easy_container.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessCardSample extends StatelessWidget {
  static const routeName = '/BusinessCardSample';

  const BusinessCardSample({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lets Build your Business Card',
                  style: Get.textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 50,
                ),
                const EasyContainer(
                    showBorder: true,
                    color: Colors.white,
                    width: 250,
                    borderRadius: 10,
                    borderColor: EazyColors.blackShade,
                    height: 400,
                    child: Text('Business card')),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        EasySnackBar.buildSnackbar(
                            'Trial', 'This is ur first snack bar');
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BasicDetails()));
                      },
                      child: const Text("Continue"),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

bool isVisible = true;
