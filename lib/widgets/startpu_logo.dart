import 'package:flutter/material.dart';

class StarterTopLogo extends StatelessWidget {
  const StarterTopLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 27,
      width: 90,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/EazymenLogo.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
