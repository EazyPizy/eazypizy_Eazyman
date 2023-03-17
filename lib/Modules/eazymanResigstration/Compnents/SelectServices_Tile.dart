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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.categories.length,
                    itemBuilder: (context, index) => EasyContainer(
                        height: 100,
                        width: double.infinity,
                        borderRadius: 10,
                        color: Colors.blueAccent.withOpacity(0.5),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                controller.categories[index]?.imageUrl ?? '',
                                width: 100,
                                height: 100,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            Text(controller.categories[index]?.serviceName ?? ''),
                            Icon(Icons.check_box_outline_blank
                            ),                           ],
                        ))),
              )
            ],
          );
        });
  }
}
