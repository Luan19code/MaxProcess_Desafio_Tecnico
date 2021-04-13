import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  static bool _isDarkModeEnabled = true;

  isDark() => _isDarkModeEnabled;

  changeTheme() {
    _isDarkModeEnabled = !_isDarkModeEnabled;
    notifyListeners();
  }

  systemTheme() {
    _isDarkModeEnabled = false;
    notifyListeners();
  }
}
