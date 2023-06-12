import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../theme/app_colors.dart';
import '../../theme/eazy_spaces.dart';
import '../../widgets/EasyButtons.dart';
import '../../widgets/easy_container.dart';
import '../../widgets/startpu_logo.dart';
import '../../widgets/widget_to_image.dart';
import '../BusinessCard/componets/Edit_BusinessCard.dart';
import '../BusinessCard/view_BusinessCard.dart';
import '../Eazyman_catalouge/ctrl_Eazyman_profile.dart';
import '../ManageCustomers/view_ManageCustomers.dart';
import 'invite_friends.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  late GlobalKey key1;
  Uint8List? bytes1;

  final CarouselController _controller = CarouselController();

  List<Color> colors = [
    Colors.red.withOpacity(0.50),
    Colors.greenAccent.withOpacity(0.25),
    Colors.blue.withOpacity(0.50),
    Colors.orange,
    Colors.white
  ];
  final List<Alignment> _imageAlign = [
    Alignment.center,
    Alignment.topLeft,
    Alignment.bottomRight,
    Alignment.topCenter,
    Alignment.bottomLeft,
  ];
  final List<Alignment> _titleAlign = [
    Alignment.center,
    Alignment.topLeft,
    Alignment.bottomRight,
    Alignment.topCenter,
    Alignment.bottomLeft,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Account',
          ),
        ),
        body: SingleChildScrollView(
          padding: Space.scaffoldPadding,
          child: GetBuilder<ProfileController>(
              init: ProfileController(),
              builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Business Card',
                          style: Get.textTheme.titleMedium,
                        ),
                        const Spacer(),
                        EazyButtons.primaryTextButton(
                          'Edit Card',
                          () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const EditBusinessCard(),
                            ));
                          },
                        )
                      ],
                    ),
                    Stack(children: [
                      CarouselSlider.builder(
                        carouselController: _controller,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            WidgetToImage(
                          builder: (key) {
                            key1 = key;
                            return VisitingCard(
                              eazyMenModel: controller.eazyMen,
                              colors: colors[itemIndex],
                              imageAlign: _imageAlign[itemIndex],
                              titleAlign: _titleAlign[itemIndex],
                            );
                          },
                        ),
                        options: CarouselOptions(
                          autoPlay: false,
                          // disableCenter: true,
                          enlargeCenterPage: true,

                          viewportFraction: 1,
                          aspectRatio: 2.0,
                          initialPage: 1,
                        ),
                      ),
                      Space.vertical(10.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                            child: SizedBox(
                              height: 25.h,
                              width: 25.r,
                              child: CircleAvatar(
                                backgroundColor: Colors.blue,
                                child: Center(
                                  child: IconButton(
                                    onPressed: () => _controller.previousPage(),
                                    color: Colors.white,
                                    icon: const Icon(
                                      Icons.arrow_back_ios,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Flexible(
                            child: IconButton(
                              onPressed: () => _controller.nextPage(),
                              color: Colors.white,
                              icon: const Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                          // ...Iterable<int>.generate(colors.length).map(
                          //       (int  itemIndex) => Flexible(
                          //     child: ElevatedButton(
                          //       onPressed: () => _controller.animateToPage(itemIndex),
                          //       child: Text("$itemIndex"),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ]),
                    Space.vertical(10.h),
                    Row(
                      children: [
                        Flexible(
                          flex: 4,
                          child: EazyButtons.fullWidthShareButton(
                            'Share Card',
                            () async {
                              final dynam = await FirebaseDynamicLinksPlatform
                                  .instance
                                  .buildLink(
                                DynamicLinkParameters(
                                    link: Uri.parse(
                                        'https://eazypizy.page.link?eazymenId=${controller.eazyMen.eazyManUid}'
                                        // 'https://eazypizy.page.link',
                                        ),
                                    uriPrefix: 'https://eazypizy.page.link',
                                    navigationInfoParameters:
                                        const NavigationInfoParameters()),
                              );
                              print(dynam);
                              Share.share(dynam.toString());
                              // final bytes1 = await Utils.capture(key1);

                              // print(bytes1);
                              // setState(() {
                              //   this.bytes1 = bytes1;
                              // });
                              // buildPopUp(bytes1);
                            },
                          ),
                        ),
                        Space.horizontal(10.w),
                        Flexible(
                          flex: 1,
                          child: EasyContainer(
                              showBorder: true,
                              borderColor: Colors.grey,
                              height: 50.h,
                              width: 50.h,
                              child: const Icon(Icons.image)),
                        )
                      ],
                    ),
                    Space.vertical(10),
                    EasyContainer(
                      borderRadius: 10.r,
                      padding: 10,
                      color: EazyColors.white,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Share your Card'),
                              StarterTopLogo()
                            ],
                          ),
                          Space.vertical(10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              EazyButtons.flexWidthElevatedButton2(
                                  'View Profile', () {}, EazyColors.primary),
                              EazyButtons.flexWidthElevatedButton(
                                  'Share Profile', () {}, 40),
                            ],
                          ),
                          Space.vertical(10),
                        ],
                      ),
                    ),
                    Space.vertical(10),
                    Row(
                      children: [
                        Flexible(
                            child: EasyContainer(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ManageCustomers(),
                            ));
                          },
                          height: 100,
                          borderRadius: 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: EasyContainer(
                                    customBorderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        bottomRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                        topLeft: Radius.circular(5)),
                                    height: 30,
                                    width: 30,
                                    color: Colors.red,
                                    child: Icon(Icons.account_box)),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Text("My Customers",
                                    style: Get.textTheme.titleMedium),
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
                              const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: EasyContainer(
                                    customBorderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        bottomRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                        topLeft: Radius.circular(5)),
                                    height: 30,
                                    width: 30,
                                    color: Colors.red,
                                    child: Icon(Icons.account_box)),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Text("My Customers",
                                    style: Get.textTheme.titleMedium),
                              )
                            ],
                          ),
                        )),
                      ],
                    ),
                    Space.vertical(10),
                    Row(
                      children: [
                        Flexible(
                            child: EasyContainer(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ManageCustomers(),
                            ));
                          },
                          height: 100,
                          borderRadius: 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: EasyContainer(
                                    customBorderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        bottomRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                        topLeft: Radius.circular(5)),
                                    height: 30,
                                    width: 30,
                                    color: Colors.red,
                                    child: Icon(Icons.account_box)),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Text("My Customers",
                                    style: Get.textTheme.titleMedium),
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
                              const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: EasyContainer(
                                    customBorderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        bottomRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                        topLeft: Radius.circular(5)),
                                    height: 30,
                                    width: 30,
                                    color: Colors.red,
                                    child: Icon(Icons.account_box)),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Text("My Customers",
                                    style: Get.textTheme.titleMedium),
                              )
                            ],
                          ),
                        )),
                      ],
                    ),
                    Space.vertical(150),
                    const InviteFriends(),
                    RichText(
                      text: const TextSpan(
                        text: 'Lets ',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Grow',
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    const Text(
                      'Together....',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                );
              }),
        ));
  }

  Widget buildImage(Uint8List? bytes) =>
      bytes != null ? Image.memory(bytes) : Container();

  // void _shareImage() async {
  //   await Share.shareXFiles([
  //
  //     XFile.fromData(
  //       buffer.asUint8List(),
  //       name: 'flutter_logo.png',
  //       mimeType: 'image/png',
  //     ),
  //   ],
  //       // : {'image.jpg': bytes1?.buffer.asUint8List()},
  //       // text: 'Check out this image!');
  // }

  // void _onShareXFileFromAssets(BuildContext context) async {
  //   final box = context.findRenderObject() as RenderBox?;
  //   final scaffoldMessenger = ScaffoldMessenger.of(context);
  //   final data = await rootBundle.load('assets/flutter_logo.png');
  //   final buffer = data.buffer;
  //   final shareResult = await Share.shareXFiles(
  //     [
  //       XFile.fromData(
  //         buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
  //         name: 'flutter_logo.png',
  //         mimeType: 'image/png',
  //       ),
  //     ],
  //     sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
  //   );
  //
  //  // scaffoldMessenger.showSnackBar(getResultSnackBar(shareResult));
  // }

  // void _shareImage() async {
  //   await Share.shareFiles(['image.jpg'],
  //       bytesOfFile: {'image.jpg': imageBytes.buffer.asUint8List()},
  //       text: 'Check out this image!');
  // }

  Future buildPopUp(Uint8List? bytes1) {
    return Get.bottomSheet(
      backgroundColor: Colors.white,
      EasyContainer(
        borderRadius: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            bytes1 != null ? Image.memory(bytes1) : Container(),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(10),
              child: EazyButtons.flexWidthElevatedButton("Share", () {
                Share.shareXFiles(
                  [
                    XFile.fromData(
                      bytes1!,
                      name: 'flutter_logo.png',
                      mimeType: 'image/png',
                    ),
                  ],
                  text: 'Check out this image!',
                );
              }, 40),
            )
          ],
        ),
      ),
    );
  }
}
