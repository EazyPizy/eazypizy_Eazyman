import 'package:eazypizy_eazyman/core/routes.dart';
import 'package:eazypizy_eazyman/theme/app_colors.dart';
import 'package:eazypizy_eazyman/widgets/EasyButtons.dart';
import 'package:eazypizy_eazyman/widgets/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/eazy_spaces.dart';

class BusinessCardSample extends StatelessWidget {
  static const routeName = '/BusinessCardSample';

  const BusinessCardSample({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Space.vertical(50.h),
                Text(
                  'Lets Build your Business Card',
                  style: Get.textTheme.headlineLarge?.copyWith(color: EazyColors.primary),
                ),
                Space.vertical(50.h),
                 EasyContainer(
                  showBorder: true,
                  color: Colors.white,
                  width: double.infinity,
                  borderRadius: 10,
                  borderColor: EazyColors.blackShade,
                  height: 180.h,
                  child: const Text('Business card'),
                ),
                const Spacer(),
                EazyButtons.fullWidthElevatedButton('Lets Start', () {  Get.toNamed(Routes.basicDetailsScreen);}),
                // Align(
                //   alignment: Alignment.centerRight,
                //   child: ElevatedButton(
                //     onPressed: () {
                //       // Navigator.of(context).push(
                //       //   MaterialPageRoute(
                //       //     builder: (context) => const BasicDetails(),
                //       //   ),
                //       // );
                //       Get.toNamed(Routes.basicDetailsScreen);
                //     },
                //     child: const Text("Continue"),
                //   ),
                // ),
              ]),
        ),
      ),
    );
  }
}

bool isVisible = true;
