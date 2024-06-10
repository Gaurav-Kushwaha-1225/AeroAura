import 'package:flutter/material.dart';

class PreviousData extends ChangeNotifier {
  double temp = 0;
  double uvIndex = 0;
  String wmoCode = "--";
  String city = "--";

  void changeValue(double newUvIndex, double newTemp, String newCity, String newWmoCode) {
    temp = newTemp;
    uvIndex = newUvIndex;
    city = newCity;
    wmoCode = newWmoCode;
    notifyListeners();
  }
}