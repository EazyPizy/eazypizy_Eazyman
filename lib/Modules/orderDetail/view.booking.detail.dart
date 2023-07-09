import 'package:eazypizy_eazyman/Modules/orderDetail/components/product_tile.dart';
import 'package:eazypizy_eazyman/Modules/orderDetail/ctrl.booking.detail.dart';
import 'package:eazypizy_eazyman/theme/app_colors.dart';
import 'package:eazypizy_eazyman/widgets/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../theme/eazy_spaces.dart';
import '../../widgets/EasyButtons.dart';
import '../ManageOrders/ctrl.manage.orders.dart';

class DetailOrderView extends StatelessWidget {
  const DetailOrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final manageController = Get.find<ManageOrderController>();

    return GetBuilder(
        init: BookingDetailController(),
        builder: (controller) {
          final booking = controller.bookingDetail;
          return WillPopScope(
            onWillPop: () {
              Get.back(result: controller.reloadRequired);
              return Future.value(false);
            },
            child: Scaffold(
              appBar: AppBar(
                title: Text('${booking.customer_name}'),
                leading: IconButton(
                  onPressed: () {
                    Get.back(result: controller.reloadRequired);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              body: RefreshIndicator(
                onRefresh: () => controller.getBookingDetails(),
                child: SingleChildScrollView(
                  padding: Space.scaffoldPadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Space.vertical(8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Status', style: Get.textTheme.titleMedium),
                          manageController.convertBookingStatus(
                              booking.booking_status ?? 0),
                        ],
                      ),
                      Space.vertical(10.h),
                      ListTile(
                        shape: RoundedRectangleBorder( //<-- SEE HERE

                          borderRadius: BorderRadius.circular(10),
                        ),
                        tileColor: EazyColors.white,
                        title: Text(
                          'Job Details',
                          style: Get.textTheme.titleMedium,
                        ),
                        subtitle: Text(
                          DateFormat(
                            'MMM d, h:mm a',
                          ).format(
                            DateTime.parse(
                              booking.booking_date ?? '',
                            ),
                          ),
                          style: Get.textTheme.headlineLarge
                              ?.copyWith(color: EazyColors.primary),
                        ),
                      ),
                      Space.vertical(10.h),
                      EasyContainer(
                          // height: 150.h,
                          borderRadius: 10.r,
                          padding: 12,
                          color: EazyColors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Customer Details',
                                style: Get.textTheme.titleLarge,
                              ),
                              Space.vertical(10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${booking.customer_name}"),
                                  const Spacer(),
                                  // IconButton(
                                  //     onPressed: () {},
                                  //   icon: const Icon(
                                  //     Icons.phone,
                                  //   ),
                                  // ),
                                  // IconButton(
                                  //   onPressed: () async {
                                  //     final url = Uri.parse(
                                  //         'tel:${booking.customer_phone}');
                                  //     if (await canLaunchUrl(url)) {
                                  //       launchUrl(url);
                                  //     }
                                  //   },
                                  //   icon: const Icon(
                                  //     Icons.whatshot,
                                  //   ),
                                  // ),
                                  Text('${booking.customer_phone}'),
                                ],
                              ),
                              // Text(
                              //   'Email : Adibairwa01@gmail.com',
                              //   style: Get.textTheme.titleSmall,
                              // ),
                              // Space.vertical(8),
                              // const Text('Address'),
                              Space.vertical(4.h),
                              Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // const Text('Locality/Area'),
                                      Text(
                                        'Locality/Area',
                                        style: Get.textTheme.titleMedium,
                                      ),
                                      Text(
                                        booking.customer_address?.localArea ??
                                            '',
                                        style: Get.textTheme.titleSmall,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text('Landmark'),
                                      Text(
                                        booking.customer_address?.landMark ??
                                            '',
                                        style: Get.textTheme.titleSmall,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Space.vertical(8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('City'),
                                      Text(
                                        booking.customer_address?.city ?? '',
                                        style: Get.textTheme.titleSmall,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Pincode'),
                                      Text(
                                        booking.customer_address?.pincode ?? '',
                                        style: Get.textTheme.titleSmall,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Space.vertical(8),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('State'),
                                  Text(
                                    booking.customer_address?.state ?? '',
                                    style: Get.textTheme.titleSmall,
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Space.vertical(12),
                      EasyContainer(
                          color: EazyColors.white,
                          padding: 12,
                          borderRadius: 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Products',
                                    style: Get.textTheme.titleLarge,
                                  ),
                                  // const Spacer(),
                                  // Text(
                                  //   'Quantity 8',
                                  //   style: Get.textTheme.titleSmall,
                                  // ),
                                  // Text(
                                  //   'Item Count 16',
                                  //   style: Get.textTheme.titleSmall,
                                  // ),
                                ],
                              ),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    BookingProductTile(
                                  imageUrl:
                                      booking.products[index].serviceProdImage!,
                                  name: booking
                                      .products[index].serviceProductName!,
                                  quantity: 1,
                                  price: 100,
                                ),
                                separatorBuilder: (context, index) =>
                                    const Divider(),
                                itemCount: booking.products.length ?? 0,
                              )
                            ],
                          )),
                      Space.vertical(12),
                      EasyContainer(
                        // height: 150.h,
                        color: EazyColors.white,
                        borderRadius: 10,
                        padding: 12,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bill Details',
                              style: Get.textTheme.titleLarge,
                            ),
                            Space.vertical(6),
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Item Total'),
                                    const Text('Discount'),
                                    Space.vertical(4),
                                    const Text('Taxes And Fee'),
                                    const Divider(),
                                    Text(
                                      'Total Items',
                                      style: Get.textTheme.titleLarge,
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '₹${booking.payment_items_total}',
                                    ),
                                    Text('₹${booking.payment_discount}'),
                                    // Space.vertical(4),
                                    Text('₹${booking.payment_tax}'),
                                    const Divider(),
                                    Text(
                                      '₹${booking.payment_total}',
                                      style: Get.textTheme.titleLarge,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Space.vertical(16),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(8.0),
                child: getActionButton(
                    controller.bookingDetail.booking_status ?? -1),
              ),
            ),
          );
        });
  }

  Widget getActionButton(int status) {
    final bookingDetailController = Get.find<BookingDetailController>();
    switch (status) {
      case 0:
        return EazyButtons.fullWidthElevatedButton(
          'Accept Booking',
          bookingDetailController.acceptBooking,
        );
      case 1:
        return EazyButtons.fullWidthElevatedButton(
          'Start Service',
          bookingDetailController.startService,
        );
      case 2:
        return EazyButtons.fullWidthElevatedButton(
          'Complete Booking',
          bookingDetailController.completeBooking,
        );

      default:
        return const SizedBox.shrink();
    }
  }
}

// enum ButtonStatus { accepted, started, reached, complete }
