import 'package:eazypizy_eazyman/Models/eazymen_product.dart';
import 'package:eazypizy_eazyman/Modules/Eazyman_catalouge/ctrl_Eazyman_profile.dart';
import 'package:eazypizy_eazyman/theme/eazy_spaces.dart';
import 'package:eazypizy_eazyman/widgets/EasyButtons.dart';
import 'package:eazypizy_eazyman/widgets/EasySnackBar.dart';
import 'package:eazypizy_eazyman/widgets/eazy_networkimage.dart';
import 'package:eazypizy_eazyman/widgets/pop_ups.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';
import '../../../widgets/EazyTextField.dart';
import '../../../widgets/easy_container.dart';

enum SampleItem {
  edit,
  delete,
}

class EazymanServiceCard extends StatelessWidget {
  const EazymanServiceCard({super.key, required this.product});

  final EazymenProductModel product;

  // final String serviceProdName;
  // final int price;

  // final String serviceProdID;
  final bool isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return EasyContainer(
      color: EazyColors.white,
      padding: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: EasyContainer(
                  borderColor: EazyColors.borderColors,
                  color: EazyColors.white,
                  borderRadius: 10,
                  height: 70.h,
                  width: 140.w,
                  child: EazyNetworkImage(
                    url: product.productDetails?.serviceProdImage ??
                        'https://firebasestorage.googleapis.com/v0/b/eazyman-2e7a7.appspot.com/o/User_images%2FEazyMan.png?alt=media&token=a376abde-5072-4d49-b25d-a7b059f4fb29',
                   // fit: BoxFit.fill,
                  ),
                  // 'https://firebasestorage.googleapis.com/v0/b/eazyman-2e7a7.appspot.com/o/User_images%2FEazyMan.png?alt=media&token=a376abde-5072-4d49-b25d-a7b059f4fb29'),
                ),
              ),
              Space.horizontal(
                14.w,
              ),
              Flexible(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  product.productDetails!.serviceProductName!,
                                  style: Get.textTheme.titleMedium,
                                  // softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              // const Spacer(),
                              // const SwitchExample()
                            ],
                          ),
                          Space.vertical(4.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '₹${product.price}',
                                style: Get.textTheme.titleSmall,
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                              Space.horizontal(6.w),
                              if (product.price !=
                                  product.productDetails?.serviceRetailPrice
                                      ?.toInt())
                                Text(
                                  '₹${product.productDetails?.serviceRetailPrice}',
                                  style: Get.textTheme.titleSmall!.copyWith(
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                ),
                            ],
                          ),
                          // Row(
                          //   children: [
                          //     FittedBox(
                          //       child: TextButton.icon(
                          //         onPressed: () {},
                          //         icon: const Icon(
                          //           Icons.remove_red_eye_outlined,
                          //           size: 13,
                          //         ),
                          //         label: Text(
                          //           'Preview',
                          //           style: Get.textTheme.titleSmall,
                          //         ),
                          //       ),
                          //     ),
                          //     TextButton.icon(
                          //       onPressed: () {
                          //         Share.share('AC Service at 499 Only');
                          //       },
                          //       icon: const Icon(
                          //         Icons.share_sharp,
                          //         size: 13,
                          //       ),
                          //       label: Text(
                          //         'Share Service',
                          //         style: Get.textTheme.titleSmall,
                          //       ),
                          //     ),
                          //     const Spacer(),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                    PopupMenuExample(
                      prodId: product.productId,
                    )
                  ],
                ),
              ),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     FittedBox(
              //       child: TextButton.icon(
              //         onPressed: () {},
              //         icon: const Icon(
              //           Icons.remove_red_eye_outlined,
              //           size: 13,
              //         ),
              //         label: Text(
              //           'Preview',
              //           style: Get.textTheme.titleSmall,
              //         ),
              //       ),
              //     ),
              //     TextButton.icon(
              //       onPressed: () {
              //         Share.share('AC Service at 499 Only');
              //       },
              //       icon: const Icon(
              //         Icons.share_sharp,
              //         size: 13,
              //       ),
              //       label: Text(
              //         'Share Service',
              //         style: Get.textTheme.titleSmall,
              //       ),
              //     ),
              //     const Spacer(),
              //   ],
              // ),
            ],
          ),
          // const Divider(),
          // EazyButtons.primaryTextButton("View Details", () {
          //   Get.bottomSheet(
          //       Column(
          //         children: [
          //           EazyTextField.fullWidthTextField('New Price'),
          //         ],
          //       ),
          //       elevation: 20.0,
          //       enableDrag: false,
          //       backgroundColor: EazyColors.white,
          //       shape: const RoundedRectangleBorder(
          //           borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(10.0),
          //         topRight: Radius.circular(10.0),
          //         // barrierColor: Colors.red[50],
          //         // isDismissible: false,
          //       )));
          // })
        ],
      ),
    );
  }
}

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool light0 = true;
  bool light1 = true;
  bool light2 = true;

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      // Thumb icon when the switch is selected.
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 30,
          height: 25,
          child: FittedBox(
            child: Switch(
              value: light0,
              onChanged: (bool value) {
                setState(() {
                  light0 = value;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}

class PopupMenuExample extends StatefulWidget {
  const PopupMenuExample({super.key, required this.prodId});

  final String prodId;

  @override
  State<PopupMenuExample> createState() => _PopupMenuExampleState();
}

class _PopupMenuExampleState extends State<PopupMenuExample> {
  SampleItem? selectedMenu;
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SampleItem? selectedMenu;
    return PopupMenuButton<SampleItem>(
      // color: EazyColors.white,
      initialValue: selectedMenu, padding: EdgeInsets.zero,
      // Callback that sets the selected popup menu item.
      onSelected: (SampleItem item) {},
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
        PopupMenuItem<SampleItem>(
          value: SampleItem.edit,
          child: const Text('Edit'),
          onTap: () {
            Future(
              () => Get.defaultDialog(
                backgroundColor: EazyColors.white,
                radius: 10,
                title: 'Update Price',
                // confirm: EazyButtons.flexWidthElevatedButton('Save', () {}, 10),
                // cancel:  EazyButtons.flexWidthElevatedButton2(
                //     'Visit', () {}, EazyColors.primary),
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      EazyTextField.stringTextField(
                        'New Price',
                        hintText: 'Enter Price',
                        controller: priceController,
                        textInputType: TextInputType.number,
                      ),
                      Space.vertical(18),
                      EazyButtons.fullWidthElevatedButton('Submit', () {
                        final price = priceController.text.trim();
                        if (price.isEmpty) {
                          EazySnackBar.buildErronSnackbar(
                            'Missing Price!',
                            'Please enter a price to update',
                          );
                          return;
                        }
                        Get.find<ProfileController>().updateProductPrice(
                          widget.prodId,
                          int.parse(price),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        PopupMenuItem<SampleItem>(
          value: SampleItem.delete,
          child: const Text('Delete'),
          onTap: () {
            print('object');
            Future(
              () => warningPopUp(
                'Are you sure want to delete this product from your catalogue?',
                title: 'Delete Product?',
                onCancel: Get.back,
                onConfirm: () {
                  Get.back();
                  Get.find<ProfileController>().deleteProduct(widget.prodId);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
