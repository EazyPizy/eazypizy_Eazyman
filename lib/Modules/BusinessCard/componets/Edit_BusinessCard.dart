import 'package:eazypizy_eazyman/widgets/EasyButtons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/EazyTextField.dart';


class EditBusinessCard extends StatelessWidget {
  const EditBusinessCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Business Card',
          style: Get.textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(100)),
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
              ),
              height: MediaQuery.of(context).size.width - 220,
              width: MediaQuery.of(context).size.width - 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage('assets/EazymenLogo.png'),
                    fit: BoxFit.fill),
              ),
            ),

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
            EazyTextField.stringTextField('Please Enter Name',
                hintText: 'Enter Name', controller: nameController),
            const Spacer(),

            EazyButtons.fullWidthElevatedButton('Update', () {})
          ],
        ),
      ),
    );
  }
}
