import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/easy_container.dart';
import '../ctrl_Resigstration.dart';

class SelectServiceTile extends StatelessWidget {
  const SelectServiceTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: RegistrationController(),
        builder: (controller) {
          return Column(
            children: [
              Text(
                'Select Your services',
                style: Get.textTheme.headlineLarge,
              ),
              ListView.separated(
                shrinkWrap: true,
                itemCount: controller.categories.length,
                itemBuilder: (context, index) => Card(
                  color: Colors.white,
                  elevation: 0.5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(8),

                      // tileColor: Colors.white,
                      trailing: Icon(Icons.check_box_outline_blank),
                      title: Text(
                          controller.categories[index]?.serviceName ?? ''),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          controller.categories[index]?.imageUrl ?? '',
                          width: 60,
                          height: 60,
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
