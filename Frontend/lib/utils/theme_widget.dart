import 'package:flutter/material.dart';
import 'package:personal_expenses_app/utils/app_colors.dart';

class MyAppTheme{
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: AppColor.bodyColorDark,
    scaffoldBackgroundColor: AppColor.bodyColorDark,
    hintColor: AppColor.textColor,
    primaryColorLight: AppColor.buttonBackgroundColorDark,
    primaryColor: Colors.green,
    fontFamily: 'OpenSans',
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white,),
      displayMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      displaySmall: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      headlineSmall: TextStyle(fontSize: 18, color: Colors.green)
    ),

    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      buttonColor: Colors.white,
    )
  );
}