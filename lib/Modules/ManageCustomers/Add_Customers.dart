import 'package:contacts_service/contacts_service.dart';
import 'package:eazypizy_eazyman/Modules/ManageCustomers/ctrl_myCustomers.dart';
import 'package:eazypizy_eazyman/widgets/EasySnackBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../theme/eazy_spaces.dart';

class ADDCustomers extends StatefulWidget {
  const ADDCustomers({Key? key}) : super(key: key);

  @override
  State<ADDCustomers> createState() => _ADDCustomersState();
}

class _ADDCustomersState extends State<ADDCustomers> {
  List<Contact> contacts = [];

  List<Contact> filterContacts = [];

  TextEditingController searchController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isSearching = searchController.text.isNotEmpty;
    bool isLoading = false;
    return GetBuilder(
        init: MyCustomerController(),
        builder: (controller) {
          return Scaffold(

            appBar: AppBar(
              title: Text("Add New Customers", style: Get.textTheme.titleMedium),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // _SearchBar(),
                 SizedBox(
                  height: 60.h,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      // controller: searchController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              // borderSide: BorderSide(color: Colors.black)
                              ),
                          labelText: ' Search Customer',
                          labelStyle:
                              TextStyle(fontSize: 15, color: Colors.grey)),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Get.bottomSheet(
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.cancel_sharp)),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: controller.nameController,
                                  validator: (value) {
                                    if (value != null &&
                                        value.trim().length < 3) {
                                      return 'This field requires a minimum of 3 characters';
                                    }

                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      labelText: 'Enter Your Name',
                                      border: OutlineInputBorder(),
                                      errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 5))),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: controller.phoneController,
                                  validator: (value) {
                                    if (value != null &&
                                        value.trim().length < 3) {
                                      return 'This field requires a minimum of 3 characters';
                                    }

                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      labelText: 'Enter Number',
                                      border: OutlineInputBorder(),
                                      errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 5))),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    controller.addCustomer();
                                    controller.nameController.clear();
                                    controller.phoneController.clear();
                                    Navigator.pop(context);
                                    EazySnackBar.buildSuccessSnackbar(
                                        "Customer", "Saved Successfully");
                                  },
                                  child: const Text("Save"),
                                ),
                              )
                            ],
                          ),
                          elevation: 20.0,
                          enableDrag: false,
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                            // barrierColor: Colors.red[50],
                            // isDismissible: false,
                          )));
                    },
                    child: const Text('Add Manually ')),
                Expanded(
                  child: Center(
                    child: !isLoading
                        ? SizedBox(
                            height: 500,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: isSearching == true
                                    ? filterContacts.length
                                    : contacts.length,
                                itemBuilder: (context, index) {
                                  Contact contact = isSearching
                                      ? filterContacts[index]
                                      : contacts[index];
                                  return ListTile(
                                    title: (contact.displayName != null)
                                        ? Text(contact?.displayName ?? '')
                                        : Container(),
                                    // subtitle: Text(contact?.phones.toString() ?? ''),
                                    // leading: (contact.avatar != null)
                                    //      &&
                                    //          contact.avatar.length > 0)
                                    //     ? CircleAvatar(
                                    //         backgroundImage:
                                    //             MemoryImage(contact.avatar!),
                                    //       )
                                    //     : CircleAvatar(
                                    //         child: Text(contact.initials()),
                                    //       )

                                    //subtitle: (contact.phones.elementAt(0).value != null)?
                                    //Text(contact.phones.elementAt(0).value):Container(),
                                  );
                                }),
                          )
                        : const CircularProgressIndicator(),
                  ),
                )
              ],
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    _getContactPermission();
    getContacts();
    searchController.addListener(() {
      filterContact();
    });
  }

  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }

  void _handleInvalidPermissions(PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.denied) {
      final snackBar = SnackBar(content: Text('Access to contact data denied'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      final snackBar =
          SnackBar(content: Text('Contact data not available on device'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  // _contactsPermissions() async {
  //   PermissionStatus permission = await Permission.contacts.status;
  //   if (permission != PermissionStatus.granted &&
  //       permission != PermissionStatus.permanentlyDenied) {
  //     PermissionStatus permissionStatus = await Permission.contacts.request();
  //     return permissionStatus;
  //   } else {
  //     return permission;
  //   }
  // }

  getContacts() async {
    PermissionStatus contactsPermissionsStatus = await _getContactPermission();
    if (contactsPermissionsStatus == PermissionStatus.granted) {
      List<Contact> _contacts =
          (await ContactsService.getContacts(withThumbnails: false)).toList();
      setState(() {
        contacts = _contacts;
      });
    }
  }

  filterContact() {
    List<Contact> _contacts = [];
    _contacts.addAll(contacts);

    if (searchController.text.isNotEmpty) {
      _contacts.retainWhere((element) {
        String searchTerm = searchController.text.toLowerCase();
        String? contactName = element.displayName?.toLowerCase();
        return contactName!.contains(searchTerm);
      });
      setState(() {
        filterContacts = _contacts;
      });
    }
  }
}
