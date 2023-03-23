import 'package:eazypizy_eazyman/Models/eazymen_product.dart';
import 'package:eazypizy_eazyman/core/services/user_service.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';

import '../../Models/EazymanModel.dart';
import '../../Models/main_service_category.dart';
import '../../Models/model_subService_product.dart';
import '../../Models/subService_category.dart';
import '../../core/logger.dart';
import '../../core/services/category_services.dart';

class ProfileController extends GetxController {
  ProfileController();
  final Logger _log = getLogger('Profile Controller');

  late final EazyMenModel eazyMen;

  final List<MainCategoryModel> userCategories = [];
  final List<SubServiceModel> userSubServiceCategories = [];
  final List<EazymenProductModel> userSubServiceProducts = [];

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
      // userSubServiceProducts.add(
      //   data.firstWhere(
      //     (serviceProduct) => serviceProduct.serviceProductId == element,
      //   ),
      // );
    }
    print(userSubServiceProducts);
    update();
  }

  void getUserMainCategories() {
    final _mainCategories = CategoryService.instance.mainServiceCategories;

    for (final element in eazyMen.mainServices ?? []) {
      userCategories.add(
        _mainCategories.firstWhere(
          (serviceProduct) => serviceProduct.serviceId == element,
        ),
      );
    }
    print(userCategories);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    eazyMen = EazyMenService.instance.eazyMen!;
    getUserMainCategories();
    getUserSubServices();
    getUserServiceProducts();
  }
}
