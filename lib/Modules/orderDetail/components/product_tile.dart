import 'package:eazypizy_eazyman/widgets/easy_container.dart';
import 'package:eazypizy_eazyman/widgets/eazy_networkimage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookingProductTile extends StatelessWidget {
  const BookingProductTile({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.quantity,
    required this.price,
  });

  final String imageUrl;
  final String name;
  final int quantity;
  final int price;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(8),
      isThreeLine: true,
      leading: EasyContainer(
        borderRadius: 20,
        height: 75.h,
        width: 60.w,
        child: EazyNetworkImage(
          url: imageUrl,
        ),
      ),
      title: Text(
        name,
        style: Get.textTheme.titleMedium,
      ),
      subtitle: Text(
        '₹$price X $quantity',
        style: Get.textTheme.titleSmall,
      ),
      trailing: Text(
        '₹${quantity * price}',
        style: Get.textTheme.titleMedium,
      ),
    );
  }
}
