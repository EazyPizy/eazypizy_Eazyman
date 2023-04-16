import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazypizy_eazyman/Modules/ManageOrders/view_DetailOrder.dart';
import 'package:eazypizy_eazyman/widgets/easy_container.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/routes.dart';
import '../../theme/app_colors.dart';

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
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
    DateTime now2;
    return Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,
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
                child: TabBarView(children: [
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
                        child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) => Booking_Card()),
                      ),
                    ],
                  ),

                  /// New ///
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
                                            padding: const EdgeInsets.all(8.0),
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
                                            padding: const EdgeInsets.all(8.0),
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
                    ],
                  ),
                ]),
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
              Text(" Quantity $quantity")
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

  final DocumentReference documentReference =
      FirebaseFirestore.instance.collection("users").doc("user1");
}

class Booking_Card extends StatelessWidget {
  const Booking_Card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: EasyContainer(


        borderRadius: 10,
        width: double.infinity,
        height: 110,
        elevation: .5,
        padding: 4,
        color: EazyColors.white,
        showBorder: true,
        borderColor: Colors.black.withOpacity(0.2),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const DetailOrder(),
          ));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: EasyContainer(
                  color: EazyColors.white,
                  height: 75,
                  width: 150,
                  child: Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/eazyman-2e7a7.appspot.com/o/User_images%2FEazyMan.png?alt=media&token=a376abde-5072-4d49-b25d-a7b059f4fb29'),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Fridge",
                        style: Get.textTheme.titleMedium,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          'INR 199',
                          style: Get.textTheme.titleSmall,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      // const SizedBox(
                      //   width: 18,
                      // ),
                      Container(
                        color: Colors.green,
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          '49 OFF',
                          style: Get.textTheme.titleSmall,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.remove_red_eye_outlined,
                            size: 13,
                          ),
                          label: Text(
                            'Preview',
                            style: Get.textTheme.titleSmall,
                          ),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          Share.share('AC Service at 499 Only');
                        },
                        icon: const Icon(
                          Icons.share_sharp,
                          size: 13,
                        ),
                        label: Text(
                          'Share Service',
                          style: Get.textTheme.titleSmall,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
