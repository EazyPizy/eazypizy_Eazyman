import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class AddCustomer extends StatefulWidget {
  static const routeName = '/AddCustomer';

  const AddCustomer({super.key});

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  List<Contact> contacts = [];
  List<Contact> filterContacts = [];
  TextEditingController searchController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isSearching = searchController.text.isNotEmpty;
    bool isLoading = false;

    return Scaffold(
      appBar: AppBar(
        elevation: .5,
        title: Text("Add New Customers", style: Get.textTheme.titleMedium),
      ),
      body: Column(
        children: [
          // _SearchBar(),
          SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        // borderSide: BorderSide(color: Colors.black)
                        ),
                    labelText: ' Search Customer',
                    labelStyle: TextStyle(fontSize: 15, color: Colors.grey)),
              ),
            ),
          ),
          TextButton(
              onPressed: () {

              },
              child: const Text("Adddd Manually")),
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
                              //subtitle: Text(contact.phones.elementAt(0).value),
                              leading: (contact.avatar != null)
                                  // &&
                                  //     contact.avatar.length > 0)
                                  ? CircleAvatar(
                                      backgroundImage:
                                          MemoryImage(contact.avatar!),
                                    )
                                  : CircleAvatar(
                                      child: Text(contact.initials()),
                                    ),

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
  }

  Widget _SearchBar() {
    return Container(
        color: Colors.white,
        child: Container(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: searchController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      // borderSide: BorderSide(color: Colors.black)
                      ),
                  labelText: ' Search Product',
                  labelStyle: TextStyle(fontSize: 15, color: Colors.grey)),
            ),
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    _contactsPermissions();
    getContacts();
    searchController.addListener(() {
      filterContact();
    });
  }

  _contactsPermissions() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }

  getContacts() async {
    PermissionStatus contactsPermissionsStatus = await _contactsPermissions();
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
