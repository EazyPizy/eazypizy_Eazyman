import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Models/EazymanModel.dart';
import '../../theme/app_colors.dart';
import '../../theme/eazy_spaces.dart';
import '../../widgets/easy_container.dart';

class VisitingCard extends StatelessWidget {
  const VisitingCard({
    Key? key,
    required EazyMenModel eazyMenModel,
    required this.colors,
    required this.imageAlign,
    required this.titleAlign,
  }) : super(key: key);
  final Color colors;
  final Alignment imageAlign;
  final Alignment titleAlign;

  @override
  Widget build(BuildContext context) {
    return FlipCard(
        front: EasyContainer(
          //padding: 10,
          //margin: 10,
          borderRadius: 10.r,
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
                        color: Colors.purpleAccent.withOpacity(0.075)))),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: titleAlign,
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Amit',
                                  textScaleFactor: 1.5,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Roboto",
                                    fontSize: 17.0,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [Text("149"), Text("Jobs")],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text("149"),
                                    Text("Services")
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text("11"),
                                    Text("Experience")
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ]),

                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Delhi  | NCR", style: Get.textTheme.titleMedium),
                ),
                EasyContainer(
                    height: 20,
                    color: Colors.orange,
                    customBorderRadius: BorderRadius.only(
                        topRight: Radius.circular(0),
                        bottomRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        topLeft: Radius.circular(0)),
                    child: Text(
                      'Powered By | EazyPizy',
                      style: Get.textTheme.headlineSmall,
                    )),
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
          color: EazyColors.white,
          child: Center(
            child: SizedBox(
                height: 100,
                width: 100,
                child: Image.asset('assets/Blue Logo PNG.png')),
          ),
        ));
  }
}