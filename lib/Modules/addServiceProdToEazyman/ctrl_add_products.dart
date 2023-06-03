import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazypizy_eazyman/Models/model_subService_product.dart';
import 'package:eazypizy_eazyman/Models/subService_category.dart';
import 'package:eazypizy_eazyman/core/routes.dart';
import 'package:eazypizy_eazyman/core/services/category_services.dart';
import 'package:eazypizy_eazyman/core/services/user_service.dart';
import 'package:eazypizy_eazyman/widgets/EasySnackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Models/eazymen_product.dart';

class AddSubServiceProductsController extends GetxController {
  final _categoryService = CategoryService.instance;

  final List<EazymenProductModel> eazymenProducts = [];
  late final List<TextEditingController> priceControllers;

  void makeControllers() {
    priceControllers = List.generate(
      eazymenProducts.length,
      (index) =>
          TextEditingController(text: eazymenProducts[index].price.toString()),
    );
  }

  void toggleProduct(
      SubServiceProductModel product, SubServiceModel subService) {
    if (ifEazymenProduct(product)) {
      eazymenProducts.removeWhere(
          (element) => element.productId == product.serviceProductId);
    } else {
      eazymenProducts.add(
        EazymenProductModel(
          subServiceId: subService.subServiceId!,
          productId: product.serviceProductId!,
          price: 0,
          isActive: true,
          productDetails: product,
        ),
      );
    }
    print(eazymenProducts);
    update();
  }

  bool ifEazymenProduct(SubServiceProductModel product) {
    for (var element in eazymenProducts) {
      if (element.productId == product.serviceProductId) {
        return true;
      }
    }
    return false;
  }

  List<SubServiceProductModel> getProductsBySubService(
    SubServiceModel subService,
  ) {
    return _categoryService.serviceProducts
        .where((product) =>
            product.subServiceIDs!.contains(subService.subServiceId))
        .toList();
  }

  Future<void> updateProducts() async {
    final List<String> subServices = [];
    showDialog(
      context: Get.context!,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    for (var i = 0; i < eazymenProducts.length; i++) {
      eazymenProducts[i].price = int.parse(priceControllers[i].text);
      if (!subServices.contains(eazymenProducts[i].subServiceId)) {
        subServices.add(eazymenProducts[i].subServiceId);
      }
    }
    print(eazymenProducts.map((e) => e.toJson()).toList());
    print(subServices);
    try {
      await Future.wait([
        FirebaseFirestore.instance
            .collection('EazyMen')
            .doc(EazyMenService.instance.eazyMen!.eazyManUid)
            .update({
          'Sub_Services': subServices,
          "Service_Product": eazymenProducts.map((e) => e.toJson()).toList()
        }),
        // FirebaseFirestore.instance
        //     .collection('EazyMen')
        //     .doc(EazyMenService.instance.eazyMen!.eazyManUid)
        //     .update({
        //   'Sub_Services': subServices,
        // }),
      ]);
      // Get.back();
      EazySnackBar.buildSuccessSnackbar('Done!', 'Products Updated!');
      await fetchEazymen();
      Get.offAllNamed(Routes.navigationScreen);
    } catch (e) {
      EazySnackBar.buildSuccessSnackbar('Error', 'Something went wrong!');
    }
  }

  Future<void> fetchEazymen() async {
    await EazyMenService.instance.fetchEazymenData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    for (var element in EazyMenService.instance.eazyMen!.subServiceProdcuts!) {
      eazymenProducts.add(
        EazymenProductModel(
          subServiceId: element.subServiceId,
          productId: element.productId,
          price: element.price,
          isActive: element.isActive,
          productDetails: _categoryService.serviceProducts
              .firstWhere((prod) => prod.serviceProductId == element.productId),
        ),
      );
    }
    // eazymenProducts
    //     .addAll(EazyMenService.instance.eazyMen!.subServiceProdcuts!);
  }
}
