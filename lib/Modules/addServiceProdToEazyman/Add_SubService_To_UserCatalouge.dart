import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazypizy_eazyman/Models/model_subService_product.dart';
import 'package:eazypizy_eazyman/Models/subService_category.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/services/category_services.dart';
import '../../widgets/CustomTabView.dart';

class AddSubServiceToUserCatalogue extends StatefulWidget {
  static const routeName = '/Add_SubService_To_UserCatalouge';

   final String mainServiceID;

  const AddSubServiceToUserCatalogue({super.key, required this.mainServiceID, });

  @override
  State<AddSubServiceToUserCatalogue> createState() =>
      AddSubServiceToUserCatalogueState();
}

class AddSubServiceToUserCatalogueState
    extends State<AddSubServiceToUserCatalogue> {
  int initPosition = 0;
  bool isChecked = false;
  bool isLoading = false;
  final List<SubServiceModel> subServiceCategories =
      CategoryService.instance.subServiceCategories;


  final List<SubServiceProductModel> subServiceProd =
      CategoryService.instance.serviceProducts;

  @override
  void dispose() {
    super.dispose();
    // EazymanProvider eazymanProvider =
    // Provider.of<EazymanProvider>(context, listen: false);
    // eazymanProvider.subCategoryItems;
  }

  @override
  Widget build(BuildContext context) {
    final selectedColor = Theme.of(context).primaryColor;
    // final eazyManProvider = Provider.of<EazymanProvider>(context);
    // var selectedSubService = eazyManProvider.subCategoryItems;

    final List<SubServiceModel> subServices =
   subServiceCategories
        .where(
          (element) => element.serviceId!.contains(widget.mainServiceID!),
    ).toList();
    // final List<SubServiceProductModel> subServicesProd =
    // subServiceProd
    //     .where(
    //       (element) => element.serviceProductId!.contains(widget.mainServiceID!),
    // ).toList();
    // print(" check ${subServicesProd.length}");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mainServiceID),
      ),
      body: SafeArea(
          child: isLoading == true
              ? const Center(child: CircularProgressIndicator())
              : Column(children: [
                  //Container(height: 200,color: Colors.redAccent,),
                  Expanded(
                    // child: Consumer<SubServiceCategoryProvider>(
                    //     builder: (context, subServiceProvider, child) {
                    //       return FutureBuilder(
                    //           future: subServiceProvider.getSubServiceCategory(),
                    //           builder: (context, snapshot) {
                    //             List<SubServiceCategoryModel> subServices =
                    //                 subServiceProvider.subServiceCategoryItems;
                    //
                    //             final filterList = subServices.where((element) {
                    //               return element.serviceID.contains(
                    //                   widget.mainServiceID);
                    //             }).toList();

                    child: CustomTabViews(
                        initPosition: initPosition,
                        itemCount: subServices.length,
                        tabBuilder: (context, index) => Tab(
                            text: subServices[index].subServiceName),
                        onPositionChange: (index) {
                          initPosition = index;
                        },


                        onScroll: (position) => print('Printed'),
                        pageBuilder: (context, index) => Center(child: Text(index.toString()), ),

                        // (BuildContext context,
                        //                                 int index) =>
                        //                                 Consumer<SubServiceCategoryProvider>(
                        //                                   builder: (context, subServiceProduct,
                        //                                       child) {
                        //                                     return FutureBuilder(
                        //                                         future: subServiceProduct
                        //                                             .getSubServiceProduct(
                        //                                             filterList[index].subServiceID),
                        //                                         builder: (context, snapshot) {
                        //                                           List<ServiceProductModel>
                        //                                           subServiceProd = subServiceProduct
                        //                                               .subServiceProductItems;
                        //
                        //                                           return subServiceProd.isNotEmpty
                        //                                               ? ListView.builder(
                        //                                               shrinkWrap: true,
                        //                                               //physics:
                        //                                               //   const NeverScrollableScrollPhysics(),
                        //                                               itemCount:
                        //                                               subServiceProd.length,
                        //                                               itemBuilder: (ctx, i) =>
                        //                                                   ListTile(
                        //                                                       onTap: () {
                        //                                                         eazyManProvider
                        //                                                             .addSubServicesToEazyman(
                        //                                                             subServiceProd[
                        //                                                             i]
                        //                                                                 .serviceProdID);
                        //                                                         Get.snackbar(
                        //                                                             "Item ${subServiceProd[i]
                        //                                                                 .serviceProdName} Added",
                        //                                                             "This is added to profile",
                        //                                                             backgroundColor:
                        //                                                             Colors.green);
                        //                                                       },
                        //                                                       leading: CircleAvatar(
                        //                                                           child: subServiceProd[i]
                        //                                                               .serviceProdImage !=
                        //                                                               null
                        //                                                               ? Image
                        //                                                               .network(
                        //                                                               subServiceProd[i]
                        //                                                                   .serviceProdImage)
                        //                                                               : Container(
                        //                                                             color: Colors
                        //                                                                 .green,
                        //                                                             height: 20,
                        //                                                             width: 20,
                        //                                                           )),
                        //                                                       title: Text(
                        //                                                         subServiceProd[i]
                        //                                                             .serviceProdName,
                        //                                                       ),
                        //                                                       subtitle: Text(
                        //                                                           subServiceProd[i]
                        //                                                               .serviceProdID),
                        //                                                       trailing: (selectedSubService
                        //                                                           .contains(
                        //                                                           subServiceProd[i]
                        //                                                               .serviceProdID)
                        //                                                           ? const Icon(
                        //                                                           Icons.check_box,
                        //                                                           color: Colors
                        //                                                               .green,
                        //                                                           size: 26)
                        //                                                           : Icon(Icons
                        //                                                           .check_box_outline_blank,
                        //                                                           color: selectedColor,
                        //                                                           size: 26))))
                        //                                               : const Center(
                        //                                                 child: Text(" No Data"),
                        //                                           );

                        ),
                  )
                ])),
    );
  }

// Widget buildSelectButton(List<String> listItems,) {
//   final eazyManProvider = Provider.of<EazymanProvider>(context);
//   final label = listItems.isNotEmpty
//       ? 'Upload ${listItems.length} Service '
//       : "Continue";
//
//   return listItems.isNotEmpty
//       ? Container(
//     padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
//     color: Theme
//         .of(context)
//         .primaryColor,
//     child: ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.white,
//         shape: const StadiumBorder(),
//         minimumSize: const Size.fromHeight(40),
//         //  primary: Colors.green,
//       ),
//       onPressed: () async {
//         isLoading = true;
//         //  await Future.delayed(Duration(seconds: 1));
//         await uploadSubServices(listItems, widget.mainServiceID);
//         isLoading = false;
//         Navigator.pop(
//           context,
//         );
//         listItems.clear();
//       },
//       child: Text(
//         label,
//         style: const TextStyle(color: Colors.black, fontSize: 16),
//       ),
//     ),
//   )
//       : Container();
// }}

  uploadSubServices(
      List<String> subServices,
      //String subServiceID,
      String mainServiceID) {
    List<String> id = subServices;
    for (int i = 0; i < id.length; i++) {
      FirebaseFirestore.instance
          .collection("EazyMen")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection("UserServices")
          .doc(mainServiceID)
          .collection("mySubServices")
          .doc(id[i])
          .set({
        "serviceProdID": id[i],
        "MainServiceID": mainServiceID,
      });
    }
  }

  clearList(List<String> subServices) {
    // List<String> ids = subServices;

    subServices.clear();
  }
}
