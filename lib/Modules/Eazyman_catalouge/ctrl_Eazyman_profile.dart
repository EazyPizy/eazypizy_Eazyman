import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazypizy_eazyman/Models/eazymen_product.dart';
import 'package:eazypizy_eazyman/constant/firebase_collections.dart';
import 'package:eazypizy_eazyman/core/services/user_service.dart';
import 'package:eazypizy_eazyman/core/typedefs.dart';
import 'package:eazypizy_eazyman/widgets/EasySnackBar.dart';
import 'package:eazypizy_eazyman/widgets/pop_ups.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../Models/EazymanModel.dart';
import '../../Models/main_service_category.dart';
import '../../Models/subService_category.dart';
import '../../core/logger.dart';
import '../../core/services/category_services.dart';
import '../ChooseLanguage/view_ChooseLanguage.dart';

class ProfileController extends GetxController {
  ProfileController();

  final Logger _log = getLogger('Profile Controller');
  late final EazyMenModel eazyMen;
  final GlobalKey _globalKey = GlobalKey();

  final List<MainCategoryModel> userCategories = [];
  final List<SubServiceModel> userSubServiceCategories = [];
  final List<EazymenProductModel> userSubServiceProducts = [];

  int bookingsCount = 0;

  bool loading = false;

  List<EazymenProductModel> getSubServiceProduct(
    SubServiceModel subService,
  ) {
    final data = <EazymenProductModel>[];
    for (final element in userSubServiceProducts) {
      if (element.subServiceId == subService.subServiceId) {
        data.add(element);
      }
    }
    return data;
  }

  void getUserSubServices() {
    if (userCategories.isEmpty) {
      _log.i('Empty main Category');
      return;
    }
    final data = CategoryService.instance.subServiceCategories;

    for (final element in data) {
      if (eazyMen.subServices!.contains(element.subServiceId)) {
        userSubServiceCategories.add(element);
      }
    }
    print(userSubServiceCategories);
  }

  void getUserServiceProducts() {
    final data = CategoryService.instance.serviceProducts;

    for (EazymenProductModel element in eazyMen.subServiceProdcuts ?? []) {
      userSubServiceProducts.add(
        EazymenProductModel(
          subServiceId: element.subServiceId,
          productId: element.productId,
          price: element.price,
          isActive: element.isActive,
          productDetails:
              data.firstWhere((_) => _.serviceProductId == element.productId),
        ),
      );
    }
    print(userSubServiceProducts);
    update();
  }

  void getUserMainCategories() {
    final mainCategories = CategoryService.instance.mainServiceCategories;

    for (final element in eazyMen.mainServices ?? []) {
      userCategories.add(
        mainCategories.firstWhere(
          (serviceProduct) => serviceProduct.serviceId == element,
        ),
      );
    }
    print(userCategories);
    update();
  }

  VoidFuture getBookingsCount() async {
    final eazymen = EazyMenService.instance.eazyMen;
    loading = true;
    update();
    _log.v('Getting bookings count...');
    try {
      final data = await FirebaseFirestore.instance
          .collection(FirestoreCollections.bookings)
          .where('eazymen_id', isEqualTo: eazymen!.eazyManUid)
          .count()
          .get();
      bookingsCount = data.count;
    } catch (e) {
      _log.e(e);

      EazySnackBar.buildErronSnackbar(
        'Failed',
        'Failed to fetch data. Please check your connection and try again!',
      );
    } finally {
      loading = false;
      update();
    }
  }

  VoidFuture deleteProduct(String productId) async {
    loading = true;
    update();
    final newProductList = [...userSubServiceProducts];
    final product =
        newProductList.firstWhere((element) => element.productId == productId);
    newProductList.removeWhere(
      (element) => element.productId == productId,
    );

    final List<String> newSubServiceIdsList = [...eazyMen.subServices!];
    final newSubServicesList = [...userSubServiceCategories];

    /// to check if any other product with same subServiceId exists
    /// if does not exist than remove that subServiceId too
    if (newProductList.firstWhereOrNull(
            (element) => element.subServiceId == product.subServiceId) ==
        null) {
      newSubServiceIdsList.remove(product.subServiceId);
      newSubServicesList.removeWhere(
          (element) => element.subServiceId == product.subServiceId);
    }

    try {
      _log.v('Deleting product...');
      await FirebaseFirestore.instance
          .collection('EazyMen')
          .doc(EazyMenService.instance.eazyMen!.eazyManUid)
          .update({
        'Sub_Services': newSubServiceIdsList,
        "Service_Product": newProductList.map((e) => e.toJson()).toList()
      });
      userSubServiceProducts.clear();
      userSubServiceProducts.addAll(newProductList);

      eazyMen.subServices?.clear();
      eazyMen.subServices?.addAll(newSubServiceIdsList);
      eazyMen.subServiceProdcuts?.clear();
      eazyMen.subServiceProdcuts?.addAll(newProductList);
      userSubServiceCategories.clear();
      userSubServiceCategories.addAll(newSubServicesList);
      Get.back();
      successPopUp(
        'Product Deleted from Catalogue.',
        title: 'Deleted!',
      );
    } catch (e) {
      _log.e(e);
      EazySnackBar.buildErronSnackbar(
        'Failed',
        'Something went wrong while deleting product',
      );
    } finally {
      loading = false;
      update();
    }
  }

  VoidFuture logout() async {
    try {
      await EazyMenService.instance.logout();
      await Get.offAll(ChooseLanguageScreen());
    } catch (e) {
      _log.e(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
    eazyMen = EazyMenService.instance.eazyMen!;
    getUserMainCategories();
    getUserSubServices();
    getUserServiceProducts();
    getBookingsCount();
  }
}
