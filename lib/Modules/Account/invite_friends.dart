import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/eazy_spaces.dart';
import '../../widgets/easy_container.dart';

class InviteFriends extends StatelessWidget {
  const InviteFriends({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyContainer(
      padding: 10,
      width: double.infinity,
      child: ListTile(
        leading: SizedBox(
            height: 70, width: 70, child: Image.asset('assets/EazymenLogo.png')),
        title: Text('Invite your friends to become Eazyman', style: Get.textTheme.titleSmall,),
        trailing: Icon(Icons.chevron_right),
      ),
    );
  }
}
