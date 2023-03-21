// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:eazypizy_eazyman/Modules/updateCatelog/components/custom_tab_view.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class UpdateServicesScreen extends StatefulWidget {
//   // static const routeName = '/UpdateServicesScreen';

//   final String mainServiceID;
//   final String mainServiceName;

//   const UpdateServicesScreen(
//     this.mainServiceID,
//     this.mainServiceName,
//   ) : super();

//   @override
//   State<UpdateServicesScreen> createState() => _UpdateServicesScreenState();
// }

// class _UpdateServicesScreenState extends State<UpdateServicesScreen> {
//   int initPosition = 0;
//   bool isChecked = false;
//   bool isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     final selectedColor = Get.theme.primaryColor;
//     final eazyManProvider = Provider.of<EazymanProvider>(context);
//     var selectedSubService = eazyManProvider.subCategoryItems;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.mainServiceName),
//       ),
//       body: SafeArea(
//         child: isLoading == true
//             ? const Center(child: CircularProgressIndicator())
//             : Column(
//                 children: [
//                   //Container(height: 200,color: Colors.redAccent,),
//                   Expanded(
//                       child: CustomTabView(
//                           initPosition: initPosition,
//                           itemCount: [].length,
//                           tabBuilder: (context, index) =>
//                               Tab(text: [][index].subServiceName),
//                           onPositionChange: (index) {
//                             print('current position: $index');
//                             initPosition = index;
//                           },
//                           onScroll: (position) => print('$position'),
//                           pageBuilder: (BuildContext context, int index) => subServiceProd
//                                   .isNotEmpty
//                               ? ListView.builder(
//                                   shrinkWrap: true,
//                                   //physics:
//                                   //   const NeverScrollableScrollPhysics(),
//                                   itemCount: subServiceProd.length,
//                                   itemBuilder: (ctx, i) => ListTile(
//                                       onTap: () {
//                                         eazyManProvider.addSubServicesToEazyman(
//                                             subServiceProd[i].serviceProdID);
//                                         Get.snackbar(
//                                             "Item ${subServiceProd[i].serviceProdName} Added",
//                                             "This is added to profile",
//                                             backgroundColor: Colors.green);
//                                       },
//                                       leading: CircleAvatar(
//                                           child: subServiceProd[i]
//                                                       .serviceProdImage !=
//                                                   null
//                                               ? Image.network(subServiceProd[i]
//                                                   .serviceProdImage)
//                                               : Container(
//                                                   color: Colors.green,
//                                                   height: 20,
//                                                   width: 20,
//                                                 )),
//                                       title: Text(
//                                         subServiceProd[i].serviceProdName,
//                                       ),
//                                       subtitle:
//                                           Text(subServiceProd[i].serviceProdID),
//                                       trailing: (selectedSubService.contains(
//                                               subServiceProd[i].serviceProdID)
//                                           ? const Icon(Icons.check_box,
//                                               color: Colors.green, size: 26)
//                                           : Icon(Icons.check_box_outline_blank,
//                                               color: selectedColor, size: 26))))
//                               : const Center(
//                                   child: Text(" No Data"),
//                                 ))),

//                   buildSelectButton(
//                     selectedSubService,
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }

//   Widget buildSelectButton(
//     List<String> listItems,
//   ) {
//     final eazyManProvider = Provider.of<EazymanProvider>(context);
//     final label = listItems.isNotEmpty
//         ? 'Upload ${listItems.length} Service '
//         : "Continue";

//     return listItems.isNotEmpty
//         ? Container(
//             padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
//             color: Theme.of(context).primaryColor,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.white,
//                 shape: const StadiumBorder(),
//                 minimumSize: const Size.fromHeight(40),
//                 //  primary: Colors.green,
//               ),
//               onPressed: () async {
//                 isLoading = true;
//                 //  await Future.delayed(Duration(seconds: 1));
//                 await uploadSubServices(listItems, widget.mainServiceID);
//                 eazyManProvider.clearList(eazyManProvider.subCategoryItems);
//                 isLoading = false;
//                 Navigator.pop(
//                   context,
//                 );
//               },
//               child: Text(
//                 label,
//                 style: const TextStyle(color: Colors.black, fontSize: 16),
//               ),
//             ),
//           )
//         : Container();
//   }
// }

// uploadSubServices(
//     List<String> subServices,
//     //String subServiceID,
//     String mainServiceID) {
//   print("mainID ${mainServiceID}");
//   List<String> id = subServices;
//   for (int i = 0; i < id.length; i++) {
//     FirebaseFirestore.instance
//         .collection("EazyMen")
//         .doc(FirebaseAuth.instance.currentUser?.uid)
//         .collection("UserServices")
//         .doc(mainServiceID)
//         .collection("mySubServices")
//         .doc(id[i])
//         .set({
//       "serviceProdID": id[i],
//       "MainServiceID": mainServiceID,
//     });
//   }
// }

// clearList(List<String> subServices) {
//   // List<String> ids = subServices;

//   subServices.clear();
// }

// buildShowDialog(BuildContext context) {
//   return showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       });
// }
