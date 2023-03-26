import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:uuid/uuid.dart';

import '../../core/services/user_service.dart';
import 'myCustomerModel.dart';

class MyCustomerController extends GetxController {
  List<Contact> contacts = [];

  List<Contact> filterContacts = [];
  TextEditingController searchController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  Future<void> addCustomer() async {
    var id = const Uuid();
    //  data["MyCustomerID"] = id.v1();
    final newData = MyCustomerModel(
        myCustomerName: nameController.text,
        myCustomerPhone: phoneController.text,
        myCustomerUID: id.v1());
    await FirebaseFirestore.instance
        .collection('EazyMen')
        .doc(EazyMenService.instance.eazyMen!.eazyManUid)
        .collection('myCustomers')
        .doc(id.v1())
        .set({
      'myCustomerPersonalDetails': {
        newData.toJson()
        // 'customer_Name': nameController.text,
        // 'customer_Number': phoneController.text,
        // 'my_CustomerUID': id.v1()
      }
    });
  }

  /// Get Customer


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}