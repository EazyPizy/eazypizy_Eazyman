import 'package:carousel_slider/carousel_slider.dart';
import 'package:eazypizy_eazyman/Modules/Home/ctrl.home.dart';
import 'package:eazypizy_eazyman/theme/app_colors.dart';
import 'package:eazypizy_eazyman/widgets/EasyButtons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/eazy_spaces.dart';
import '../../widgets/CarouselImage.dart';
import '../../widgets/easy_container.dart';
import 'components/setup_Payment_Shortcut.dart';
import 'components/stepsToCompeleteProfile.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/HomeScreen'
      '';

  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> imageList = [
    Image.network('https://via.placeholder.com/600x400'),
    Image.network('https://via.placeholder.com/600x400'),
    Image.network('https://via.placeholder.com/600x400'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<HomeController>(
            init: HomeController(),
            builder: (controller) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text(
                    "Amit Bairwa",
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        icon: const Icon(Icons.handyman))
                  ],
                  automaticallyImplyLeading: false,
                ),
                body: SingleChildScrollView(

                  padding: Space.scaffoldPadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Space.vertical(16.h),
                      EasyContainer(
                        width: double.infinity,
                        color: Colors.blue.withOpacity(0.10),
                        // margin: const EdgeInsets.all(10),

                        borderRadius: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(13, 20, 20, 20),
                              child: Text(
                                "Share your profile link to customers",
                                style: TextStyle(
                                    color: EazyColors.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(13, 0, 13, 0),
                                child: Row(
                                  children: [
                                     Flexible(
                                      child: EasyContainer(
                                        color: EazyColors.background,
                                        borderRadius: 5,
                                        height: 45.h,
                                        width: double.infinity,
                                        child: const Text(
                                            "https//eazyPizy.netramPlumber.in"),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.qr_code_2, size: 30,),
                                    ),
                                  ],
                                )),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    EazyButtons.flexWidthElevatedButton2(
                                        'Visit', () {}, EazyColors.primary),
                                    // ElevatedButton(
                                    //   onPressed: () {},
                                    //   child: const Text("Visit"),
                                    // ),
                                    const SizedBox(width: 10),
                                    EazyButtons.flexWidthElevatedButton(
                                        'Share', () {}, 40),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                      Space.vertical(16.h),
                      Text(
                        'Your Earning',
                        style: Get.textTheme.titleLarge,
                      ),
                      Space.vertical(16.h),
                      statics(),
                      Space.vertical(16.h),
                      const CompleteYourProfile(),
                     // Space.vertical(16.h),

                      //const SetupPayment(),
                      Space.vertical(16.h),

                      EasyContainer(
                       // color: Colors.white,
                        borderRadius: 10.r,
                        showBorder: true,
                         borderColor: EazyColors.gray100,
                        height: 150.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children:  [
                                  Text("Your Status",style: Get.textTheme.titleMedium),
                                ],
                              ),
                            ),
                            Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children:  <Widget>[
                                      Text(
                                        " 0 ",style: Get.textTheme.titleMedium
                                      ),
                                      Text(
                                        'Orders',style: Get.textTheme.titleMedium
                                      )
                                    ],
                                  ),
                                  const VerticalDivider(
                                    width: 1,
                                    // height: 40.h,
                                    color: EazyColors.primary,
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children:  <Widget>[
                                      Text(
                                        " 0 ",style: Get.textTheme.titleMedium,
                                      ),
                                      Text('Services', style: Get.textTheme.titleMedium,)
                                    ],
                                  ),
                                  const VerticalDivider(
                                    width: 1,
                                    // height: 40.h,
                                    color: EazyColors.primary,
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                       Text(
                                        " 0 ",style: Get.textTheme.titleMedium
                                      ),
                                      Text('Visitors',
                                          style: Get.textTheme.titleMedium)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Space.vertical(16.h),
                      const Carousel(
                        autoplay: true,
                        width: double.infinity,
                      )
                    ],
                  ),
                ),
              );
            }));
  }

  Widget statics() {
    return GetBuilder<HomeController>(builder: (controller) {
      return Column(
        children: [
          // Row(
          //   children: [
          //     Flexible(
          //         child: EasyContainer(
          //       onTap: () {
          //         Navigator.of(context).push(MaterialPageRoute(
          //           builder: (context) => const EarnedCommission(),
          //         ));
          //       },
          //       height: 100,
          //       borderRadius: 10,
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           const EasyContainer(
          //             customBorderRadius: BorderRadius.only(
          //                 topRight: Radius.circular(10),
          //                 topLeft: Radius.circular(10)),
          //             height: 25,
          //             color: Colors.red,
          //             child: Text("Commission"),
          //           ),
          //           Align(
          //             alignment: Alignment.center,
          //             child: Padding(
          //               padding: const EdgeInsets.all(15.0),
          //               child: Text("100", style: Get.textTheme.titleLarge),
          //             ),
          //           )
          //         ],
          //       ),
          //     )),
          //     Space.horizontal(8),
          //     Flexible(
          //         child: EasyContainer(
          //       height: 100,
          //       borderRadius: 10,
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           const EasyContainer(
          //             customBorderRadius: BorderRadius.only(
          //                 topRight: Radius.circular(10),
          //                 topLeft: Radius.circular(10)),
          //             height: 25,
          //             color: Colors.orange,
          //             child: Text("Service"),
          //           ),
          //           Align(
          //             alignment: Alignment.center,
          //             child: Padding(
          //               padding: const EdgeInsets.all(15.0),
          //               child: Text("100", style: Get.textTheme.titleLarge),
          //             ),
          //           )
          //         ],
          //       ),
          //     )),
          //   ],
          // ),
          // Space.vertical(8),
          Row(
            children: [
              Flexible(
                  child: EasyContainer(
                color: EazyColors.white,
                elevation: 1,
                height: 100.h,
                borderRadius: 10.r,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EasyContainer(
                      customBorderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      height: 25.h,
                      color: Colors.green,
                      child: Center(
                        child: Text("Bookings Completed",
                            style: Get.textTheme.titleMedium),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(controller.bookingCount.toString(),
                            style: Get.textTheme.titleMedium),
                      ),
                    )
                  ],
                ),
              )),
              Space.horizontal(8.w),
              Flexible(
                  child: EasyContainer(
                color: EazyColors.white,
                elevation: 1,
                height: 100.h,
                borderRadius: 10.r,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EasyContainer(
                      customBorderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      height: 25.h,
                      color: Colors.blueAccent,
                      child: Text(
                        "Total Services",
                        style: Get.textTheme.titleMedium,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(controller.amountMade.toString(),
                            style: Get.textTheme.titleMedium),
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ],
      );
    });
  }
}

Widget myCarousel(List<Widget> imageList) {
  return CarouselSlider(
      items: imageList,

      //Slider Container properties
      options: CarouselOptions(
        height: 180.0.h,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ));
}
