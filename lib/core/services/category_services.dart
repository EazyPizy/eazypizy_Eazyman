import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../Models/main_service_category.dart';
import '../../Models/model_subService_product.dart';
import '../../Models/subService_category.dart';
import '../logger.dart';

class CategoryService extends GetxService {
  static CategoryService get instance => Get.find<CategoryService>();
  final Logger _log = getLogger('CategoryService');

  late final List<MainCategoryModel> _mainServiceCategories;
  late final List<SubServiceModel> _subServiceCategories;
  late final List<SubServiceProductModel> _subServiceProducts;

  Future<CategoryService> init() async {
    await Future.wait([
      loadMainServiceCategories(),
      loadSubServiceCategories(),
      loadSubServiceProducts(),
    ]).onError(
      (error, stackTrace) => Future.value([]),
    );
    return this;
  }

  List<MainCategoryModel> get mainServiceCategories => _mainServiceCategories;

  List<SubServiceModel> get subServiceCategories => _subServiceCategories;

  List<SubServiceProductModel> get serviceProducts => _subServiceProducts;

  Future<void> loadMainServiceCategories() async {
    _log.v('Loading Main Service Categories...');
    try {
      final data =
          await FirebaseFirestore.instance.collection('ServiceCategory').get();
      _mainServiceCategories = MainCategoryModel.jsonListToObject(data.docs);
      _log.v('Done loading Main Service Categories');
    } catch (e) {
      _log.e(e.toString());
    } finally {}
  }

  Future<void> loadSubServiceCategories() async {
    _log.v('Loading Sub Service Categories...');
    try {
      final data = await FirebaseFirestore.instance
          .collection('SubServiceCategory')
          .get();
      _subServiceCategories = SubServiceModel.jsonListToObject(data.docs);
      _log.v('Done loading Sub Service Categories');
    } catch (e) {
      _log.e(e.toString());
    } finally {}
  }

  Future<void> loadSubServiceProducts() async {
    _log.v('Loading Sub Service Products...');
    try {
      final data =
          await FirebaseFirestore.instance.collection('ServiceProducts').get();
      _subServiceProducts = SubServiceProductModel.jsonListToObject(data.docs);
      _log.v('Done loading Sub Service Products');
    } catch (e) {
      _log.e(e.toString());
    } finally {}
  }
}
