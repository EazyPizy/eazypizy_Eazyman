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
             }
    });
  }

  List<MyCustomerModel> _myCustomers = [];

  List<MyCustomerModel> get myCustomers {
    return [..._myCustomers];
  }
  set myCustomers(List<MyCustomerModel> existingCustomers) {
    _myCustomers = existingCustomers;
  }
  void getMyCustomers() async {
    QuerySnapshot snapshots = await FirebaseFirestore.instance
        .collection('EazyMen')
        .doc(EazyMenService.instance.eazyMen!.eazyManUid)
        .collection("myCustomers")
        .get();

    List<MyCustomerModel> _myCustomerList = [];
    for (var document in snapshots.docs) {
      MyCustomerModel myCustomers =
      MyCustomerModel.fromJson((document.data() as List)[0] as Map<String, dynamic>);
      _myCustomerList.add(myCustomers);
    }

    print(_myCustomerList.length);
    myCustomers = _myCustomerList;
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMyCustomers();
  }
}