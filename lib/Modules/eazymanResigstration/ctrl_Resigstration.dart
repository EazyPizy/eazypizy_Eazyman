
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../Models/main_service_category.dart';
import '../../core/logger.dart';
import '../../core/services/category_services.dart';


class RegistrationController extends GetxController {
  RegistrationController();
  // final TickerProvider widget;
  bool loading = true;
  bool catLoading = false;
  // List<EazyMenModel> eazyMen = [];
  late  List<MainCategoryModel> categories =
      CategoryService.instance.mainServiceCategories;

  // late final TabController tabController;

  final Logger _log = getLogger('Registration Controller');

  Future<void> getAllCategories() async {
    _log.v('Getting Categories');
    catLoading = true;
    update();
    try {
      final data =
          await FirebaseFirestore.instance.collection('ServiceCategory').get();
      categories = MainCategoryModel.jsonListToObject(data.docs);
    } catch (e) {
      _log.e(e.toString());
    } finally {
      catLoading = false;
      update();
    }
  }


  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    // await getAllCategories();
    // tabController = TabController(length: categories.length, vsync: widget);
    // tabController.addListener(() {
    //   getEasyMen(categories[tabController.index].serviceId ?? '');
    // });
    // await getEasyMen(categories[0].serviceId ?? '');
  }
}
