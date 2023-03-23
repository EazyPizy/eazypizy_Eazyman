import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazypizy_eazyman/Models/main_service_category.dart';
import 'package:eazypizy_eazyman/Models/model_subService_product.dart';
import 'package:eazypizy_eazyman/Models/subService_category.dart';
import 'package:eazypizy_eazyman/Modules/addServiceProdToEazyman/ctrl_add_products.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/services/category_services.dart';
import '../../widgets/CustomTabView.dart';

class AddSubServiceToUserCatalogue extends StatefulWidget {
  static const routeName = '/Add_SubService_To_UserCatalouge';

  final MainCategoryModel mainService;

  const AddSubServiceToUserCatalogue({
    super.key,
    required this.mainService,
  });

  @override
  State<AddSubServiceToUserCatalogue> createState() =>
      AddSubServiceToUserCatalogueState();
}

class AddSubServiceToUserCatalogueState
    extends State<AddSubServiceToUserCatalogue> {
  int initPosition = 0;
  bool isChecked = false;
  bool isLoading = false;
  final List<SubServiceModel> subServiceCategories =
      CategoryService.instance.subServiceCategories;

  final List<SubServiceProductModel> subServiceProd =
      CategoryService.instance.serviceProducts;

  @override
  Widget build(BuildContext context) {
    final selectedColor = Theme.of(context).primaryColor;

    final List<SubServiceModel> subServices = subServiceCategories
        .where(
          (element) =>
              element.serviceId!.contains(widget.mainService.serviceId),
        )
        .toList();
    return GetBuilder(
        init: AddSubServiceProductsController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.mainService.serviceName!),
            ),
            body: SafeArea(
                child: isLoading == true
                    ? const Center(child: CircularProgressIndicator())
                    : CustomTabViews(
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
                                    products[prodIndex].serviceProductName!),
                                trailing: Checkbox(
                                  value: controller
                                      .ifEazymenProduct(products[prodIndex]),
                                  onChanged: (value) {
                                    // _onItemTap(index);
                                  },
                                ),
                                onTap: () {
                                  controller.toggleProduct(
                                      products[prodIndex], subServices[index]);
                                  // Get.bottomSheet(Column(
                                  //   children: [
                                  //     Text(products[prodIndex]
                                  //         .serviceProductName!),
                                  //     TextField(),
                                  //   ],
                                  // ));
                                },
                              );
                            },
                          );
                        },
                      )),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                controller.updateProducts();
              },
              child: const Icon(Icons.file_upload_outlined),
            ),
          );
        });
  }
}
