import 'package:eazypizy_eazyman/theme/app_colors.dart';
import 'package:eazypizy_eazyman/widgets/EasyButtons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../theme/eazy_spaces.dart';
import '../../../widgets/easy_container.dart';

class SetupPayment extends StatelessWidget {
  const SetupPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      EasyContainer(
          borderRadius: 20,
          padding: 20,
          alignment: Alignment.bottomCenter,
          height: 400,
          color: Colors.redAccent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Collect Your Payment now',
                style: TextStyle(
                  color: Colors.white,
                ),
                textScaleFactor: 3,
              ),
              Space.vertical(25),
              Row(
                children: [
                  EasyContainer(
                      height: 25,
                      width: 100,
                      padding: 2,
                      color: Colors.blue,
                      borderRadius: 2,
                      child: Text('100% SECURE', style: Get.textTheme.titleSmall,)),
                  Space.horizontal(20),
                  EasyContainer(
                    padding: 2,
                      height: 25,
                      width: 100,
                      color: Colors.green,
                      borderRadius: 2,
                      child: Text('100% SECURE', style: Get.textTheme.titleSmall,)),
                ],
              ),
              Space.vertical(10),

              Row(
                children: [
                  Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  Text(
                    'Send Payment link via whats app or sms',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textScaleFactor: 1,
                  )
                ],
              ),
              Space.vertical(10),
              Row(
                children: [
                  Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  Text(
                    'Send Payment link via whats app or sms',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textScaleFactor: 1,
                  ),
                ],
              ),
              Space.vertical(10),
              Row(
                children: [
                  Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  Text(
                    'Send Payment link via whats app or sms',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textScaleFactor: 1,
                  )
                ],
              ),
              Space.vertical(10),
              EazyButtons.flexWidthElevatedButton2(
                  'SetUp Payment', () {}, EazyColors.white)
            ],
          )),

      // Positioned(
      //   top: 100,
      //   left: 20,
      //   child: EasyContainer(
      //     width:300,
      //
      //     elevation: 1,
      //     borderRadius: 10,
      //     height: 200,
      //     color: EazyColors.background,
      //     child: Text(''),
      //   ),
      // ),
    ]);
  }
}
