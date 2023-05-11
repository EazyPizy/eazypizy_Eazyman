import 'package:carousel_slider/carousel_slider.dart';

import 'package:eazypizy_eazyman/theme/app_colors.dart';
import 'package:eazypizy_eazyman/widgets/EasyButtons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../theme/eazy_spaces.dart';
import '../../widgets/CarouselImage.dart';
import '../../widgets/easy_container.dart';
import '../View_earned_Commision.dart';
import '../eazymanRegistration/Compnents/SelectServices_Tile.dart';
import '../eazymanRegistration/Compnents/personal_Details_1.dart';
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
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "Amit Bairwa",
          style: Get.textTheme.titleLarge,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();

              },
              icon: Icon(Icons.handyman))
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: Space.scaffoldPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Space.vertical(16),
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
                    padding: EdgeInsets.fromLTRB(13, 30, 20, 20),
                    child: Text(
                      "Share your profile link to customers",
                      style: TextStyle(
                          color: Color(0xFF142B6F),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(13, 0, 13, 0),
                      child: Row(
                        children: [
                          const Flexible(
                            child: EasyContainer(
                              color: EazyColors.background,
                              borderRadius: 10,
                              height: 50,
                              width: double.infinity,
                              child: Center(
                                  child:
                                      Text("https//eazyPizy.netramPlumber.in")),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.qr_code_2),
                          ),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          EazyButtons.flexWidthElevatedButton2('Visit', () {}, EazyColors.white),
                          // ElevatedButton(
                          //   onPressed: () {},
                          //   child: const Text("Visit"),
                          // ),
                          const SizedBox(width: 10),
                          EazyButtons.flexWidthElevatedButton('Share', () {} ,20),
                        ]),
                  ),
                ],
              ),
            ),
            Space.vertical(16),
            Text(
              'Your Earning',
              style: Get.textTheme.titleLarge,
            ),
            Space.vertical(16),
            statics(),
            Space.vertical(16),
            CompleteYourProfile(),
            SetupPayment(),
            EasyContainer(
              color: Colors.white,
              borderRadius: 10,
              // showBorder: true,
              //  borderColor: Colors.blueAccent.withOpacity(.5),
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("Your Status"),
                      ],
                    ),
                  ),
                  Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                            width: 100,
                            height: 80,
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const <Widget>[
                                  Text(
                                    " 0 ",
                                  ),
                                  Text(
                                    'Orders',
                                  )
                                ],
                              ),
                            )),
                        SizedBox(
                            width: 100,
                            height: 80,
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const <Widget>[
                                  Text(
                                    " 0 ",
                                  ),
                                  Text('Services')
                                ],
                              ),
                            )),
                        SizedBox(
                            width: 100,
                            height: 80,
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const <Widget>[
                                  Text(
                                    " 0 ",
                                  ),
                                  Text('Visitors')
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Space.vertical(16),
            const Carousel(
              autoplay: true,
              width: double.infinity,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigator.of(context).pushNamed(CreateEstimate.routeName);
        },
        label: const Text(
          " Create Estimate",
        ),
      ),
    ));
  }

  Widget statics() {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
                child: EasyContainer(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const EarnedCommission(),
                ));
              },
              height: 100,
              borderRadius: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EasyContainer(
                    customBorderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                    height: 25,
                    color: Colors.red,
                    child: Text("Commission"),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("100", style: Get.textTheme.titleLarge),
                    ),
                  )
                ],
              ),
            )),
            Space.horizontal(8),
            Flexible(
                child: EasyContainer(
              height: 100,
              borderRadius: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EasyContainer(
                    customBorderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                    height: 25,
                    color: Colors.orange,
                    child: Text("Service"),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("100", style: Get.textTheme.titleLarge),
                    ),
                  )
                ],
              ),
            )),
          ],
        ),
        Space.vertical(8),
        Row(
          children: [
            Flexible(
                child: EasyContainer(
              height: 100,
              borderRadius: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EasyContainer(
                    customBorderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                    height: 25,
                    color: Colors.green,
                    child: Text(" Total Orders"),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("100", style: Get.textTheme.titleLarge),
                    ),
                  )
                ],
              ),
            )),
            const SizedBox(
              width: 8,
            ),
            Flexible(
                child: EasyContainer(
              height: 100,
              borderRadius: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EasyContainer(
                    customBorderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                    height: 25,
                    color: Colors.blueAccent,
                    child: Text(" Total Services"),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("100", style: Get.textTheme.titleLarge),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ],
    );
  }
}

Widget myCarousel(List<Widget> imageList) {
  return CarouselSlider(
      items: imageList,

      //Slider Container properties
      options: CarouselOptions(
        height: 180.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ));
}

