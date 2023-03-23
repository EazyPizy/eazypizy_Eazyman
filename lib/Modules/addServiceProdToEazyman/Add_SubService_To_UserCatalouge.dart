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
import '../../widgets/EasySnackBar.dart';
import '../../widgets/easy_container.dart';

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
                  : Column(
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
                                    title: Text(products[prodIndex]
                                        .serviceProductName!),
                                    trailing: Checkbox(
                                      value: controller.ifEazymenProduct(
                                          products[prodIndex]),
                                      onChanged: (value) {
                                        // _onItemTap(index);
                                      },
                                    ),
                                    onTap: () {
                                      controller.toggleProduct(
                                          products[prodIndex],
                                          subServices[index]);
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
                          ),
                        ),
                      ],
                    ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                controller.eazymenProducts.isNotEmpty
                    ? addYourOwnPrice(controller, context)
                    : EazySnackBar.buildSnackbar(
                        'Select Products', 'Add Product to cataloug');

                // controller.updateProducts(
                // controller.eazymenProducts.first.subServiceIDs?.first ?? '',
                //  controller.eazymenProducts.first.serviceProductId ?? '',
                // );
              },
              label: const Text('Add Products'),
              // shape: const Icon(Icons.file_upload_outlined),
            ),
          );
        });
  }

  Widget buildSelectButton(
      AddSubServiceProductsController controller, BuildContext context) {
    // final AddSubServiceProductsController  controller;
    // final eazyManProvider = Provider.of<EazymanProvider>(context);
    final label = controller.eazymenServices.isNotEmpty
        ? 'Upload ${controller.eazymenServices.length} Service '
        : "Continue";

    return controller.eazymenServices.isNotEmpty
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            color: Theme.of(context).primaryColor,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: const StadiumBorder(),
                minimumSize: const Size.fromHeight(40),
                //  primary: Colors.green,
              ),
              onPressed: () async {
                // isLoading = true;
                // //  await Future.delayed(Duration(seconds: 1));
                // // await uploadSubServices(listItems, widget.mainServiceID);
                // isLoading = false;
                // Navigator.pop(
                //   context,
                // );
                // listItems.clear();
              },
              child: Text(
                label,
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          )
        : Container();
  }

  Future<void> addYourOwnPrice(
      AddSubServiceProductsController controller, BuildContext context) {
    final priceController = TextEditingController();
    return Get.bottomSheet(
      Stack(children: [
        EasyContainer(
          borderRadius: 10,
          height: MediaQuery.of(context).size.height - 0.1,
          color: Colors.white,
          child: ListView.builder(
              itemCount: controller.eazymenProducts.length,
              itemBuilder: (context, i) => ListTile(
                    title: Text(
                        '${controller.eazymenProducts[i].serviceProductName}'),
                    trailing: SizedBox(
                      height: 40,
                      width: 90,
                      child: TextField(
                        controller: priceController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            // prefixIcon: const Icon(Icons.email, color: Colors.red,),
                            // labelText: 'Email',
                            hintText: ' Add Price'),
                      ),
                    ),
                  )),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.end,
          //   children: [
          //     TextButton.icon(
          //       style: TextButton.styleFrom(
          //         textStyle: const TextStyle(color: Colors.green),
          //         backgroundColor: Colors.white,
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(24),
          //         ),
          //       ),
          //       onPressed: () => {},
          //       icon: const Icon(
          //         Icons.location_on,
          //       ),
          //       label: Text(
          //         'Use Current Location',
          //         style: Get.textTheme.labelSmall,
          //       ),
          //     ),
          //     Form(
          //       child: TextField(
          //         controller: houseNumberController,
          //       ),
          //     ),
          //     TextButton(
          //       onPressed: () {},
          //       child: Text('Save Address', style: Get.textTheme.labelSmall),
          //     ),
          //   ],
          // ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
                onPressed: () {
                  controller.updateProducts(
                    controller.eazymenProducts.first.subServiceIDs?.first ?? '',
                    controller.eazymenProducts.first.serviceProductId ?? '',
                  );
                },
                child: Text(' Save Products')))
      ]),
    );
  }
}
