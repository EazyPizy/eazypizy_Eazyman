import 'package:eazypizy_eazyman/Modules/orderDetail/model/mdl.booking.detail.dart';
import 'package:eazypizy_eazyman/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/eazy_spaces.dart';
import '../../widgets/easy_container.dart';
import '../ManageOrders/View_ManageOrders.dart';

class MyCustomerDetails extends StatefulWidget {
  const MyCustomerDetails({super.key});

  static const routeName = '/MyCustomerScreen';

  @override
  State<MyCustomerDetails> createState() => _MyCustomerDetailsState();
}

List<String> chipText = ["All", "yesterday", "This Week", "This Month"];

class _MyCustomerDetailsState extends State<MyCustomerDetails> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0.5,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.abc)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.abc_outlined)),
          ],
          title: Text(
            "Customers",
            style: Get.textTheme.titleMedium,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            EasyContainer(
                color: EazyColors.white,
                // margin: 8,
                padding: 16,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('Amit Bairwa'),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.whatshot,
                              color: Colors.green,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.phone,
                              color: Colors.blueAccent,
                            ))
                      ],
                    ),
                    const Text('+91-9023499063'),
                    Text(
                      'Email : Adibairwa01@gmail.com',
                      style: Get.textTheme.titleSmall,
                    ),
                    Space.vertical(10),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        children: const [
                          Text('Totel Sales'),
                          Text(
                            '+1999',
                            style: TextStyle(color: Colors.green, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
            Expanded(
              child: DefaultTabController(
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
                            Expanded(
                              child: ListView.builder(
                                itemCount: 10,
                                itemBuilder: (context, index) => BookingCard(
                                  BookingDetailModel(),
                                ),
                              ),
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
                                        child:
                                            customChips(chipText[i].toString()),
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
                                                    const Text(
                                                        " Date 12/06/22 ")
                                                  ]),
                                                ),
                                                ListTile(
                                                  leading: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
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
                                                              .substring(
                                                                  0, 4) !=
                                                          null)
                                                      ? Text("orderList"[i]
                                                          .substring(0, 4))
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
                                        child:
                                            customChips(chipText[i].toString()),
                                      )),
                            ),
                          ],
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            )

            // the tab bar with two items
            // SizedBox(
            //   height: 50,
            //   child: AppBar(
            //     bottom: const TabBar(
            //       tabs: [
            //         Tab(
            //           icon: Icon(Icons.directions_bike),
            //         ),
            //         Tab(
            //           icon: Icon(
            //             Icons.directions_car,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            //
            // // create widgets for each tab bar here
            // Expanded(
            //   child: TabBarView(
            //     children: [
            //       // first tab bar view widget
            //       Container(
            //         color: Colors.red,
            //         child: Center(
            //           child: Text(
            //             'Bike',
            //           ),
            //         ),
            //       ),
            //
            //       // second tab bar viiew widget
            //       Container(
            //         color: Colors.pink,
            //         child: Center(
            //           child: Text(
            //             'Car',
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
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
}
