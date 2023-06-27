import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/capture_Image.dart';
import '../../theme/app_colors.dart';
import '../../theme/eazy_spaces.dart';
import '../../widgets/EasyButtons.dart';
import '../../widgets/easy_container.dart';
import '../../widgets/startpu_logo.dart';
import '../../widgets/widget_to_image.dart';
import '../BusinessCard/componets/Edit_BusinessCard.dart';
import '../BusinessCard/view_BusinessCard.dart';
import '../Eazyman_catalouge/ctrl_Eazyman_profile.dart';
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
        child: GetBuilder<ProfileController>(
            init: ProfileController(),
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
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
                                    builder: (context) =>
                                        const EditBusinessCard(),
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
                                enlargeCenterPage: false,

                                viewportFraction: .90,
                                aspectRatio: 2.0,
                                initialPage: 1,
                              ),
                            ),
                            Space.vertical(10.h),
                            // Row(
                            //   crossAxisAlignment: CrossAxisAlignment.center,
                            //   mainAxisAlignment:
                            //       MainAxisAlignment.spaceBetween,
                            //   children: <Widget>[
                            //     Flexible(
                            //       child: Container(
                            //         alignment: Alignment.center,
                            //         height: 20.h,
                            //         width: 20.w,
                            //         child: CircleAvatar(
                            //           backgroundColor: Colors.blue,
                            //           child: Center(
                            //             child: IconButton(
                            //               onPressed: () =>
                            //                   _controller.previousPage(),
                            //               color: Colors.white,
                            //               icon: const Icon(
                            //                 Icons.arrow_back_ios,
                            //                 size: 15,
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //
                            //     Flexible(
                            //       child: IconButton(
                            //         onPressed: () => _controller.nextPage(),
                            //         color: Colors.white,
                            //         icon: const Icon(Icons.arrow_forward_ios),
                            //       ),
                            //     ),
                            //     // ...Iterable<int>.generate(colors.length).map(
                            //     //       (int  itemIndex) => Flexible(
                            //     //     child: ElevatedButton(
                            //     //       onPressed: () => _controller.animateToPage(itemIndex),
                            //     //       child: Text("$itemIndex"),
                            //     //     ),
                            //     //   ),
                            //     // ),
                            //   ],
                            // ),
                          ]),
                          Space.vertical(10.h),
                          EazyButtons.fullWidthShareButton(
                            'Share Card',
                            () async {
                              final bytes1 = await Utils.capture(key1);

                              //print(bytes1);
                              setState(() {
                                this.bytes1 = bytes1;
                              });
                              buildPopUp(bytes1);
                            },
                          ),
                          Space.vertical(10.h),
                          EasyContainer(
                            borderRadius: 10.r,
                            padding: 10,
                            color: EazyColors.white,
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text('Share your Card'),
                                    StarterTopLogo()
                                  ],
                                ),
                                Space.vertical(10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    EazyButtons.flexWidthElevatedButton2(
                                        'View Profile',
                                        () {},
                                        EazyColors.primary,
                                        30),
                                    Space.horizontal(10.w),
                                    EazyButtons.flexWidthElevatedButton(
                                        'Share Profile', () {}, 30),
                                  ],
                                ),
                                Space.vertical(10),
                              ],
                            ),
                          ),
                          Space.vertical(10),
                        ],
                      )),

                  /// My Customer Widget
                  // Row(
                  //   children: [
                  //     Flexible(
                  //         child: EasyContainer(
                  //       onTap: () {
                  //         Navigator.of(context).push(MaterialPageRoute(
                  //           builder: (context) => const ManageCustomers(),
                  //         ));
                  //       },
                  //       height: 100,
                  //       borderRadius: 10,
                  //       child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           const Padding(
                  //             padding: EdgeInsets.all(10.0),
                  //             child: EasyContainer(
                  //                 customBorderRadius: BorderRadius.only(
                  //                     topRight: Radius.circular(5),
                  //                     bottomRight: Radius.circular(5),
                  //                     bottomLeft: Radius.circular(5),
                  //                     topLeft: Radius.circular(5)),
                  //                 height: 30,
                  //                 width: 30,
                  //                 color: Colors.red,
                  //                 child: Icon(Icons.account_box)),
                  //           ),
                  //           Align(
                  //             alignment: Alignment.topCenter,
                  //             child: Text("My Customers",
                  //                 style: Get.textTheme.titleMedium),
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
                  //           const Padding(
                  //             padding: EdgeInsets.all(10.0),
                  //             child: EasyContainer(
                  //                 customBorderRadius: BorderRadius.only(
                  //                     topRight: Radius.circular(5),
                  //                     bottomRight: Radius.circular(5),
                  //                     bottomLeft: Radius.circular(5),
                  //                     topLeft: Radius.circular(5)),
                  //                 height: 30,
                  //                 width: 30,
                  //                 color: Colors.red,
                  //                 child: Icon(Icons.account_box)),
                  //           ),
                  //           Align(
                  //             alignment: Alignment.topCenter,
                  //             child: Text("My Customers",
                  //                 style: Get.textTheme.titleMedium),
                  //           )
                  //         ],
                  //       ),
                  //     )),
                  //   ],
                  // ),
                  /// My Customer Widget
                  Space.vertical(10.h),
                  customListTile(
                    title: 'Rate us on play store',
                    icon: FontAwesomeIcons.rankingStar,
                    onTap: () {},
                  ),
                  customListTile(
                    title: 'Invite customers',
                    icon: FontAwesomeIcons.shareNodes,
                    onTap: () {},
                  ),
                  customListTile(
                    title: 'Logout',
                    icon: FontAwesomeIcons.shareFromSquare,
                    onTap: () {
                      controller.logout();
                    },
                  ),

                  Space.vertical(10.h),
                  const InviteFriends(),
                  Space.vertical(10.h),
                  EasyContainer(
                    alignment: Alignment.centerLeft,
                    padding: 10,
                    color: EazyColors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          EazyButtons.primaryTextButton('About Us', () async {
                            final aboutUs = Uri.parse(
                              'https://firebasestorage.googleapis.com/v0/b/hiredhandver2.appspot.com/o/AboutEazyPizy.html?alt=media&token=97cae357-dd5f-4d9e-8bac-41ed84f63fbc',
                            );
                            if (await launchUrl(aboutUs)) {
                              //dialer opened
                            } else {
                              //dailer is not opened
                            }
                          }),
                          EazyButtons.primaryTextButton(
                            'Privacy Policy',
                            () {},
                          )
                        ],
                      ),
                    ),
                  ),
                  Space.vertical(20.h),

                  Center(
                    child: Text(
                      'Follow us on ',
                      style: Get.textTheme.titleSmall,
                    ),
                  ),
                  socialLinks(),
                  Space.vertical(60.h),

                  // Padding(
                  //   padding: const EdgeInsets.only(left: 10.0, right: 10),
                  //   child: RichText(
                  //     text: const TextSpan(
                  //       text: 'Lets ',
                  //       style: TextStyle(
                  //           color: Colors.grey,
                  //           fontSize: 30,
                  //           fontWeight: FontWeight.bold),
                  //       children: <TextSpan>[
                  //         TextSpan(
                  //             text: 'Grow',
                  //             style: TextStyle(
                  //                 color: Colors.orange,
                  //                 fontSize: 30,
                  //                 fontWeight: FontWeight.bold)),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // const Padding(
                  //   padding: EdgeInsets.only(left: 10.0, right: 10),
                  //   child: Text(
                  //     'Together....',
                  //     style: TextStyle(
                  //         color: Colors.grey,
                  //         fontSize: 40,
                  //         fontWeight: FontWeight.bold),
                  //   ),
                  // ),

                  Space.vertical(10.h),
                ],
              );
            }),
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          onPressed: () async {
            final phoneno = Uri.parse('tel:+91-9023499063');
            if (await launchUrl(phoneno)) {
              //dialer opened
            } else {
              //dailer is not opened
            }
          },
          // backgroundColor: Colors.blueAccent,
          elevation: 0,
          backgroundColor: EazyColors.primary,
          // Set the background color
          foregroundColor: EazyColors.white,
          // Set the foreground (icon) color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50), // Set the border radius
          ),
          heroTag: "fab1",
          child: const Icon(Icons.call),
        ),
        Space.horizontal(10.w),
        FloatingActionButton(
          onPressed: () async {
            await launchUrl(
              Uri.parse('https://wa.me/${91}${9023499063}?text=Hi'),
              mode: LaunchMode.externalApplication,
            );
            // final phoneno = Uri.parse('https://wa.me/${91}${9023499063}?text=Hi');
            // if (await launchUrl(phoneno)) {
            //   //dialer opened
            // } else {
            //   //dailer is not opened
            // }
          },
          heroTag: 'fab2',
          // backgroundColor: Colors.blueAccent,
          elevation: 0,
          backgroundColor: Colors.green,
          // Set the background color
          foregroundColor: EazyColors.white,
          // Set the foreground (icon) color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50), // Set the border radius
          ),
          child: const Icon(
            FontAwesomeIcons.whatsapp,
            size: 35,
          ),
        ),
      ]),
    );
  }

  Widget customListTile({
    required IconData icon,
    required VoidCallback onTap,
    required String title,
  }) {
    return ListTile(
      minVerticalPadding: 2,
      minLeadingWidth: 0,
      // contentPadding: const EdgeInsets.only(left: 20, right: 20),
      tileColor: EazyColors.white,
      onTap: onTap,
      leading: Icon(
        icon,
        color: EazyColors.primary,
      ),
      title: Text(title),
      trailing: const Icon(
        Icons.chevron_right,
        color: EazyColors.primary,
        size: 20,
      ),
    );
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

  // Widget customListTile({
  //   required IconData icon,
  //   required VoidCallback onTap,
  //   required String title,
  // }) {
  //   return ListTile(
  //     minVerticalPadding: 2,
  //     minLeadingWidth: 0,
  //     contentPadding: const EdgeInsets.only(left: 20, right: 20),
  //     tileColor: EazyColors.white,
  //     onTap: onTap,
  //     leading: const Icon(Icons.access_alarm_outlined),
  //     title: Text(title),
  //     trailing: Icon(
  //       icon,
  //     ),
  //   );
  // }

  Widget socialLinks() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () async {
            final twitter = Uri.parse(
              'https://twitter.com/eazy_pizy',
            );
            if (await launchUrl(twitter)) {
              //dialer opened
            } else {
              //dailer is not opened
            }
          },
          icon: const Icon(FontAwesomeIcons.twitter),
        ),
        IconButton(
          onPressed: () async {
            final facebook = Uri.parse(
              'https://www.facebook.com/eazypizy.in/',
            );
            if (await launchUrl(facebook)) {
              //dialer opened
            } else {
              //dailer is not opened
            }
          },
          icon: const Icon(FontAwesomeIcons.facebook),
        ),
        IconButton(
          onPressed: () async {
            final instagram = Uri.parse(
              'https://www.instagram.com/eazy.pizy/?hl=en',
            );
            if (await launchUrl(instagram)) {
              //dialer opened
            } else {
              //dailer is not opened
            }
          },
          icon: const Icon(
            FontAwesomeIcons.instagram,
          ),
        ),
        IconButton(
          onPressed: () async {
            final youTube = Uri.parse(
              'https://www.youtube.com/@EazyPizy_In',
            );
            if (await launchUrl(youTube)) {
              //dialer opened
            } else {
              //dailer is not opened
            }
          },
          icon: const Icon(
            FontAwesomeIcons.youtube,
          ),
        ),
      ],
    );
  }
}
