import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazypizy_eazyman/Modules/ManageOrders/ctrl.manage.orders.dart';
import 'package:eazypizy_eazyman/Modules/orderDetail/model/mdl.booking.detail.dart';
import 'package:eazypizy_eazyman/widgets/easy_container.dart';
import 'package:eazypizy_eazyman/widgets/eazy_networkimage.dart';
import 'package:eazypizy_eazyman/widgets/simmerLoader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../theme/app_colors.dart';
import '../../theme/eazy_spaces.dart';

class ManageOrders extends StatefulWidget {
  const ManageOrders({super.key});

  @override
  State<ManageOrders> createState() => _ManageOrdersState();
}

List<String> chipText = ["New", "Pending", "Upcoming", "Cancelled"];
bool isloading = false;

class _ManageOrdersState extends State<ManageOrders> {
  // BookingOperationStatus _deliveryStatus = BookingOperationStatus.pending;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
    DateTime now2;
    return GetBuilder(
        init: ManageOrderController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Bookings",
              ),
            ),
            // body: DefaultTabController(
            //   length: 2,
            //   child: Column(
            //     children: [
            //       SizedBox(
            //         height: 60.h,
            //         child: const TabBar(

            //             // unselectedLabelColor: Colors.redAccent,
            //             labelColor: Colors.blue,
            //             indicatorSize: TabBarIndicatorSize.tab,
            //             indicatorColor: Colors.blue,
            //             labelPadding: EdgeInsets.all(20),
            //             // indicator: BoxDecoration(
            //             //     borderRadius: BorderRadius.only(
            //             //         topRight: Radius.circular(5),
            //             //         topLeft: Radius.circular(5)),
            //             //     color: Colors.white),
            //             tabs: [
            //               Tab(
            //                 child: Align(
            //                   alignment: Alignment.center,
            //                   child: Text("Booking"),
            //                 ),
            //               ),
            //               // Tab(
            //               //   child: Align(
            //               //     alignment: Alignment.center,
            //               //     child: Text("Orders"),
            //               //   ),
            //               // ),
            //               // Tab(
            //               //   child: Align(
            //               //     alignment: Alignment.center,
            //               //     child: Text("Estimate"),
            //               //   ),
            //               // ),
            //             ]),
            //       ),

            //       /// Show Booking to eazyman inside booking Tab///

            //       Expanded(
            //         child: TabBarView(children: [
            //           Column(
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               SizedBox(
            //                 height: Get.size.height * 0.10.h,
            //                 child: ListView.builder(
            //                     scrollDirection: Axis.horizontal,
            //                     itemCount: chipText.length,
            //                     itemBuilder: (context, i) => Padding(
            //                           padding: const EdgeInsets.all(6.0),
            //                           child:
            //                               customChips(chipText[i].toString()),
            //                         )),
            //               ),
            //               Expanded(
            //                 child: controller.loadingBookings
            //                     ? const Center(
            //                         child: CircularProgressIndicator(),
            //                       )
            //                     : ListView.builder(
            //                         itemCount: 10,
            //                         itemBuilder: (context, index) =>
            //                             BookingCard(),
            //                       ),
            //               ),
            //             ],
            //           ),

            //           /// New ///
            //           Column(
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               SizedBox(
            //                 height: MediaQuery.of(context).size.height * 0.10,
            //                 child: ListView.builder(
            //                   scrollDirection: Axis.horizontal,
            //                   itemCount: chipText.length,
            //                   itemBuilder: (context, i) => Padding(
            //                     padding: const EdgeInsets.all(6.0),
            //                     child: customChips(chipText[i].toString()),
            //                   ),
            //                 ),
            //               ),
            //               Expanded(
            //                 child: Padding(
            //                   padding: const EdgeInsets.all(15.0),
            //                   child: ListView.builder(
            //                     // shrinkWrap: true,
            //                     // physics: const NeverScrollableScrollPhysics(),
            //                     itemCount: 10,
            //                     itemBuilder: (context, i) => Card(
            //                         elevation: 1,
            //                         child: Column(
            //                           children: [
            //                             InkWell(
            //                               onTap: () async {
            //                                 // orderDetail("orderList"[i]);
            //                               },
            //                               child: Column(
            //                                 children: [
            //                                   Padding(
            //                                     padding:
            //                                         const EdgeInsets.all(8.0),
            //                                     child: Row(children: [
            //                                       Text(
            //                                           "Order # ${"orderList"[i].substring(0, 6)}"),
            //                                       const Spacer(),
            //                                       const Text(
            //                                           " Date 12/06/22 ")
            //                                     ]),
            //                                   ),
            //                                   ListTile(
            //                                     leading: Container(
            //                                       decoration: BoxDecoration(
            //                                         borderRadius:
            //                                             BorderRadius.circular(
            //                                                 5),
            //                                         color: Colors.white,
            //                                         border: Border.all(
            //                                           color: Colors.black54,
            //                                           width: 1,
            //                                         ),
            //                                       ),
            //                                       height: 60,
            //                                       width: 60,
            //                                       child: Image.asset(
            //                                           "assets/eazymen.jpg"),
            //                                     ),
            //                                     title: ("orderList"[i]
            //                                                 .substring(
            //                                                     0, 4) !=
            //                                             null)
            //                                         ? Text("orderList"[i]
            //                                             .substring(0, 4))
            //                                         : Container(),
            //                                     subtitle: const Text("Price"),
            //                                   ),
            //                                   Divider(),
            //                                   Padding(
            //                                     padding:
            //                                         const EdgeInsets.all(8.0),
            //                                     child: Row(
            //                                       children: const [
            //                                         Icon(Icons.done),
            //                                         SizedBox(
            //                                           width: 10,
            //                                         ),
            //                                         Text("Booking Status"),
            //                                       ],
            //                                     ),
            //                                   )
            //                                 ],
            //                               ),
            //                             ),
            //                           ],
            //                         )),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ]),
            //       ),
            //     ],
            //   ),
            // ));
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.size.height * 0.10.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    itemCount: chipText.length,
                    separatorBuilder: (context, index) =>
                        Space.horizontal(12.w),
                    itemBuilder: (context, i) => customChips(
                      chipText[i].toString(),
                    ),
                  ),
               ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () => controller.getBookings(),
                    child: controller.loadingBookings
                        // ? const Center(
                        //     child: EazyLoadingWidget(),
                        //   )
                        ? const ShimmerLoader()
                        : controller.bookings.isEmpty
                            ? const Center(
                                child: Text('No Bookings Available'),
                              )
                            : ListView.builder(
                                padding: Space.scaffoldPadding,
                                itemCount: controller.bookings.length,
                                itemBuilder: (context, index) =>
                                    BookingCard(controller.bookings[index]),
                              ),
                  ),
                )
              ],
            ),
          );
        });
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
        const Divider(),
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

class BookingCard extends StatelessWidget {
  const BookingCard(
    this.booking, {
    super.key,
  });
  final BookingDetailModel booking;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ManageOrderController>();
    return Stack(
      children: [
        EasyContainer(
          margin: 4,
          padding: 4,
          borderRadius: 10.r,
          width: double.infinity,
          // height: 130.h,
          color: EazyColors.white,
          onTap: () => controller.toDetails(booking),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListTile(
                contentPadding:  EdgeInsets.symmetric(
                  horizontal: 16.0.w,
                  vertical: 14.h,
                ),
                leading: EasyContainer(
                  showBorder: true,
                  borderWidth: .5,
                  color: EazyColors.white,
                  // height: 120,
                  width: 75.w,
                  child: const EazyNetworkImage(
                      url:
                          'https://firebasestorage.googleapis.com/v0/b/eazyman-2e7a7.appspot.com/o/User_images%2FEazyMan.png?alt=media&token=a376abde-5072-4d49-b25d-a7b059f4fb29'),
                ),
                title: Text(
                  booking.customer_name ?? '',
                  // 'Homanshu Chauhcan',
                  // "Inverter Servicing",
                  style: Get.textTheme.titleLarge,
                  softWrap: true,
                  maxLines: 2,
                  // overflow: TextOverflow.fade,
                ),
                subtitle: booking.booking_date == null
                    ? null
                    : Text(
                        DateFormat('dd-MM-yyyy').format(
                          DateTime.parse(booking.booking_date ?? ''),
                        ),
                        // booking.booking_date.toString().split(' ')[0],
                        style: Get.textTheme.titleMedium
                            ?.copyWith(color: EazyColors.lightBlack),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                // trailing: Text('${booking.payment_items_total}'),
              ),
              // const Spacer(),
              Space.vertical(8.h),
              const Divider(
                thickness: 1,
                endIndent: 10,
                indent: 10,
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  controller.convertBookingStatus(booking.booking_status ??0 ),
                 //  Text(
                 //    controller.convertBookingStatus(
                 //      booking.booking_status ?? 0,
                 //    ),
                 // ),
                  Text(
                    'View Details',
                    style: Get.textTheme.titleMedium
                        ?.copyWith(color: EazyColors.primary),
                  ),
                ],
              )
            ],
          ),
          // child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.end,
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Flexible(
          //             flex: 1,
          //             child: Padding(
          //               padding: const EdgeInsets.only(left: 8),
          //               child: EasyContainer(
          //                 showBorder: true,
          //                 color: EazyColors.white,
          //                 height: 75.h,
          //                 width: 150.w,
          //                 child: Image.network(
          //                     'https://firebasestorage.googleapis.com/v0/b/eazyman-2e7a7.appspot.com/o/User_images%2FEazyMan.png?alt=media&token=a376abde-5072-4d49-b25d-a7b059f4fb29'),
          //               ),
          //             ),
          //           ),
          //           Space.horizontal(8.w),
          // Flexible(
          //   flex: 3,
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               mainAxisAlignment: MainAxisAlignment.start,
          //               children: [
          //                 Row(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Text(
          //                       "Inverter Servicing",
          //                       style: Get.textTheme.titleLarge,
          //                       softWrap: true,
          //                       overflow: TextOverflow.fade,
          //                     ),
          //                   ],
          //                 ),
          //                 Padding(
          //                   padding: const EdgeInsets.only(top: 4.0),
          //                   child: Text(
          //                     'Tue 9 Nov at 09:00 AM',
          //                     style: Get.textTheme.titleSmall,
          //                     softWrap: true,
          //                     overflow: TextOverflow.fade,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //           const Text('999'),
          //         ],
          //       ),
          //     ),

          // ],
          //            ),
          //          ),
        ),
        if (booking.booking_status == 0)
           Align(
            alignment: Alignment.topRight,
            child: EasyContainer(
              margin: 4,
              width: 65.w,
              customBorderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(0),
                  topRight: Radius.circular(5),
                  topLeft: Radius.circular(0)),
              color: Colors.greenAccent,
              child: const Text('NEW'),
            ),
          ),
      ],
    );
  }
}
