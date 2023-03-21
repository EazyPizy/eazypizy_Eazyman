import 'package:eazypizy_eazyman/core/routes.dart';
import 'package:eazypizy_eazyman/theme/app_colors.dart';
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
                  width: double.infinity,
                  borderRadius: 10,
                  borderColor: EazyColors.blackShade,
                  height: 200,
                  child: Text('Business card'),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => const BasicDetails(),
                      //   ),
                      // );
                      Get.toNamed(Routes.basicDetailsScreen);
                    },
                    child: const Text("Continue"),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

bool isVisible = true;
