import 'package:eazypizy_eazyman/Modules/orderDetail/components/product_tile.dart';
import 'package:eazypizy_eazyman/Modules/orderDetail/ctrl.booking.detail.dart';
import 'package:eazypizy_eazyman/widgets/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../theme/eazy_spaces.dart';
import '../../widgets/EasyButtons.dart';

class DetailOrderView extends StatelessWidget {
  const DetailOrderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                      Space.vertical(8),
                      EasyContainer(
                          // height: 150.h,
                          borderRadius: 10,
                          padding: 12,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Customer Details',
                                style: Get.textTheme.titleLarge,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // const Text('Amit Bairwa'),
                                  // const Spacer(),
                                  // IconButton(
                                  //     onPressed: () {},
                                  //     icon: const Icon(
                                  //       Icons.whatshot,
                                  //       color: Colors.green,
                                  //     )),
                                  Text('${booking.customer_phone}'),
                                  IconButton(
                                    onPressed: () async {
                                      final url = Uri.parse(
                                          'tel:${booking.customer_phone}');
                                      if (await canLaunchUrl(url)) {
                                        launchUrl(url);
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.phone,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                ],
                              ),
                              // Text(
                              //   'Email : Adibairwa01@gmail.com',
                              //   style: Get.textTheme.titleSmall,
                              // ),
                              // Space.vertical(8),
                              // const Text('Address'),
                              Space.vertical(4),
                              Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // const Text('Locality/Area'),
                                      const Text('Address'),
                                      Text(
                                        booking.customer_address ?? '',
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
                                        booking.customer_landmark ?? '',
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
                                        'Gurgaon',
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
                                        booking.customer_pincode ?? '',
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
                                    'Haryana',
                                    style: Get.textTheme.titleSmall,
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Space.vertical(12),
                      EasyContainer(
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
                                  imageUrl: booking
                                      .products![index].serviceProdImage!,
                                  name: booking
                                      .products![index].serviceProductName!,
                                  quantity: 1,
                                  price: 1,
                                ),
                                separatorBuilder: (context, index) =>
                                    const Divider(),
                                itemCount: booking.products?.length ?? 0,
                              )
                            ],
                          )),
                      Space.vertical(12),
                      EasyContainer(
                        // height: 150.h,
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

enum ButtonStatus { accepted, started, reached, complete }
