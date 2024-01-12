import 'package:aeroaura/utils/consts.dart';
import 'package:flutter/material.dart';

// enum CurrentTheme { dark, light }

class AeroTheme {
  AeroTheme._();

  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      fontFamily: "OpenSans",
      primaryColor: Constants.darkPrimary,
      primaryColorDark: Constants.darkSecondary,
      scaffoldBackgroundColor: Constants.darkPrimary,
      buttonTheme: const ButtonThemeData());

  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      fontFamily: "OpenSans",
      primaryColor: Constants.lightPrimary,
      primaryColorDark: Constants.lightSecondary,
      scaffoldBackgroundColor: Constants.lightPrimary,
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.transparent,

      ));
}
