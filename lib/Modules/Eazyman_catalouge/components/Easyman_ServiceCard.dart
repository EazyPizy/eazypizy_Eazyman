import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../theme/app_colors.dart';

import '../../../widgets/easy_container.dart';

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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: EasyContainer(
            elevation: 0.5,
            padding: 8,
            color: EazyColors.white,
            showBorder: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: EasyContainer(
                        borderColor: EazyColors.borderColors,
                        showBorder: true,
                        color: EazyColors.white,
                        height: 75,
                        width: 75,
                        child: Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/eazyman-2e7a7.appspot.com/o/User_images%2FEazyMan.png?alt=media&token=a376abde-5072-4d49-b25d-a7b059f4fb29'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4, left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                serviceProdName,
                                style: Get.textTheme.titleMedium,
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                              // Spacer(),

                              Text(
                                price.toString(),
                                style: Get.textTheme.titleMedium,
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  'AC Service',
                                  style: Get.textTheme.titleSmall,
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                              const SizedBox(
                                width: 18,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  'Electrician',
                                  style: Get.textTheme.titleSmall,
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Row(
                                  children: [
                                    const Icon(
                                      size: 20,
                                      Icons.star,
                                      color: Colors.blueAccent,
                                    ),
                                    Text(
                                      '4.5',
                                      style: Get.textTheme.titleMedium,
                                      softWrap: true,
                                      overflow: TextOverflow.fade,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Row(
                                  children: [
                                    const Icon(
                                      size: 20,
                                      Icons.credit_card,
                                      color: Colors.blueAccent,
                                    ),
                                    Text(
                                      '350 Jobs ',
                                      style: Get.textTheme.titleMedium,
                                      softWrap: true,
                                      overflow: TextOverflow.fade,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Spacer(),
                    //  Padding(
                    //    padding: const EdgeInsets.all(8.0),
                    //    child: OutlinedButton(
                    //
                    //      onPressed: () {},
                    //      child: Text(
                    //        'ADD',
                    //        style: Get.textTheme.labelSmall,
                    //      ),
                    //    ),
                    //  )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey.withOpacity(0.5),
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(3),
                      child: Icon(
                        Icons.circle,
                        size: 10,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        'Jet-Pump AC Service of AC Filter,',
                        style: Get.textTheme.titleSmall,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(3),
                      child: Icon(
                        Icons.circle,
                        size: 10,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: Text(
                        'Jet-Pump AC Service of AC Filter, Indoor and Out door',
                        style: Get.textTheme.titleSmall,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(3),
                      child: Icon(
                        Icons.circle,
                        size: 10,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: Text(
                        'Jet-Pump AC Service of AC Filter, Indoor and Out door',
                        style: Get.textTheme.titleSmall,
                      ),
                    )
                  ],
                ),
                // ElevatedButton(
                //   onPressed: () {},
                //   child: Text(
                //     'Book ME',
                //     style: Get.textTheme.labelSmall,
                //   ),
                // )
              ],
            ),
          ),
        ),
        // Align(
        //   alignment: Alignment.centerRight,
        //   child: Card(
        //       margin: const EdgeInsets.only(right: 25, top: 85),
        //       elevation: 0,
        //       child: ElevatedButton(
        //         onPressed: () {},
        //         child: Text(
        //           'Book ME',
        //           style: Get.textTheme.labelSmall,
        //         ),
        //       )),
        // ),
      ],
    );
  }
}
