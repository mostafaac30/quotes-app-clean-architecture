import 'package:flutter/material.dart';
import '../../core/utils/font_manager.dart';
import '../../core/utils/styles_manager.dart';
import '../../core/utils/values_manager.dart';

import '../../core/utils/color_manager.dart';

ThemeData getAppTheme() {
  return ThemeData(
    //app colors
    scaffoldBackgroundColor: ColorManager.bgColor,
    primaryColor: ColorManager.bgColor,
    primaryColorLight: ColorManager.bgColor,
    primaryColorDark: ColorManager.black100Color, //TODO: add correct dark color
    disabledColor: ColorManager.bgColor,
    splashColor: ColorManager.bodyText60Color, //ripple effect
    //card view theme
    cardTheme: CardTheme(
      color: ColorManager.bgBlockColor,
      shadowColor: ColorManager.black100Color.withOpacity(0.05),
      elevation: AppSize.s0,
      margin: EdgeInsets.all(AppMargin.m22),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s24),
      ),
    ), // app bar theme

    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.bgColor,
        elevation: AppSize.s0,
        titleTextStyle: getBoldStyle(
          fontSize: FontSize.s18,
          color: ColorManager.black100Color,
        )),
    //button theme
    buttonTheme: ButtonThemeData(
      buttonColor: ColorManager.black100Color,
      disabledColor: ColorManager.bodyText60Color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s16),
      ),
    ),
    //elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getBoldStyle(
          color: ColorManager.black100Color,
          fontSize: FontSize.s16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s16),
        ),
        elevation: AppSize.s0,
      ),
    ),
    //input decoration theme
    inputDecorationTheme: InputDecorationTheme(
        fillColor: ColorManager.bgColor,
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppPadding.p18,
          vertical: AppPadding.p24,
        ),
        hintStyle: getSemiBoldItalicStyle(
          fontSize: FontSize.s18,
          color: ColorManager.bodyText25Color,
        ),
        labelStyle: getSemiBoldItalicStyle(
          fontSize: FontSize.s12,
          color: ColorManager.yellowColor,
        ),
        errorStyle: getSemiBoldItalicStyle(
          fontSize: FontSize.s12,
          color: ColorManager.redColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.orangeColor,
            width: AppSize.s1_5,
          ),
          borderRadius: BorderRadius.circular(AppSize.s16),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s16),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.redColor,
            width: AppSize.s1_5,
          ),
          borderRadius: BorderRadius.circular(AppSize.s16),
        ),

        //when he start typing again after error
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s16),
        )),

    //text theme
    textTheme: TextTheme(
        //for buttons text
        headlineMedium: getBoldStyle(
      color: ColorManager.bgBlockColor,
    )),
  );
}
