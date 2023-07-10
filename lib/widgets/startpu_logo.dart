import 'package:flutter/material.dart';

class StarterTopLogo extends StatelessWidget {
  const StarterTopLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/EazymenLogo.png',
      fit: BoxFit.fill,
      width: 120,height: 25,
    );
  }
}
