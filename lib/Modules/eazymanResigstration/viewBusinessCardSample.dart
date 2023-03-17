import 'package:eazypizy_eazyman/Modules/eazymanResigstration/Compnents/SelectServices_Tile.dart';
import 'package:eazypizy_eazyman/Modules/eazymanResigstration/view_BasicDetails.dart';
import 'package:eazypizy_eazyman/widgets/easy_container.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessCardSample extends StatefulWidget {
  static const routeName = '/BusinessCardSample';

  const BusinessCardSample({super.key});

  @override
  _BusinessCardSampleState createState() => _BusinessCardSampleState();
}

bool isVisible = true;

class _BusinessCardSampleState extends State<BusinessCardSample> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lets Build your Business Card',
                  style: Get.textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 50,
                ),
                const EasyContainer(
                    color: Colors.blueAccent,
                    width: double.infinity,
                    borderRadius: 25,
                    height: 200,
                    child: Text('Business card')),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BasicDetails()));
                      },
                      child: const Text("Continue"),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
