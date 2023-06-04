import 'package:eazypizy_eazyman/theme/eazy_spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return getShimmerLoader();
  }
}

Shimmer getShimmerLoader() {
  return Shimmer.fromColors(
    baseColor: Colors.grey,
    highlightColor: Colors.grey.shade50,
    child: ListView.separated(
      padding: const EdgeInsets.all(8.0),
      separatorBuilder: (context, index) => Space.vertical(14),
      itemCount: 6,
      itemBuilder: (context, index) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                border: Border.all(
                  color: Colors.blueAccent.withOpacity(0.50),
                ),
              ),
              height: 90.h,
              width: 75.w,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(4),
                child: Container(
                  height: 15,
                  width: 250,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 15,
                      width: 100,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      height: 15,
                      width: 60,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 15,
                      width: 80,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      height: 15,
                      width: 80,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //    Container(
          //      height: 20,
          //      width: 150,
          //      color: Colors.grey,
          //    ),
          //     // Row(
          //     //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     //   crossAxisAlignment: CrossAxisAlignment.end,
          //     //   children: [
          //     //     Container(
          //     //       height: 20,
          //     //       width: 150,
          //     //       color: Colors.grey,
          //     //     ),
          //     //     const SizedBox(
          //     //       width: 8,
          //     //     ),
          //     //     Container(
          //     //       height: 20,
          //     //       width: 150,
          //     //       color: Colors.grey,
          //     //     ),
          //     //   ],
          //     // ),
          //     // Row(
          //     //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     //   crossAxisAlignment: CrossAxisAlignment.end,
          //     //   children: [
          //     //     Padding(
          //     //       padding: const EdgeInsets.only(top: 8.0),
          //     //       child: Row(
          //     //         children: [
          //     //           Container(
          //     //             height: 20,
          //     //             width: 40,
          //     //             color: Colors.grey,
          //     //           ),
          //     //           Container(
          //     //             height: 20,
          //     //             width: 150,
          //     //             color: Colors.grey,
          //     //           ),
          //     //         ],
          //     //       ),
          //     //     ),
          //     //     const SizedBox(
          //     //       width: 8,
          //     //     ),
          //     //     Padding(
          //     //       padding: const EdgeInsets.only(top: 8),
          //     //       child: Row(
          //     //         children: [
          //     //            Container(
          //     //             height: 20,
          //     //             width: 40,
          //     //             color: Colors.grey,
          //     //           ),
          //     //           Container(
          //     //             height: 20,
          //     //             width: 150,
          //     //             color: Colors.grey,
          //     //           ),
          //     //         ],
          //     //       ),
          //     //     ),
          //     //   ],
          //     // ),
          //   ],
          // )
        ],
      ),
    ),
  );
}
