import 'package:eazypizy_eazyman/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/eazy_spaces.dart';
import '../../widgets/easy_container.dart';

class InviteFriends extends StatelessWidget {
  const InviteFriends({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyContainer(
      color: EazyColors.white,
      width: double.infinity,
      child: ListTile(
        minVerticalPadding: 2,
        minLeadingWidth: 0,
        contentPadding: const EdgeInsets.only(left: 20, right: 20),        leading: SizedBox(
            height: 70, width: 70, child: Image.asset('assets/EazymenLogo.png')),
        title: Text('Invite your friends to become Eazyman', style: Get.textTheme.titleSmall,),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
