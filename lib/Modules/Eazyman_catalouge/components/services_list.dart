import 'package:eazypizy_eazyman/Models/main_service_category.dart';
import 'package:eazypizy_eazyman/Models/subService_category.dart';
import 'package:eazypizy_eazyman/Modules/Eazyman_catalouge/components/Easyman_ServiceCard.dart';
import 'package:eazypizy_eazyman/Modules/Eazyman_catalouge/ctrl_Eazyman_profile.dart';
import 'package:eazypizy_eazyman/core/routes.dart';
import 'package:eazypizy_eazyman/widgets/EasyButtons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../theme/eazy_spaces.dart';
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
    return subServices.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: subServices.length,
            itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 7,
                        right: 7,
                      ),
                      child: Text(
                        subServices[index].subServiceName ?? '',
                        style: Get.textTheme.titleLarge,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller
                            .getSubServiceProduct(
                              subServices[index],
                            )
                            .length,
                        itemBuilder: (context, _) {
                          // if (controller
                          //         .getSubServiceProduct(
                          //           subServices[index],
                          //         )
                          //         .length ==
                          //     _) {
                          //   return Center(
                          //     child: SizedBox(
                          //       height: 60,
                          //       width: 120,
                          //       child: ElevatedButton(
                          //           onPressed: () {
                          //             Get.toNamed(
                          //               Routes.addEazymenProductScreen,
                          //               arguments: mainCategory,
                          //             );
                          //             // Navigator.of(context).push(MaterialPageRoute(
                          //             //   builder: (context) =>
                          //             //       AddSubServiceToUserCatalogue(
                          //             //     mainService: mainCategory,
                          //             //   ),
                          //             // ));
                          //           },
                          //           child: Text('Add Services')),
                          //     ),
                          //   );
                          // }
                          return EazymanServiceCard(
                            serviceProdName: controller
                                    .getSubServiceProduct(
                                      subServices[index],
                                    )[_]
                                    .productDetails!
                                    .serviceProductName ??
                                '',
                            price: controller
                                .getSubServiceProduct(
                                  subServices[index],
                                )[_]
                                .price,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            Space.vertical(8.h),
                      ),
                    ),
                  ],
                )
            // separatorBuilder: (BuildContext context, int index) => Divider(
            //   color: Colors.green,
            //   thickness: 5,
            // ),
            )
        : ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Space.vertical(20.h),
                      SizedBox(
                          height: 300.h,
                          width: 300.w,
                          child: Image.asset('assets/createProfile.png', )),
                      Space.vertical(20.h),
                      EazyButtons.flexWidthElevatedButton(
                        'Add Services'.tr,
                        () {
                          Get.toNamed(
                            Routes.addEazymenProductScreen,
                            arguments: mainCategory,
                          );
                        }, 40
                      ),
                    ],
                  ),
                ),
              ]);
  }
}
