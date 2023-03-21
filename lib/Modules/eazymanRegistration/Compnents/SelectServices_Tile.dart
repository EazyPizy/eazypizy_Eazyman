import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../ctrl_registration.dart';

class SelectServiceTile extends StatelessWidget {
  const SelectServiceTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrationController>(builder: (controller) {
      return Column(
        children: [
          Text(
            'Select Your services',
            style: Get.textTheme.headlineLarge,
          ),
          ListView.separated(
            shrinkWrap: true,
            itemCount: controller.mainServiceCategories.length,
            itemBuilder: (context, index) => Card(
              color: Colors.white,
              elevation: 0.5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                  contentPadding: const EdgeInsets.all(8),
                  onTap: (){
                    controller.addSubServicesToEazyman(controller.mainServiceCategories[index]?.serviceId?? '');
                    print(controller.mainService.length);
                  },

                  // tileColor: Colors.white,
                  trailing: const Icon(Icons.check_box_outline_blank),
                  title: Text(
                    controller.mainServiceCategories[index].serviceName ?? '',
                  ),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      controller.mainServiceCategories[index].imageUrl ?? '',
                      width: 60.w,
                      height: 60.h,
                      fit: BoxFit.fitHeight,
                    ),
                  )),
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 5,
            ),
          )
        ],
      );
    });
  }
}
