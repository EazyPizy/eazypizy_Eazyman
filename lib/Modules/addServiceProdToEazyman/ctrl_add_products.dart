import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazypizy_eazyman/Models/model_subService_product.dart';
import 'package:eazypizy_eazyman/Models/subService_category.dart';
import 'package:eazypizy_eazyman/core/services/category_services.dart';
import 'package:eazypizy_eazyman/core/services/user_service.dart';
import 'package:get/get.dart';

class AddSubServiceProductsController extends GetxController {
  final _categoryService = CategoryService.instance;
  final List<SubServiceProductModel> eazymenProducts = [];
  final List<SubServiceModel> eazymenServices = [];

  toggleProduct(SubServiceProductModel product, SubServiceModel subService) {
    // if (eazymenServices.contains(subService)) {
    //   eazymenServices.remove(subService);
    // } else {
    //   eazymenServices.add(subService);
    // }
    if (ifEazymenProduct(product)) {
      eazymenProducts.remove(product);
    } else {
      eazymenProducts.add(product);
    }
    print(eazymenProducts);
    update();
  }

  bool ifEazymenProduct(SubServiceProductModel product) {
    return eazymenProducts.contains(product);
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
    FirebaseFirestore.instance
        .collection('EazyMen')
        .doc(EazyMenService.instance.eazyMen!.eazyManUid)
        .update({
      'Sub_Services': eazymenServices.map((e) => e.subServiceId).toList(),
    });
    FirebaseFirestore.instance
        .collection('EazyMen')
        .doc(EazyMenService.instance.eazyMen!.eazyManUid)
        .update({
      'Service_Product': eazymenProducts.map((e) => e.serviceProductId).toList()
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    for (var product in EazyMenService.instance.eazyMen!.subServiceProdcuts!) {
      eazymenProducts.add(_categoryService.serviceProducts.firstWhere(
          (element) => element.serviceProductId == product.productId));
    }
  }
}
