import 'package:eazypizy_eazyman/Modules/Eazyman_catalouge/components/services_list.dart';
import 'package:eazypizy_eazyman/Modules/Eazyman_catalouge/simmerLoader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Models/EazymanModel.dart';
import '../../theme/app_colors.dart';
import '../../widgets/easy_container.dart';
import '../addServiceProdToEazyman/Add_SubService_To_UserCatalouge.dart';
import 'components/CustomerRivewTile.dart';
import 'components/Easyman_ServiceCard.dart';
import 'ctrl_Eazyman_profile.dart';

class EazyManCatalogScreen extends StatelessWidget {
  EazyManCatalogScreen({
    super.key,
  });

  int initPosition = 0;

  bool isChecked = false;

  var top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   backgroundColor: Colors.white,
        //   elevation: 0.5,
        //   title: const Text(
        //     "Plumber",
        //     style: TextStyle(color: Colors.black),
        //   ),
        // ),
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
                      surfaceTintColor: EazyColors.white,
                      // backgroundColor: EazyColors.background,

                      pinned: true,
                      // title: Text("Plumber",
                      // style: TextStyle(
                      //   color: Colors.black
                      // ),
                      // ),
                      expandedHeight: 210.h,
                      flexibleSpace: LayoutBuilder(
                        builder: (ctx, cons) {
                          top = cons.biggest.height;

                          return FlexibleSpaceBar(
                            centerTitle: true,
                            title: AnimatedOpacity(
                              duration: const Duration(milliseconds: 100),
                              opacity: top <= 130 ? 1.0 : 0.0,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 55.w,
                                  ),
                                  const CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      'https://firebasestorage.googleapis.com/v0/b/eazyman-2e7a7.appspot.com/o/User_images%2FEazyMan.png?alt=media&token=a376abde-5072-4d49-b25d-a7b059f4fb29',
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12.w,
                                  ),
                                  InkWell(
                                    onTap: controller.getUserSubServices,
                                    child: Text(
                                      controller.eazyMen.personalDetail
                                              ?.firstName ??
                                          '',
                                      style: Get.textTheme.headlineMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            background: Column(
                              children: [
                                SizedBox(
                                  height: 75.h,
                                ),
                                VisitingCard(
                                  eazyMenModel: controller.eazyMen,
                                ),
                              ],
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
                          labelColor: EazyColors.dummy,
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: EazyColors.dummy,
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
                              (category) => ServicesListWidget(category),
                            )
                            .toList(),
                      ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.edit),
          onPressed: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //   builder: (context) => AddSubServiceToUserCatalogue(),
            // ));
          },
        ),
      ),
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

// void _viewAsCustomerSheet(context, eazyMan) {
//   showModalBottomSheet(
//       context: context,
//       isScrollControlled: true, // set this to true
//       builder: (_) {
//         return const DraggableScrollablePanel();
//       });
// }

class VisitingCard extends StatelessWidget {
  const VisitingCard({super.key, required EazyMenModel eazyMenModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            EasyContainer(
              width: double.infinity,
              child: Row(
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
                                children: const [
                                  Text("11"),
                                  Text("Experiance")
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: 100,
                        width: 80,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          child: Image.asset(
                            'assets/five.jpg',
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Delhi  | NCR",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Roboto",
                  fontSize: 12.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget inSightCard() {
  return SizedBox(
    height: 60,
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
      height: 100,
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
                  width: 100,
                  height: 30,
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
                const SizedBox(
                  width: 80,
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
                const SizedBox(
                  width: 50,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [
                  const Text('Excellent(149)'),
                  const SizedBox(
                    width: 50,
                  ),
                  Container(
                    height: 5,
                    width: 150,
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
                  const SizedBox(
                    width: 74,
                  ),
                  Container(
                    height: 5,
                    width: 100,
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
                  const SizedBox(
                    width: 60,
                  ),
                  Container(
                    height: 5,
                    width: 100,
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

// Widget pageContent(mainServiceID, mainServiceName, BuildContext context) {
//   final mySubServiceCategory =
//       Provider.of<SubServiceCategoryProvider>(context, listen: false);
//
//   return Consumer<EazymanProvider>(builder: (context, userProvider, child) {
//     return FutureBuilder(
//         future: userProvider.getMyServiceProduct(
//           mainServiceID,
//         ),
//         builder: (context, snapshot) {
//           List<ServiceProductModel> myServiceProducts =
//               userProvider.myServiceProduct;
//           //
//           // SubServiceCategoryProvider
//           //     subServiceCategoryProvider =
//           //     Provider.of(context, listen: true);
//           // subServiceCategoryProvider.getSubServiceProduct(
//           //     result[index].serviceCategoryID);
//           List<ServiceProductModel> masterSubService =
//               mySubServiceCategory.subServiceProductItems;
//
//           List<ServiceProductModel> result2 = [];
//
//           for (var aElement in myServiceProducts) {
//             ServiceProductModel value = masterSubService.firstWhere(
//                 (bElement) => bElement.serviceProdID == aElement.serviceProdID,
//                 orElse: () => null);
//             if (value != null) {
//               result2.add(value);
//             }
//           }
//           return result2.isNotEmpty
//               ? ListView.builder(
//                   shrinkWrap: true,
//                   // physics: NeverScrollableScrollPhysics(),
//                   itemCount: result2.length + 1,
//                   itemBuilder: (ctx, i) => i != myServiceProducts.length
//                       ? MyServiceProdWidget(
//                           serviceProdName: result2[i].serviceProdName,
//                           serviceProdID: result2[i].serviceProdID,
//                           mainServiceID: mainServiceID,
//                         )
//                       : InkWell(
//                           onTap: () {
//                             Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) =>
//                                   AddSubServiceToUserCatalogue(
//                                 mainServiceID,
//                                 mainServiceName,
//                               ),
//                             ));
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 8.0, right: 8),
//                             child: Container(
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                 border: Border.all(
//                                   color: Colors.blue,
//                                 ),
//                                 color: Colors.blue.withOpacity(0.05),
//                               ),
//                               child: const ListTile(title: Text(" ADD MORE")),
//                             ),
//                           ),
//                         ))
//               : Center(
//                   child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => AddSubServiceToUserCatalogue(
//                         mainServiceID,
//                         mainServiceName,
//                       ),
//                     ));
//                   },
//                   child: const Text("ADD Service"),
//                 ));
//         });
//   });
// }

//  combineModelData (String serviceId,String myPrice,ServiceProductModel service){
//   return MyServiceProductModel(
// serviceProdID: serviceId,mySetPrice: myPrice,serviceProductModel: service,
//   );

/// Custom View, These lines of code is used for Custom Tab View, And this piece of code is shifted to separate class. ///
