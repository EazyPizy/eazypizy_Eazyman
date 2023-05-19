import 'package:eazypizy_eazyman/Modules/orderDetail/ctrl.booking.detail.dart';
import 'package:eazypizy_eazyman/theme/app_colors.dart';
import 'package:eazypizy_eazyman/widgets/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/eazy_spaces.dart';
import '../../widgets/EasyButtons.dart';

class DetailOrderView extends StatefulWidget {
  const DetailOrderView({Key? key}) : super(key: key);

  @override
  State<DetailOrderView> createState() => _DetailOrderViewState();
}

String? status = "";

class _DetailOrderViewState extends State<DetailOrderView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: BookingDetailController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Order ID #12345'),
            ),
            body: SingleChildScrollView(
              padding: Space.scaffoldPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Space.vertical(8),
                  EasyContainer(
                      // height: 150.h,
                      borderRadius: 10,
                      padding: 8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Customer Details'),
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
                          Space.vertical(8),
                          const Text('Address'),
                          Space.vertical(8),
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Locality/Area'),
                                  Text(
                                    'Ashok Vihar',
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
                                    'Hanuman Mandir',
                                    style: Get.textTheme.titleSmall,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Space.vertical(8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Pincode'),
                                  Text(
                                    '122001',
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
                  Space.vertical(8),
                  EasyContainer(
                      padding: 8,
                      borderRadius: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              const Text('Item Details'),
                              const Spacer(),
                              Text(
                                'Quantity 8',
                                style: Get.textTheme.titleSmall,
                              ),
                              Text(
                                'Item Count 16',
                                style: Get.textTheme.titleSmall,
                              ),
                            ],
                          ),
                          ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            isThreeLine: true,
                            leading: EasyContainer(
                                borderRadius: 20,
                                height: 75,
                                width: 60,
                                child: Image.asset(
                                  'assets/eazymen.jpg',
                                  fit: BoxFit.cover,
                                )),
                            title: Text(
                              'Window AC Service',
                              style: Get.textTheme.titleMedium,
                            ),
                            subtitle: Text(
                              '499Rs x 2',
                              style: Get.textTheme.titleSmall,
                            ),
                            trailing: Text(
                              '998',
                              style: Get.textTheme.titleMedium,
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            isThreeLine: true,
                            leading: EasyContainer(
                                borderRadius: 20,
                                height: 75,
                                width: 60,
                                child: Image.asset(
                                  'assets/eazymen.jpg',
                                  fit: BoxFit.cover,
                                )),
                            title: Text(
                              'Window AC Service',
                              style: Get.textTheme.titleMedium,
                            ),
                            subtitle: Text(
                              '499Rs x 2',
                              style: Get.textTheme.titleSmall,
                            ),
                            trailing: Text(
                              '998',
                              style: Get.textTheme.titleMedium,
                            ),
                          )
                        ],
                      )),
                  Space.vertical(8),
                  EasyContainer(
                      height: 150.h,
                      borderRadius: 10,
                      child: Column(
                        children: [
                          const Text('Bill Details'),
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
                                  const Text('899'),
                                  const Text('50'),
                                  Space.vertical(4),
                                  const Text('149'),
                                  const Divider(),
                                  Text(
                                    '1199',
                                    style: Get.textTheme.titleLarge,
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ))
                ],
              ),
            ),
            bottomNavigationBar: EasyContainer(
              height: 60,
              color: EazyColors.white,
              child: Padding(
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
