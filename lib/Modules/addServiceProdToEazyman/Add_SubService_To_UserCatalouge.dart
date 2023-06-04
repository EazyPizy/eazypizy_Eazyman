import 'package:eazypizy_eazyman/Models/main_service_category.dart';
import 'package:eazypizy_eazyman/Models/subService_category.dart';
import 'package:eazypizy_eazyman/Modules/addServiceProdToEazyman/ctrl_add_products.dart';
import 'package:eazypizy_eazyman/widgets/EasyButtons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/services/category_services.dart';
import '../../widgets/CustomTabView.dart';
import '../../widgets/EasySnackBar.dart';
import '../../widgets/easy_container.dart';

class AddSubServiceToUserCatalogue extends StatefulWidget {
  const AddSubServiceToUserCatalogue({
    super.key,
  });

  @override
  State<AddSubServiceToUserCatalogue> createState() =>
      AddSubServiceToUserCatalogueState();
}

class AddSubServiceToUserCatalogueState
    extends State<AddSubServiceToUserCatalogue> {
  int initPosition = 0;
  final List<SubServiceModel> subServiceCategories =
      CategoryService.instance.subServiceCategories;

  @override
  Widget build(BuildContext context) {
    final mainService = Get.arguments as MainCategoryModel;

    final List<SubServiceModel> subServices = subServiceCategories
        .where(
          (element) => element.serviceId!.contains(mainService.serviceId),
        )
        .toList();
    return GetBuilder(
        init: AddSubServiceProductsController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                mainService.serviceName!,
                style: Get.textTheme.headlineMedium,
              ),
              centerTitle: true,
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: CustomTabViews(
                        initPosition: initPosition,
                        itemCount: subServices.length,
                        tabBuilder: (context, index) =>
                            Tab(text: subServices[index].subServiceName),
                        onPositionChange: (index) {
                          initPosition = index;
                        },
                        onScroll: (position) => print('Printed'),
                        pageBuilder: (context, index) {
                          final products = controller
                              .getProductsBySubService(subServices[index]);
                          return ListView.builder(
                            itemCount: products.length,
                            itemBuilder: (context, prodIndex) {
                              return ListTile(
                                title: Text(
                                  products[prodIndex].serviceProductName!,
                                  style: Get.textTheme.titleLarge,
                                ),
                                trailing: Checkbox(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  value: controller
                                      .ifEazymenProduct(products[prodIndex]),
                                  onChanged: (value) {
                                    controller.toggleProduct(
                                        products[prodIndex],
                                        subServices[index]);
                                  },
                                ),
                                onTap: () {
                                  controller.toggleProduct(
                                      products[prodIndex], subServices[index]);
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              child: EazyButtons.fullWidthElevatedButton('Add Products', () {
                controller.makeControllers();
                controller.eazymenProducts.isNotEmpty
                    ? addYourOwnPrice(controller)
                    : EazySnackBar.buildSnackbar(
                        'Select Products',
                        'Add Product to cataloug',
                      );
              }),
            ),
          );
        });
  }

  // Widget buildSelectButton(
  //     AddSubServiceProductsController controller, BuildContext context) {
  //   // final AddSubServiceProductsController  controller;
  //   // final eazyManProvider = Provider.of<EazymanProvider>(context);
  //   final label = controller.eazymenServices.isNotEmpty
  //       ? 'Upload ${controller.eazymenServices.length} Service '
  //       : "Continue";

  //   return controller.eazymenServices.isNotEmpty
  //       ? Container(
  //           padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
  //           color: Get.theme.primaryColor,
  //           child: ElevatedButton(
  //             style: ElevatedButton.styleFrom(
  //               backgroundColor: Colors.white,
  //               shape: const StadiumBorder(),
  //               minimumSize: const Size.fromHeight(40),
  //               //  primary: Colors.green,
  //             ),
  //             onPressed: () async {},
  //             child: Text(
  //               label,
  //               style: const TextStyle(color: Colors.black, fontSize: 16),
  //             ),
  //           ),
  //         )
  //       : Container();
  // }

  Future<void> addYourOwnPrice(
    AddSubServiceProductsController controller,
  ) {
    final products = controller.eazymenProducts;
    final List<TextEditingController> priceControllers =
        controller.priceControllers;
    return Get.bottomSheet(
      Stack(children: [
        EasyContainer(
          padding: 10,
          //borderRadius: 10,
          height: Get.size.height - 0.1,
          color: Colors.white,
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, i) {
              // final priceController =
              //     TextEditingController(text: products[i].price.toString());
              return ListTile(
                title:
                    Text(products[i].productDetails?.serviceProductName ?? ''),
                trailing: SizedBox(
                  height: 40,
                  width: 90,
                  child: TextField(
                    controller: priceControllers[i],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: ' Add Price',
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: EazyButtons.flexWidthElevatedButton('Save Products', () {
            controller.updateProducts();
          }, 40),
        )
      ]),
    );
  }
}
