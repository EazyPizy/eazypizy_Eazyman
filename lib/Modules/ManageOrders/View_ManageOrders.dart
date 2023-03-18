import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ManageOrders extends StatefulWidget {
  const ManageOrders({super.key});

  @override
  State<ManageOrders> createState() => _ManageOrdersState();
}

List<String> chipText = ["All", "yesterday", "This Week", "This Month"];
bool isloading = false;

class _ManageOrdersState extends State<ManageOrders> {
  // BookingOperationStatus _deliveryStatus = BookingOperationStatus.pending;

  @override
  Widget build(BuildContext context) {
    // final orderData = Provider.of<EazymanProvider>(context, listen: true);
    // final orderList = orderData.myOrderList;
    // final bookingList = orderData.myBookingList;
    //
    // final estimatedCustomerData =
    //     Provider.of<EstimateProvider>(context, listen: true);
    // final estimatedCustomer = estimatedCustomerData.estimatedCustomers;

    // final filterList = orderList.where((element) {
    //   return element.eazymanUID
    //       .contains(FirebaseAuth.instance.currentUser?.uid);
    // }).toList();
    // print(orderList.length);

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
    DateTime now2;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,

          elevation: 0.5,

          title: Text(
            "Manage Orders",
            style: Get.textTheme.titleMedium,
          ),
        ),
        body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              const SizedBox(
                height: 60,
                child: TabBar(
                    // unselectedLabelColor: Colors.redAccent,
                    labelColor: Colors.blue,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: Colors.blue,
                    labelPadding: EdgeInsets.all(20),
                    // indicator: BoxDecoration(
                    //     borderRadius: BorderRadius.only(
                    //         topRight: Radius.circular(5),
                    //         topLeft: Radius.circular(5)),
                    //     color: Colors.redAccent),
                    tabs: [
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Booking"),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Orders"),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Estimate"),
                        ),
                      ),
                    ]),
              ),
              Expanded(
                child: SizedBox(
                  height: 606,
                  child: TabBarView(children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ListView.builder(
                                // shrinkWrap: true,
                                // physics: const NeverScrollableScrollPhysics(),
                                itemCount: 10,
                                itemBuilder: (context, index) => InkWell(
                                      onTap: () {
                                        // bookingDetails(
                                        //    " bookingID $index");
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            //color: Colors.blue,
                                            border: Border.all(
                                              color:
                                                  Colors.blue.withOpacity(0.25),
                                              width: 1,
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              ListTile(
                                                title: (" bookingN $index" !=
                                                        null)
                                                    ? Text(" bookingName $index")
                                                    : Container(),
                                                subtitle: const Text("Price"),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: const [
                                                    Icon(Icons.done),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text("Booking Status"),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.10,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: chipText.length,
                              itemBuilder: (context, i) => Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: customChips(chipText[i].toString()),
                                  )),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ListView.builder(
                              // shrinkWrap: true,
                              // physics: const NeverScrollableScrollPhysics(),
                              itemCount: 10,
                              itemBuilder: (context, i) => Card(
                                  elevation: 1,
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          // orderDetail("orderList"[i]);
                                        },
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(children: [
                                                Text(
                                                    "Order # ${"orderList"[i].substring(0, 6)}"),
                                                const Spacer(),
                                                const Text(" Date 12/06/22 ")
                                              ]),
                                            ),
                                            ListTile(
                                              leading: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    color: Colors.black54,
                                                    width: 1,
                                                  ),
                                                ),
                                                height: 60,
                                                width: 60,
                                                child: Image.asset(
                                                    "assets/eazymen.jpg"),
                                              ),
                                              title: ("orderList"[i]

                                                          .substring(0, 4) !=
                                                      null)
                                                  ? Text("orderList"[i]
                                                      .substring(0, 4))
                                                  : Container(),
                                              subtitle: const Text("Price"),
                                            ),
                                            Divider(),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: const [
                                                  Icon(Icons.done),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text("Booking Status"),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.10,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: chipText.length,
                              itemBuilder: (context, i) => Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: customChips(chipText[i].toString()),
                                  )),
                        ),
                        // Expanded(
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(15.0),
                        //     child: ListView.builder(
                        //         // shrinkWrap: true,
                        //         // physics: const NeverScrollableScrollPhysics(),
                        //         itemCount: 10,
                        //         itemBuilder: (context, i) => ListTile(
                        //               onTap: () async {
                        //                 final file = await PdfApi.loadNetwork(
                        //                     "https://firebasestorage.googleapis.com/v0/b/eazyman-2e7a7.appspot.com/o/PDF%2F3e7406a0-9d4c-11ed-b4e9-6b75a552f2d6?alt=media&token=405316a7-8ba2-493f-960e-074a11cd435f");
                        //                 openPDF(context, file);
                        //                 isloading = false;
                        //               },
                        //               title: Text(estimatedCustomer[i]
                        //                   .phoneNumber
                        //                   .toString()),
                        //               subtitle: Text(
                        //                   estimatedCustomer[i].estimatedId),
                        //             )
                        //
                        //         // Card(
                        //         // elevation: 1,
                        //         // child: Column(
                        //         //   children: [
                        //         //     InkWell(
                        //         //       onTap: () async {
                        //         //        // orderDetail(orderList[i].orderID);
                        //         //         final file = await PdfApi.loadNetwork("https://firebasestorage.googleapis.com/v0/b/eazyman-2e7a7.appspot.com/o/PDF%2F3e7406a0-9d4c-11ed-b4e9-6b75a552f2d6?alt=media&token=405316a7-8ba2-493f-960e-074a11cd435f");
                        //         //         openPDF(context, file);
                        //         //
                        //         //       },
                        //         //       child: Column(
                        //         //         children: [
                        //         //           Padding(
                        //         //             padding: const EdgeInsets.all(8.0),
                        //         //             child: Row(children: [
                        //         //               Text(
                        //         //                   "Order # ${orderList[i].orderID.substring(0, 6)}"),
                        //         //               const Spacer(),
                        //         //               const Text(" Date 12/06/22 ")
                        //         //             ]),
                        //         //           ),
                        //         //           ListTile(
                        //         //             leading: Container(
                        //         //               decoration: BoxDecoration(
                        //         //                 borderRadius:
                        //         //                 BorderRadius.circular(5),
                        //         //                 color: Colors.white,
                        //         //                 border: Border.all(
                        //         //                   color: Colors.black54,
                        //         //                   width: 1,
                        //         //                 ),
                        //         //               ),
                        //         //               height: 60,
                        //         //               width: 60,
                        //         //               child:
                        //         //               Image.asset("assets/eazymen.jpg"),
                        //         //             ),
                        //         //             title: (orderList[i]
                        //         //                 .orderID
                        //         //                 .substring(0, 4) !=
                        //         //                 null)
                        //         //                 ? Text(orderList[i]
                        //         //                 .orderID
                        //         //                 .substring(0, 4))
                        //         //                 : Container(),
                        //         //             subtitle: const Text("Price"),
                        //         //           ),
                        //         //           Divider(),
                        //         //           Padding(
                        //         //             padding: const EdgeInsets.all(8.0),
                        //         //             child: Row(
                        //         //               children: const [
                        //         //                 Icon(Icons.done),
                        //         //                 SizedBox(
                        //         //                   width: 10,
                        //         //                 ),
                        //         //                 Text("Booking Status"),
                        //         //               ],
                        //         //             ),
                        //         //           )
                        //         //         ],
                        //         //       ),
                        //         //     ),
                        //         //   ],
                        //         // )),
                        //         ),
                        //   ),
                        // ),
                      ],
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ));
  }

  Widget customChips(String title) {
    return Chip(
      elevation: 1,
      padding: const EdgeInsets.all(8),
      backgroundColor: Colors.greenAccent[100],
      label: Text(
        title,
        style: const TextStyle(fontSize: 10),
      ), //Text
    );
  }
  //
  // Future orderDetail(String orderID) {
  //   return Get.bottomSheet(SizedBox(child: Consumer<EazymanProvider>(
  //           builder: (context, eazyManProvider, child) {
  //     return FutureBuilder(
  //         future: eazyManProvider.getEazyManOrders(orderID),
  //         builder: (context, snapshot) {
  //           final orderedItems = eazyManProvider.myEazyManOrders;
  //           return orderedItems.isNotEmpty
  //               ? ListView.builder(
  //                   // shrinkWrap: true,
  //                   // physics: NeverScrollableScrollPhysics(),
  //                   itemCount: orderedItems.length,
  //                   itemBuilder: (ctx, i) => orderCard(
  //                       orderedItems[i].imageURLs,
  //                       orderedItems[i].productName,
  //                       orderedItems[i].sellingPrice,
  //                       5),
  //                 )
  //               : const Center(
  //                   child: Text("Empty List"),
  //                 );
  //         });
  //   })),
  //       elevation: 2.0,
  //       enableDrag: false,
  //       backgroundColor: Colors.white,
  //       shape: const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(10.0),
  //         topRight: Radius.circular(10.0),
  //         // barrierColor: Colors.red[50],
  //         // isDismissible: false,
  //       )));
  // }
  //
  // Future bookingDetails(String bookingID) {
  //   return Get.bottomSheet(
  //       SizedBox(
  //         width: 500,
  //         height: MediaQuery.of(context).size.height * 0.90,
  //         child: Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: [
  //               Expanded(
  //                 child: Consumer<EazymanProvider>(
  //                     builder: (context, eazyManProvider, child) {
  //                   return FutureBuilder(
  //                       future: eazyManProvider.getMyBookingProducts(bookingID),
  //                       builder: (context, snapshot) {
  //                         final orderedItems = eazyManProvider.myBookingProduct;
  //
  //                         return orderedItems.isNotEmpty
  //                             ? ListView.builder(
  //                                 //shrinkWrap: true,
  //                                 // physics: NeverScrollableScrollPhysics(),
  //                                 itemCount: orderedItems.length,
  //                                 itemBuilder: (ctx, i) => ListTile(
  //                                   title: Text(
  //                                     orderedItems[i].productName,
  //                                   ),
  //                                   subtitle: Text(orderedItems[i]
  //                                       .sellingPrice
  //                                       .toString()),
  //                                 ),
  //                               )
  //                             : const Center(
  //                                 child: Text("Empty List"),
  //                               );
  //                       });
  //                 }),
  //               ),
  //               Text("Customer Details"),
  //               ListTile(
  //                 title: Text("Amit BAirwa"),
  //                 subtitle: Text("9023499063"),
  //                 trailing:
  //                     IconButton(onPressed: () {}, icon: Icon(Icons.whatshot)),
  //               ),
  //               const Text("Customer Address"),
  //               ListTile(
  //                 title: const Text("House No C-31"),
  //                 subtitle: const Text("Ashol Vihar"),
  //                 trailing:
  //                     IconButton(onPressed: () {}, icon: Icon(Icons.whatshot_rounded)),
  //               ),
  //               panelButtonsChange(_deliveryStatus),
  //             ],
  //           ),
  //         ),
  //       ),
  //       elevation: 2.0,
  //       enableDrag: true,
  //       ignoreSafeArea: true,
  //       isScrollControlled: true,
  //       backgroundColor: Colors.white,
  //       shape: const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(10.0),
  //         topRight: Radius.circular(10.0),
  //
  //         // barrierColor: Colors.red[50],
  //         // isDismissible: false,
  //       )));
  // }

  Widget orderCard(String image, String name, double price, int quantity) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              height: 60,
              width: 60,
              child: image != null
                  ? Image.network(image)
                  : Container(
                      color: Colors.green,
                      height: 20,
                      width: 20,
                    )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name),
              const Text("Size"),
              Text(" Quantity ${quantity}")
            ],
          ),
        ),
        const Spacer(),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(price.toString()),
        )
      ],
    );
  }

  // orderOverView(String bookingID, String customerName) {
  //   SizedBox(
  //     height: 150,
  //     child: Card(
  //         elevation: 1,
  //         child: Column(
  //           children: [
  //             InkWell(
  //               onTap: () {
  //                 bookingDetails(bookingID);
  //               },
  //               child: Column(
  //                 children: [
  //                   ListTile(
  //                     title: (customerName != null)
  //                         ? Text(customerName)
  //                         : Container(),
  //                     subtitle: const Text("Price"),
  //                   ),
  //                   Padding(
  //                     padding: EdgeInsets.all(8.0),
  //                     child: Row(
  //                       children: const [
  //                         Icon(Icons.done),
  //                         SizedBox(
  //                           width: 10,
  //                         ),
  //                         Text("Booking Status"),
  //                       ],
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ],
  //         )),
  //   );
  // }

  final DocumentReference documentReference =
      FirebaseFirestore.instance.collection("users").doc("user1");

  // documentReference.get().then((d) {
  // if (documentSnapshot.exists && documentSnapshot.data.containsKey("email")) {
  // // The email field exists
  // String email = documentSnapshot.data["email"];
  // print("Email: $email");
  // } else {
  // // The email field does not exist
  // print("Email field does not exist");
  // }
  // });



}
