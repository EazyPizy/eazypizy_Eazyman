import 'package:eazypizy_eazyman/theme/app_colors.dart';
import 'package:eazypizy_eazyman/widgets/EasySnackBar.dart';
import 'package:eazypizy_eazyman/widgets/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/eazy_spaces.dart';
import '../../widgets/EasyButtons.dart';

class DetailOrder extends StatefulWidget {
  const DetailOrder({Key? key}) : super(key: key);

  @override
  State<DetailOrder> createState() => _DetailOrderState();
}

String? status = "";
class _DetailOrderState extends State<DetailOrder> {
  @override
  Widget build(BuildContext context) {
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
                    Text('Customer Details'),
                    Row(
                      children: [
                        Text('Amit Bairwa'),
                        Spacer(),
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
                    Text('+91-9023499063'),
                    Text(
                      'Email : Adibairwa01@gmail.com',
                      style: Get.textTheme.titleSmall,
                    ),
                    Space.vertical(8),
                    Text('Address'),
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
                        Spacer(),
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    Divider(),
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
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
                            Text('Item Total'),
                            Text('Discount'),
                            Space.vertical(4),
                            Text('Taxes And Fee'),
                            Divider(),
                            Text(
                              'Total Items',
                              style: Get.textTheme.titleLarge,
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('899'),
                            Text('50'),
                            Space.vertical(4),
                            Text('149'),
                            Divider(),
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
            child: EazyButtons.fullWidthElevatedButton('Accept Order',() {
              setState(() {
                status = ButtonStatus.accepted as String?;
              });
              print(status);
              // confirmAcceptOrder(context);
            })),
      ),
    );
  }
}

Future<void> confirmAcceptOrder(BuildContext context) {
  return Get.bottomSheet(
    EasyContainer(
      height: 250,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.cancel,
                    size: 20,
                    color: EazyColors.primary,
                  )),
            ),
            Text(
              'Accept Order',
              style: Get.textTheme.titleLarge,
              textScaleFactor: 1.5,
            ),

            Text(
              'Do You want to accept this new order',
              style: Get.textTheme.titleSmall,
             // textScaleFactor: 1.5,
            ),
            const Spacer(),
            EazyButtons.flexWidthElevatedButton('Yes,Accept Order', () {


EazySnackBar.buildSuccessSnackbar('Success',"message");
            }, 40),
          ],
        ),
      ),
    ),
    backgroundColor: EazyColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    // shape: RoundedRectangleBorder(
    //   borderRadius: BorderRadius.circular(15.r),
    // ),
  );
}



// Widget submitButton() {
//   if (ButtonStatus.accepted) {
//     return CartSubmitButton(
//       onPressed: () {
//         CartService.instance.checkout();
//       },
//       label: 'Login',
//     );
//   }
//   if (!_customerService.customer!.isApplicable()) {
//     return const CartSubmitButton(
//       onPressed: _addDeliveryAddress,
//       label: 'Add Details',
//     );
//   }
//   // if (!_customerService.customer!.isNotApplicable()) {
//   //   return const CartSubmitButton(
//   //     onPressed: _showSavedAddress,
//   //     label: 'Select Address',
//   //   );
//   // }
//   return CartSubmitButton(
//     onPressed: () {
//       Get.to(const SelectServiceSlotView());
//     },
//     label: 'Select Slot',
//   );
// }

enum ButtonStatus { accepted, started, reached, complete }
