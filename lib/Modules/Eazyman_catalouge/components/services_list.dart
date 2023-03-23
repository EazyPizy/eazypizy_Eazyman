import 'package:eazypizy_eazyman/Models/main_service_category.dart';
import 'package:eazypizy_eazyman/Models/subService_category.dart';
import 'package:eazypizy_eazyman/Modules/Eazyman_catalouge/components/Easyman_ServiceCard.dart';
import 'package:eazypizy_eazyman/Modules/Eazyman_catalouge/ctrl_Eazyman_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../addServiceProdToEazyman/Add_SubService_To_UserCatalouge.dart';

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

    return EazymanServiceCard(serviceProdName: "name", price:120);
      // subServices.isNotEmpty
      //   ? ListView.separated(
      //       shrinkWrap: true,
      //       itemCount: subServices.length,
      //       itemBuilder: (context, index) => Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Padding(
      //             padding: const EdgeInsets.only(
      //               left: 8,
      //               right: 8,
      //             ),
      //             child: Text(
      //               subServices[index].subServiceName ?? '',
      //               style: Get.textTheme.titleLarge,
      //             ),
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.all(8),
      //             child: ListView.builder(
      //               shrinkWrap: true,
      //               physics: const NeverScrollableScrollPhysics(),
      //               itemCount: controller
      //                       .getSubServiceProduct(
      //                         subServices[index],
      //                       )
      //                       .length +
      //                   1,
      //               itemBuilder: (context, _) {
      //                 if (controller
      //                         .getSubServiceProduct(
      //                           subServices[index],
      //                         )
      //                         .length ==
      //                     _) {
      //                   return Center(
      //                     child: SizedBox(
      //                       height: 60,
      //                       width: 120,
      //                       child: ElevatedButton(
      //                           onPressed: () {
      //                             Navigator.of(context).push(MaterialPageRoute(
      //                               builder: (context) =>
      //                                   AddSubServiceToUserCatalogue(
      //                                 mainService: mainCategory,
      //                               ),
      //                             ));
      //                           },
      //                           child: Text('Add Services')),
      //                     ),
      //                   );
      //                 }
      //                 return EazymanServiceCard(
      //                   serviceProdName: controller
      //                           .getSubServiceProduct(
      //                             subServices[index],
      //                           )[_]
      //                           .productDetails!
      //                           .serviceProductName ??
      //                       '',
      //                   price: controller
      //                       .getSubServiceProduct(
      //                         subServices[index],
      //                       )[_]
      //                       .price,
      //                 );
      //               },
      //             ),
      //           ),
      //         ],
      //       ),
      //       separatorBuilder: (BuildContext context, int index) => Divider(
      //         color: Colors.grey.shade50,
      //         thickness: 5,
      //       ),
      //     )
      //   : Center(
      //       child: SizedBox(
      //         height: 60,
      //         width: 120,
      //         child: ElevatedButton(
      //             onPressed: () {
      //               Navigator.of(context).push(MaterialPageRoute(
      //                 builder: (context) => AddSubServiceToUserCatalogue(
      //                   mainService: mainCategory,
      //                 ),
      //               ));
      //             },
      //             child: Text('Add Services')),
      //       ),
      //     );
  }
}
