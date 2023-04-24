import 'package:eazypizy_eazyman/theme/app_colors.dart';
import 'package:eazypizy_eazyman/widgets/EasySnackBar.dart';
import 'package:eazypizy_eazyman/widgets/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/eazy_spaces.dart';
import '../../widgets/EasyButtons.dart';

class DetailOrder extends StatelessWidget {
  const DetailOrder({Key? key}) : super(key: key);

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
                            icon: Icon(
                              Icons.whatshot,
                              color: Colors.green,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
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
                            Text('Locality/Area'),
                            Text(
                              'AshokVihar',
                              style: Get.textTheme.titleSmall,
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Landmark'),
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
                            Text('City'),
                            Text(
                              'Gurgaon',
                              style: Get.textTheme.titleSmall,
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Pincode'),
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
                        Text('State'),
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
                        Text('Item Details'),
                        Spacer(),
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
                    Text('Bill Details'),
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
            child: EazyButtons.fullWidthElevatedButton('Accept Order', () {
              EazySnackBar.buildSuccessSnackbar('Success', "message");
            })

            // ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //         minimumSize: const Size.fromHeight(50),
            //         backgroundColor: Colors.green,
            //         //background color of button
            //         // side: BorderSide(width:3, color:Colors.white), //border width and color
            //         elevation: 3,
            //         //elevation of button
            //         shape: RoundedRectangleBorder(
            //           //to set border radius to button
            //             borderRadius: BorderRadius.circular(10)),
            //         padding: const EdgeInsets.only(
            //             left: 40, right: 40) //content padding inside button
            //     ),
            //     onPressed: () {},
            //     child: const Text('Accept Order',
            //         style: TextStyle(color: Colors.white)))
            ),
      ),
    );
  }
}
