import 'package:carousel_slider/carousel_slider.dart';

import 'package:eazypizy_eazyman/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/HomeScreen'
      '';

  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   EazymanProvider eazymanProvider =
  //       Provider.of<EazymanProvider>(context, listen: false);
  //   eazymanProvider.getCurrentUserData();
  // }

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
        title: const Text(
          "Amit Bairwa",
          style: TextStyle(
            color: Color(0xff142b6f),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  color: Colors.blue.withOpacity(0.10)),
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
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: EazyColors.background,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5))),
                              height: 50,
                              width: double.infinity,
                              child: const Center(
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
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("Visit"),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              "Share",
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                  color: EazyColors.background,
                ),
              ),
            ),
            statics(),
            Card(
              margin: const EdgeInsets.fromLTRB(13, 0, 13, 0),
              child: SizedBox(
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Your Status"),
                    ),
                    Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                              width: 100,
                              height: 80,
                              child: Card(
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
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
                                  ))),
                          SizedBox(
                              width: 100,
                              height: 80,
                              child: Card(
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
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
                                  ))),
                          SizedBox(
                              width: 100,
                              height: 80,
                              child: Card(
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
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
                                  ))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            myCarousel(imageList)
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Flexible(
                  child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.red.withOpacity(0.8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Center(child: Text(" Total Orders")),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("100", style: Get.textTheme.titleMedium),
                      ),
                    )
                  ],
                ),
              )),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                  child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.green.withOpacity(0.8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Center(child: Text(" Total Services")),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("100", style: Get.textTheme.titleMedium),
                      ),
                    )
                  ],
                ),
              )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Flexible(
                  child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.blue.withOpacity(0.8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          const Center(child: Text("Commission \n      Earn")),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("100", style: Get.textTheme.titleMedium),
                      ),
                    )
                  ],
                ),
              )),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                  child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.orange.withOpacity(0.8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: Text("Service \n  Earn")),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("100", style: Get.textTheme.titleMedium),
                      ),
                    )
                  ],
                ),
              )),
            ],
          ),
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
