import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;

  late SharedPreferences storage;

  changeTheme() {
    _isDark = !isDark;
    storage.setBool("isDark", _isDark);
    notifyListeners();
  }

  init() async {
    storage = await SharedPreferences.getInstance();
    _isDark = storage.getBool("isDark") ?? false;
    storage = await SharedPreferences.getInstance();
    _is24HrFormat = storage.getBool("is24HrFormat") ?? false;
    notifyListeners();
  }

  bool _is24HrFormat = false;
  bool get is24HrFormat => _is24HrFormat;

  changeTimeFormat() {
    _is24HrFormat = !is24HrFormat;
    storage.setBool("is24HrFormat", _is24HrFormat);
    notifyListeners();
  }
}
