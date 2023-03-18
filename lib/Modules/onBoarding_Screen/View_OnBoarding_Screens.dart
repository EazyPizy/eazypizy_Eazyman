import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../SignUp_OR_SignIn/View_EnterMobileNumber.dart';

class OnBoardingScreens extends StatefulWidget {
  static const routeName = '/OnBoardingScreens';

  const OnBoardingScreens({super.key});

  @override
  State<OnBoardingScreens> createState() => _OnBoardingScreensState();
}

class _OnBoardingScreensState extends State<OnBoardingScreens> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget buildPage({ image,
  }) =>
      Image.asset(image);


  @override
  Widget build(BuildContext context) =>
      Scaffold(
        body: Stack(children: [
          PageView(

            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 2;
              });
            },
            scrollDirection: Axis.horizontal,
            controller: controller,
            children: [
              Container(
                  color: Colors.red,
                  child: const Center(
                    child: Text("Screen 1"),
                  )),
              Container(
                  color: Colors.blue,
                  child: const Center(
                    child: Text("Screen 2"),
                  )),
              Container(
                  color: Colors.green,
                  child: const Center(
                    child: Text("Screen 3"),
                  )),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                onPressed: () {
                  controller.jumpToPage(3);
                },
                child: const Text("Skip"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: isLastPage ? ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const InputMobileNumberScreen()));
                },
                child: const Text("Get Started"),
              ) : ElevatedButton(
                onPressed: () {
                  controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                child: const Text("Next"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Align(
                alignment: Alignment.bottomRight,
                child: SmoothPageIndicator(
                  axisDirection: Axis.horizontal,
                  controller: controller,
                  count: 3,
                  effect: const JumpingDotEffect(
                    dotHeight: 16,
                    dotWidth: 16,
                    //  type: WormType.thin,
                    // strokeWidth: 5,
                  ),
                  onDotClicked: (index) =>
                      controller.animateToPage(
                          index, duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn),
                )),
          )
        ]),
      );


}

