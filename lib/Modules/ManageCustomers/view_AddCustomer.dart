// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:contacts_service/contacts_service.dart';
// import 'package:eazypizy/Providers/EazymanProvider.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class AddCustomer extends StatefulWidget {
//   static const routeName = '/AddCustomer';
//
//   const AddCustomer({super.key});
//
//   @override
//   State<AddCustomer> createState() => _AddCustomerState();
// }
//
// class _AddCustomerState extends State<AddCustomer> {
//   List<Contact> contacts = [];
//   List<Contact> filterContacts = [];
//   TextEditingController searchController = TextEditingController();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     bool _isSearching = searchController.text.isNotEmpty;
//     bool _isLoading = false;
//     EazymanProvider eazymanProvider = Provider.of(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         elevation: .5,
//         title: Text("Add New Customer", style: Get.textTheme.titleMedium),
//       ),
//       body: Column(
//         children: [
//           // _SearchBar(),
//           SizedBox(
//             height: 60,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: searchController,
//                 decoration: const InputDecoration(
//                     border: OutlineInputBorder(
//                         // borderSide: BorderSide(color: Colors.black)
//                         ),
//                     labelText: ' Search Customer',
//                     labelStyle: TextStyle(fontSize: 15, color: Colors.grey)),
//               ),
//             ),
//           ),
//           TextButton(
//               onPressed: () {
//                 Get.bottomSheet(
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         IconButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             icon: const Icon(Icons.cancel_sharp)),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             controller: nameController,
//                             validator: (value) {
//                               if (value != null && value.trim().length < 3) {
//                                 return 'This field requires a minimum of 3 characters';
//                               }
//
//                               return null;
//                             },
//                             decoration: const InputDecoration(
//                                 labelText: 'Enter Your Name',
//                                 border: OutlineInputBorder(),
//                                 errorBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Colors.red, width: 5))),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             controller: phoneController,
//                             validator: (value) {
//                               if (value != null && value.trim().length < 3) {
//                                 return 'This field requires a minimum of 3 characters';
//                               }
//
//                               return null;
//                             },
//                             decoration: const InputDecoration(
//                                 labelText: 'Enter Number',
//                                 border: OutlineInputBorder(),
//                                 errorBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Colors.red, width: 5))),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: ElevatedButton(
//                               onPressed: () {
//                                 eazymanProvider.saveCustomer({
//                                   "Customer Name": nameController.text,
//                                   "Customer Phone": phoneController.text,
//                                 });
//
//                                 nameController.clear();
//                                 phoneController.clear();
//                                 Navigator.pop(context);
//                                 Get.snackbar("Customer", "Saved Sucessflly");
//                               },
//                               child: const Text("Save")),
//                         )
//                       ],
//                     ),
//                     elevation: 20.0,
//                     enableDrag: false,
//                     backgroundColor: Colors.white,
//                     shape: const RoundedRectangleBorder(
//                         borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(10.0),
//                       topRight: Radius.circular(10.0),
//                       // barrierColor: Colors.red[50],
//                       // isDismissible: false,
//                     )));
//               },
//               child: const Text("Add Manually")),
//           Expanded(
//             child: Center(
//               child: !_isLoading
//                   ? SizedBox(
//                       height: 500,
//                       child: ListView.builder(
//                           shrinkWrap: true,
//                           itemCount: _isSearching == true
//                               ? filterContacts.length
//                               : contacts.length,
//                           itemBuilder: (context, index) {
//                             Contact contact = _isSearching
//                                 ? filterContacts[index]
//                                 : contacts[index];
//                             return ListTile(
//                               title: (contact.displayName != null)
//                                   ? Text(contact.displayName)
//                                   : Container(),
//                               //subtitle: Text(contact.phones.elementAt(0).value),
//                               leading: (contact.avatar != null &&
//                                       contact.avatar.length > 0)
//                                   ? CircleAvatar(
//                                       backgroundImage:
//                                           MemoryImage(contact.avatar),
//                                     )
//                                   : CircleAvatar(
//                                       child: Text(contact.initials()),
//                                     ),
//
//                               //subtitle: (contact.phones.elementAt(0).value != null)?
//                               //Text(contact.phones.elementAt(0).value):Container(),
//                             );
//                           }),
//                     )
//                   : const CircularProgressIndicator(),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _SearchBar() {
//     return Container(
//         color: Colors.white,
//         child: Container(
//           height: 60,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               controller: searchController,
//               decoration: const InputDecoration(
//                   border: OutlineInputBorder(
//                       // borderSide: BorderSide(color: Colors.black)
//                       ),
//                   labelText: ' Search Product',
//                   labelStyle: TextStyle(fontSize: 15, color: Colors.grey)),
//             ),
//           ),
//         ));
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _contactsPermissions();
//     getContacts();
//     searchController.addListener(() {
//       filterContact();
//     });
//   }
//
//   _contactsPermissions() async {
//     PermissionStatus permission = await Permission.contacts.status;
//     if (permission != PermissionStatus.granted &&
//         permission != PermissionStatus.permanentlyDenied) {
//       PermissionStatus permissionStatus = await Permission.contacts.request();
//       return permissionStatus;
//     } else {
//       return permission;
//     }
//   }
//
//   getContacts() async {
//     PermissionStatus contactsPermissionsStatus = await _contactsPermissions();
//     if (contactsPermissionsStatus == PermissionStatus.granted) {
//       List<Contact> _contacts =
//           (await ContactsService.getContacts(withThumbnails: false)).toList();
//       setState(() {
//         contacts = _contacts;
//       });
//     }
//   }
//
//   filterContact() {
//     List<Contact> _contacts = [];
//     _contacts.addAll(contacts);
//
//     if (searchController.text.isNotEmpty) {
//       _contacts.retainWhere((element) {
//         String searchTerm = searchController.text.toLowerCase();
//         String contactName = element.displayName.toLowerCase();
//         return contactName.contains(searchTerm);
//       });
//       setState(() {
//         filterContacts = _contacts;
//       });
//     }
//   }
// }
