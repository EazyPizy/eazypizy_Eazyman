import 'package:flutter/material.dart';

abstract class EazyColors {
  static const Color dummy = Colors.amber;
  static const Color lightBlack = Colors.black54;
  static const Color background = Color(0xFFF6F6F6);
  static const secBackground = Color(0xffececf6);
  static const Color appBarBG = Colors.white;

  ///New Colors///
  static const white = Colors.white;
  static const secondary = Color(0xffa6a6a6);
  static const iconGray = Color(0xff767676);
  static const black = Colors.black;
  static const borderColors = Colors.blueAccent;
  static const blackShade = Color(0xff262626);
  static const barBg = Color(0xffe3e3ee);
  static Color gray100 = hexToColor('#bdbebe');

  static const Color primary = Colors.indigo;
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex));

  return Color(int.parse(hex.substring(1), radix: 16) +
      (hex.length == 7 ? 0xFF000000 : 0x00000000));
}
