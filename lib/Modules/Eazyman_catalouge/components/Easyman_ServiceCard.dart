import 'package:eazypizy_eazyman/widgets/EasyButtons.dart';
import 'package:eazypizy_eazyman/widgets/EasySnackBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:share_plus/share_plus.dart';

import '../../../theme/app_colors.dart';

import '../../../widgets/EazyTextField.dart';
import '../../../widgets/easy_container.dart';
import 'Edit_ServiceProd.dart';

enum SampleItem {
  edit,
  delete,
}

class EazymanServiceCard extends StatelessWidget {
  const EazymanServiceCard({
    super.key,
    required this.serviceProdName,
    required this.price,
  });

  // final ProductModel product;

  final String serviceProdName;
  final int price;

  // final String serviceProdID;
  final bool isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return EasyContainer(
      borderRadius: 10,
      width: double.infinity,
      //height: 110,
      elevation: 0.5,
      padding: 4,
      color: EazyColors.white,
      showBorder: false,
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: EasyContainer(
                    borderColor: EazyColors.borderColors,
                    showBorder: true,
                    color: EazyColors.white,
                    height: 90.h,
                    width: 150.w,
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
                          serviceProdName,
                          style: Get.textTheme.titleMedium,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        const Spacer(),
                        const SwitchExample()
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
                        const Spacer(),
                        const PopupMenuExample()
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
          EazyButtons.primaryTextButton("View Details", () {
            Get.bottomSheet(
                Column(
                  children: [
                    EazyTextField.fullWidthTextField('New Price'),
                  ],
                ),
                elevation: 20.0,
                enableDrag: false,
                backgroundColor: EazyColors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  // barrierColor: Colors.red[50],
                  // isDismissible: false,
                )));
          })
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
  const PopupMenuExample({super.key});

  @override
  State<PopupMenuExample> createState() => _PopupMenuExampleState();
}

class _PopupMenuExampleState extends State<PopupMenuExample> {
  SampleItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SampleItem>(
      initialValue: selectedMenu,
      // Callback that sets the selected popup menu item.
      onSelected: (SampleItem item) {
        setState(() {
          selectedMenu = item;
          EazySnackBar.buildSnackbar('Added Successfully',
              'your product is added successfully to your cart');
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
        PopupMenuItem<SampleItem>(
          value: SampleItem.edit,
          child: Text('Edit'),
          onTap: () {
            Get.bottomSheet(
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      EazyTextField.fullWidthTextField('New Price'),
                    ],
                  ),
                ),
                elevation: 20.0,
                enableDrag: false,
                backgroundColor: Colors.green,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  // barrierColor: Colors.red[50],
                  // isDismissible: false,
                )));
          },
        ),
        const PopupMenuItem<SampleItem>(
          value: SampleItem.delete,
          child: Text('Delete'),
        ),
      ],
    );
  }
}
