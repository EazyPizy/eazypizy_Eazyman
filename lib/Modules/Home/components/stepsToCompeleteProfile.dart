import 'package:eazypizy_eazyman/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../theme/eazy_spaces.dart';
import '../../../widgets/easy_container.dart';

class CompleteYourProfile extends StatelessWidget {
  const CompleteYourProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      EasyContainer(
          borderRadius: 20,
          alignment: Alignment.bottomCenter,
          height: 400,
          color: EazyColors.primary,
          child: Column(
            children: [
              Text(
                'Step :2 Create Catalog',
                style: TextStyle(color: Colors.white),
              ),
              Space.vertical(70),
              EasyContainer(
                  height: 150,
                  width: 300,
                  color: EazyColors.white,
                  borderRadius: 10,
                  child: Text(''))
            ],
          )),

      // Positioned(
      //   top: 100,
      //   left: 20,
      //   child: EasyContainer(
      //     width:300,
      //
      //     elevation: 1,
      //     borderRadius: 10,
      //     height: 200,
      //     color: EazyColors.background,
      //     child: Text(''),
      //   ),
      // ),
    ]);
  }
}
