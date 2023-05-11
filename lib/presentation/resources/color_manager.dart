import 'package:flutter/material.dart';

class Colormanager {
  //FE3000
  static Color primary = Colors.blue.shade400;
  static Color darkGrey = HexColor.fromHex('#525252');
  static Color grey = HexColor.fromHex('#737477');
  static Color fillcolor = const Color(0xfff3f3f4);

  static Color black54 = Colors.black54;
  static Color black = Colors.black;
  static Color red = Colors.red;

  // New Colors
  static Color darkPrimary = Colors.blue.shade900;
  static Color white = HexColor.fromHex('#FFFFFF');
  static Color error = HexColor.fromHex('#e61f34'); //Red Color
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString';
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
