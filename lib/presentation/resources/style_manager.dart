import 'package:flutter/material.dart';


// Text Style
TextStyle _getTextStyle(
    {required double fontSize,
    required FontWeight fontWeight,
    required Color color}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color);
}

//Reqular Text Style
TextStyle getRegularStyle(
    {double fontSize = 12, required Color color,TextDecoration textDecoration=TextDecoration.none}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
      color: color);
}

//Light Text Style
TextStyle getLightStyle({double fontSize = 12, required Color color,TextDecoration textDecoration=TextDecoration.none}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontWeight:  FontWeight.w300,
      color: color);
}

//Medium Text Style
TextStyle getMediumStyle(
    {double fontSize = 12, required Color color}) {
  return _getTextStyle(
      fontSize: fontSize,

      fontWeight: FontWeight.w500,
      color: color);
}

//Bold Text Style
TextStyle getBoldStyle({double fontSize = 12, required Color color,TextDecoration textDecoration=TextDecoration.none}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color);
}

//SemiBold Text Style
TextStyle getSemiBoldStyle(
    {double fontSize = 12, required Color color,TextDecoration textDecoration=TextDecoration.none}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      color: color);
}
