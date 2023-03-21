import 'package:eazypizy_eazyman/Models/main_service_category.dart';
import 'package:eazypizy_eazyman/Models/subService_category.dart';
import 'package:eazypizy_eazyman/Modules/Eazyman_catalouge/components/Easyman_ServiceCard.dart';
import 'package:eazypizy_eazyman/Modules/Eazyman_catalouge/ctrl_Eazyman_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicesListWidget extends GetView<ProfileController> {
  const ServicesListWidget(
    this.mainCategory, {
    super.key,
  });

  final MainCategoryModel mainCategory;

  @override
  Widget build(BuildContext context) {
    final List<SubServiceModel> subServices =
        controller.userSubServiceCategories
            .where(
              (element) => element.serviceId!.contains(mainCategory.serviceId!),
            )
            .toList();
    return ListView.separated(
      shrinkWrap: true,
      itemCount: subServices.length,
      itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
            ),
            child: Text(
              subServices[index].subServiceName ?? '',
              style: Get.textTheme.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller
                  .getSubServiceProduct(
                    subServices[index],
                  )
                  .length,
              itemBuilder: (context, _) {
                return EazymanServiceCard(
                  serviceProdName: controller
                          .getSubServiceProduct(
                            subServices[index],
                          )[_]
                          .serviceProductName ??
                      '',
                );
              },
            ),
          ),
        ],
      ),
      separatorBuilder: (BuildContext context, int index) => Divider(
        color: Colors.grey.shade50,
        thickness: 5,
      ),
    );
  }
}
