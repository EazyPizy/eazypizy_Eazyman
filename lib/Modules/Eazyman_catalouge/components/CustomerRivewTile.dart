import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';
import '../../../widgets/easy_container.dart';

class CustomerReviewTile extends StatelessWidget {
  const CustomerReviewTile({
    required this.index,
    super.key,
  });

  final int index;

  // final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: EasyContainer(
        height: 120,
        showBorder: true,
        borderColor: EazyColors.borderColors,
        
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              const CircleAvatar(),
              Text('$index Best Service', style: Get.textTheme.labelSmall),
            ],
          ),
        ),
      ),
    );
  }
}
