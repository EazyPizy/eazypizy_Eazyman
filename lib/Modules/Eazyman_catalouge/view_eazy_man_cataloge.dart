import 'dart:io';
import 'dart:typed_data';
import 'package:eazypizy_eazyman/Modules/Eazyman_catalouge/components/services_list.dart';
import 'package:eazypizy_eazyman/Modules/Eazyman_catalouge/simmerLoader.dart';
import 'package:eazypizy_eazyman/widgets/EasyButtons.dart';
import 'package:eazypizy_eazyman/widgets/eazy_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../theme/app_colors.dart';
import '../../theme/eazy_spaces.dart';
import '../../widgets/easy_container.dart';

import 'components/CustomerRivewTile.dart';
import 'ctrl_Eazyman_profile.dart';

class EazyManCatalogScreen extends StatefulWidget {
  const EazyManCatalogScreen({
    super.key,
  });

  @override
  State<EazyManCatalogScreen> createState() => _EazyManCatalogScreenState();
}

class _EazyManCatalogScreenState extends State<EazyManCatalogScreen> {
  int initPosition = 0;

  bool isChecked = false;

  var top = 0.0;

  late GlobalKey key1;
  Uint8List? bytes1;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        body: GetBuilder<ProfileController>(
          init: ProfileController(),
          builder: (controller) {
            return DefaultTabController(
              length: controller.userCategories.length,
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      actions: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.sort_sharp),
                        )
                      ],
                      surfaceTintColor: EazyColors.white,
                      title: const Text('Catalog'),
                      pinned: true,
                      expandedHeight: 250.h,
                      flexibleSpace: LayoutBuilder(
                        builder: (ctx, cons) {
                          top = cons.biggest.height.h;
                          return FlexibleSpaceBar(
                            background: EasyContainer(
                              color: EazyColors.white,
                              borderRadius: 0.r,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Space.vertical(
                                    90.h,
                                  ),
                                  Center(
                                    child: SizedBox(
                                      height: 75.h,
                                      width: 75.w,
                                      child: const CircleAvatar(),
                                    ),
                                  ),
                                  Center(
                                    child: SizedBox(
                                      //height: 50,
                                      child: Text(
                                        'Amit Bairwa',
                                        style: Get.textTheme.titleLarge,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: EasyContainer(
                                      elevation: 1,
                                      width: 70.w,
                                      color: Colors.orange,
                                      //height: 10,

                                      child: Text(
                                        'Plumber',
                                        style: Get.textTheme.titleLarge,
                                      ),
                                    ),
                                  ),
                                  Space.vertical(
                                    10.h,
                                  ),
                                  EasyContainer(
                                    width: double.infinity,
                                    height: 60.h,
                                    //color: Colors.white,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: const [
                                            Text('99'),
                                            Text('Experience')
                                          ],
                                        ),
                                        Container(
                                          width: 1.w,
                                          height: 40.h,
                                          color: Colors.blue,
                                        ),
                                        Column(
                                          children: const [
                                            Text('99'),
                                            Text('Experience')
                                          ],
                                        ),
                                        Container(
                                          width: 1,
                                          height: 40.h,
                                          color: Colors.blue,
                                        ),
                                        Column(
                                          children: const [
                                            Text('99'),
                                            Text('Experience')
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                  // WidgetToImage(
                                  //   builder: (key) {
                                  //     this.key1 = key;
                                  //
                                  //     return VisitingCard(
                                  //       eazyMenModel: controller.eazyMen,
                                  //     );
                                  //   },
                                  // ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: EasyContainer(
                        color: EazyColors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('Top Reviews'),
                                  TextButton(
                                    onPressed: viewAllReviews,
                                    child: Text('View All'),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 65.h,
                              //child: buildImage(bytes1)
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, i) => CustomerReviewTile(
                                  index: i,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: _SliverAppBarDelegate(
                        TabBar(
                          labelColor: EazyColors.primary,
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: EazyColors.primary,
                          tabs: controller.userCategories
                              .map(
                                (e) => Tab(
                                  text: e.serviceName,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    )
                  ];
                },
                body: controller.loading
                    ? const Center(child: ShimmerLoader())
                    : TabBarView(
                        // controller: controller.tabController,
                        children: controller.userCategories
                            .map(
                              (category) =>
                                  Expanded(child: ServicesListWidget(category)),
                            )
                            .toList(),
                      ),
              ),
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              EazyButtons.flexWidthElevatedButton2(
                  'View Profile', () {}, EazyColors.white),
              EazyButtons.flexWidthElevatedButton(
                'Share Profile',
                () {},
                40,
              ),
            ],
          ),
        ),
      )
    ]);
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return ColoredBox(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

Widget buildImage(Uint8List? bytes) =>
    bytes != null ? Image.memory(bytes) : Container();

// void _viewAsCustomerSheet(context, eazyMan) {
//   showModalBottomSheet(
//       context: context,
//       isScrollControlled: true, // set this to true
//       builder: (_) {
//         return const DraggableScrollablePanel();
//       });
// }

Widget inSightCard() {
  return SizedBox(
    height: 60.h,
    // width: 50,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 100,
      itemBuilder: (context, i) => Card(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text(" $i Best Service")),
        ),
      ),
    ),
  );
}

Widget ratingBar(String jobsCount) {
  return Card(
    child: SizedBox(
      height: 100.h,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "$jobsCount  Jobs",
            style: const TextStyle(color: Colors.black, fontSize: 10),
          ),
          Text(
            "$jobsCount  Rating",
            style: const TextStyle(color: Colors.black, fontSize: 10),
          ),
        ],
      ),
    ),
  );
}

Future<void> viewAllReviews() {
  late final ratingController;
  late double rating;

  const userRating = 3;
  const ratingBarMode = 1;
  const initialRating = 2;
  const isRTLMode = false;
  const isVertical = false;

  IconData? selectedIcon;
  return Get.bottomSheet(
    EasyContainer(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Customer Reviews',
                  style: Get.textTheme.titleMedium,
                ),
                SizedBox(
                  width: 100.w,
                  height: 30.h,
                  child: FittedBox(
                    child: Image.asset('assets/EazymenLogo.png'),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  '4.9',
                  style: Get.textTheme.headlineLarge,
                ),
                SizedBox(
                  width: 80.w,
                ),
                Column(
                  children: [
                    RatingBar.builder(
                      initialRating: initialRating.toDouble(),
                      minRating: 1,
                      allowHalfRating: true,
                      unratedColor: Colors.amber.withAlpha(50),
                      itemSize: 15,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                      itemBuilder: (context, _) => Icon(
                        selectedIcon ?? Icons.star,
                        color: Colors.green,
                      ),
                      onRatingUpdate: (rating) {
                        // setState(() {
                        //   _rating = rating;
                        // });
                      },
                      updateOnDrag: true,
                    ),
                    Text('349 Ratings', style: Get.textTheme.bodySmall)
                  ],
                ),
                SizedBox(
                  width: 50.w,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [
                  const Text('Excellent(149)'),
                  SizedBox(
                    width: 50.w,
                  ),
                  Container(
                    height: 5.h,
                    width: 150.w,
                    decoration: const BoxDecoration(color: Colors.green),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [
                  const Text('Good(199)'),
                  SizedBox(width: 74.w),
                  Container(
                    height: 5.h,
                    width: 100.w,
                    decoration: const BoxDecoration(color: Colors.green),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [
                  const Text('Average(99)'),
                  SizedBox(
                    width: 60.w,
                  ),
                  Container(
                    height: 5.h,
                    width: 100.w,
                    decoration: const BoxDecoration(color: Colors.red),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

/// Custom View, These lines of code is used for Custom Tab View, And this piece of code is shifted to separate class. ///
