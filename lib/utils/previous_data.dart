import 'package:flutter/material.dart';

class PreviousData extends ChangeNotifier {
  double temp = 20;
  double uvIndex = 20;
  String wmoCode = "20";
  String city = "Varanasi";

  void changeValue(double newUvIndex, double newTemp, String newCity, String newWmoCode) {
    temp = newTemp;
    uvIndex = newUvIndex;
    city = newCity;
    wmoCode = newWmoCode;
    notifyListeners();
  }
}