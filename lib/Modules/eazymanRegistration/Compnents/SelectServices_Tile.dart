import 'package:eazypizy_eazyman/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/eazy_spaces.dart';
import '../../../widgets/easy_container.dart';
import '../ctrl_registration.dart';

class SelectServiceTile extends StatelessWidget {
  const SelectServiceTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrationController>(
        id: 'id',
        builder: (controller) {
          return Column(

            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What type of service do you provide?',
                style: Get.textTheme.titleMedium
                    ?.copyWith(color: EazyColors.primary),
                textScaleFactor: 1.5,

              ),
              Space.vertical(10.h),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.mainServiceCategories.length,
                itemBuilder: (context, index) => EasyContainer(
                  showBorder: true,
                  borderColor: EazyColors.primary,
                  color: EazyColors.white,
                  height: 120.h,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Image.network(
                          controller.mainServiceCategories[index].imageUrl ??
                              'https://firebasestorage.googleapis.com/v0/b/eazyman-2e7a7.appspot.com/o/User_images%2FEazyMan.png?alt=media&token=a376abde-5072-4d49-b25d-a7b059f4fb29',
                          fit: BoxFit.fill,
                        ),
                      ),
                      ListTile(
                        contentPadding:
                        const EdgeInsets.only(left: 8, right: 8),
                        onTap: () {
                          controller.addSubServicesToEazman(controller
                              .mainServiceCategories[index].serviceId ??
                              '');
                          print(controller.mainService.length);
                        },

                        // tileColor: Colors.white,
                        trailing: controller.mainService.contains(controller
                            .mainServiceCategories[index].serviceId)
                            ? const Icon(
                          Icons.check_box,
                          color: Colors.green,
                        )
                            : const Icon(
                          Icons.check_box_outline_blank,
                        ),
                        title: Text(
                          controller.mainServiceCategories[index].serviceName ??
                              '',
                        ),
                      ),

                    ],
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 10.h,
                ),
              )
            ],
          );
        });
  }
}
