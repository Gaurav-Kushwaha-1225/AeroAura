import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimeFormatProvider extends ChangeNotifier {
  bool _is24HrFormat = false;
  bool get is24HrFormat => _is24HrFormat;

  late SharedPreferences storage;

  changeTimeFormat() {
    _is24HrFormat = !is24HrFormat;
    storage.setBool("is24HrFormat", _is24HrFormat);
    notifyListeners();
  }

  init() async {
    storage = await SharedPreferences.getInstance();
    _is24HrFormat = storage.getBool("is24HrFormat")??false;
    notifyListeners();
  }
}
