import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Models/EazymanModel.dart';
import '../../theme/app_colors.dart';
import '../../widgets/easy_container.dart';


class VisitingCard extends StatelessWidget {
  const VisitingCard({
    Key? key,
    required EazyMenModel eazyMenModel,
    required this.colors,
  }) : super(key: key);
  final Color colors;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      EasyContainer(
        //padding: 10,
        //margin: 10,
        borderRadius: 10.r,
        color: colors,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
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
                        const Padding(
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
                              children: const [Text("149"), Text("Services")],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [Text("11"), Text("Experience")],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: 80.h,
                        width: 80.w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5.r)),
                          child: Image.asset(
                            'assets/Blue Logo PNG.png',
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
             Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Delhi  | NCR",
                style: Get.textTheme.titleMedium
              ),
            ),
            Divider(
              color: EazyColors.white,
              height: 2.h,
            ),
            Container(
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.only(
                //     bottomLeft: Radius.circular(10),
                //     bottomRight: Radius.circular(10)),
                color: EazyColors.primary,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), //color of shadow
                    spreadRadius: 5, //spread radius
                    blurRadius: 7, // blur radius
                    offset: Offset(0, 2), // changes position of shadow
                    //first paramerter of offset is left-right
                    //second parameter is top to down
                  ),
                  //you can set more BoxShadow() here
                ],
              ),
              height: 15.h,
              child: Stack(
                children: <Widget>[
                  //Stack helps to overlap widgets
                  Positioned(
                    //positioned helps to position widget wherever we want.
                      top: -20,
                      left: -60, //position of the widget
                      child: Container(
                          height: 250.h,
                          width: 250.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colors //back+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ground color with opacity
                          ))),

                  Positioned(
                      left: -150,
                      top: -10,
                      child: Container(
                          height: 180,
                          width: 180,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.orange.withOpacity(0.05)))),

                  // Positioned(
                  //   //main content container postition.
                  //   child: Container(
                  //       height: 250,
                  //       alignment: Alignment.center,
                  //       child: Text(
                  //         "Stacked Containers Together",
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontSize: 20,
                  //         ),
                  //         textAlign: TextAlign.center,
                  //       )),
                  // )
                ],
              ),
            ),
          ],
        ),

      ),

    ]);
  }
}
