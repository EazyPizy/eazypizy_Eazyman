import 'package:carousel_slider/carousel_slider.dart';
import 'package:eazypizy_eazyman/Modules/BusinessCard/componets/cardColors.dart';
import 'package:eazypizy_eazyman/widgets/EasyButtons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/eazy_spaces.dart';
import '../../../widgets/EazyTextField.dart';
import '../../../widgets/widget_to_image.dart';
import '../view_BusinessCard.dart';

class EditBusinessCard extends StatelessWidget {
  const EditBusinessCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Business Card',
          style: Get.textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        padding: Space.scaffoldPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CarouselSlider.builder(
            //   //carouselController: _controller,
            //   itemCount: 5,
            //   itemBuilder: (BuildContext context, int itemIndex,
            //       int pageViewIndex) => VisitingCard(
            //             eazyMenModel: controller.eazyMen,
            //             colors: CardColors['primary'],
            //       ),
            //   options: CarouselOptions(
            //     autoPlay: false,
            //     // disableCenter: true,
            //     enlargeCenterPage: true,
            //
            //     viewportFraction: 1,
            //     aspectRatio: 2.0,
            //     initialPage: 1,
            //   ),
            // ),
            EazyTextField.fullWidthTextField('Enter Name'),

            EazyButtons.fullWidthElevatedButton('Update', () {})
          ],
        ),
      ),
    );
  }
}
