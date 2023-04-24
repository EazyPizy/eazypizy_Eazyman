import 'package:eazypizy_eazyman/widgets/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/eazy_spaces.dart';

class EarnedCommission extends StatelessWidget {
  const EarnedCommission({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Earned Commission'),
      ),
      body: SingleChildScrollView(
        padding: Space.scaffoldPadding,
        child: Column(
          children:  [
            EasyContainer(
              borderRadius: 10,
              child: ListTile(

                tileColor: Colors.white,
                title: Text('Earned'),
                subtitle: Text(' Your have earned commission on Order #123456', style: Get.textTheme.titleSmall,),
                trailing: Text('+270', style: TextStyle(
                  color: Colors.green,
                  fontSize: 15,

                ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
