import 'package:eazypizy_eazyman/widgets/eazy_networkimage.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Models/EazymanModel.dart';
import '../../theme/app_colors.dart';
import '../../widgets/easy_container.dart';

class VisitingCard extends StatelessWidget {
  const VisitingCard({
    Key? key,
    required this.colors,
    required this.eazyMenModel,
  }) : super(key: key);
  final Color colors;
  final EazyMenModel eazyMenModel;

  @override
  Widget build(BuildContext context) {
    return FlipCard(
        front: EasyContainer(
          //padding: 10,
          margin: 8,
          showBorder: true,
          borderRadius: 15.r,
          borderColor: EazyColors.barBg,
          color: colors,
          child: Stack(children: [
            Positioned(
              left: -60,
              top: -60,
              child: Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.purpleAccent.withOpacity(0.075),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${eazyMenModel.personalDetail?.firstName ?? ""} ${eazyMenModel.personalDetail?.lastName ?? ""}',
                                style: Get.textTheme.titleLarge,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                              ),
                              // Row(
                              //   children: [
                              //     ...eazyMenModel.mainServices!.map((e) => Text(
                              //       '${e.}',
                              //       style: Get.textTheme.titleLarge,
                              //       maxLines: 1,
                              //       overflow: TextOverflow.clip,
                              //     )).toList()

                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ),
                      EasyContainer(
                        margin: 10,
                        height: 90.h,
                        width: 90.w,
                        child: EazyNetworkImage(
                          url: eazyMenModel.personalDetail?.images! ?? '',
                        ),
                      )
                      //: Image.asset('assets/five.jpg'))
                    ]),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(eazyMenModel.phoneNumber ?? "",
                      style: Get.textTheme.titleMedium),
                ),
                EasyContainer(
                  height: 20.h,
                  color: Colors.orange,
                  customBorderRadius: const BorderRadius.only(
                      topRight: Radius.circular(0),
                      bottomRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(0)),
                  child: Text(
                    'Powered By | EazyPizy',
                    style: Get.textTheme.headlineSmall,
                  ),
                ),
                // Container(
                //   decoration: BoxDecoration(
                //     // borderRadius: BorderRadius.only(
                //     //     bottomLeft: Radius.circular(10),
                //     //     bottomRight: Radius.circular(10)),
                //     color: EazyColors.primary,
                //     // boxShadow: [
                //     //   BoxShadow(
                //     //     color: Colors.grey.withOpacity(0.5), //color of shadow
                //     //     spreadRadius: 5, //spread radius
                //     //     blurRadius: 7, // blur radius
                //     //     offset: Offset(0, 2), // changes position of shadow
                //     //     //first paramerter of offset is left-right
                //     //     //second parameter is top to down
                //     //   ),
                //     //   //you can set more BoxShadow() here
                //     // ],
                //   ),
                //   height: 37.h,
                //   child: Stack(
                //     children: <Widget>[
                //       //Stack helps to overlap widgets
                //       Positioned(
                //         //positioned helps to position widget wherever we want.
                //           top: -20,
                //           left: -60, //position of the widget
                //           child: Container(
                //               height: 250.h,
                //               width: 250.w,
                //               decoration: BoxDecoration(
                //                   shape: BoxShape.circle,
                //                   color: colors //back+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ground color with opacity
                //               ))),
                //
                //
                //
                //       // Positioned(
                //       //   //main content container postition.
                //       //   child: Container(
                //       //       height: 250,
                //       //       alignment: Alignment.center,
                //       //       child: Text(
                //       //         "Stacked Containers Together",
                //       //         style: TextStyle(
                //       //           color: Colors.white,
                //       //           fontSize: 20,
                //       //         ),
                //       //         textAlign: TextAlign.center,
                //       //       )),
                //       // )
                //     ],
                //   ),
                // ),
              ],
            ),
            Positioned(
                right: -60,
                bottom: -60,
                child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange.withOpacity(0.075)))),
          ]),
        ),
        back: EasyContainer(
          borderRadius: 15.r,
          color: EazyColors.primary,
          child: Center(
            child: SizedBox(
              height: 150,
              width: 100,
              child: Image.asset('assets/White Logo PNG.png'),
            ),
          ),
        ));
  }
}
