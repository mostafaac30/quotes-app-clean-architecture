import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(
  double fontSize,
  Color color,
  FontWeight fontWeight, {
  FontStyle fontStyle = FontStyle.normal,
}) {
  return TextStyle(
    fontFamily: FontConstants.fontFamily,
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
  );
}

TextStyle getMediumStyle({
  double fontSize = FontSize.s16,
  required Color color,
}) {
  return _getTextStyle(fontSize, color, FontWeightManager.medium);
}

TextStyle getBoldStyle({
  double fontSize = FontSize.s18,
  required Color color,
}) {
  return _getTextStyle(fontSize, color, FontWeightManager.bold);
}

TextStyle getSemiBoldItalicStyle({
  double fontSize = FontSize.s16,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    color,
    FontWeightManager.semiBold,
    fontStyle: FontStyle.italic,
  );
}
