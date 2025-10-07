import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;
  ThemeMode get currentTheme => _isDark ? ThemeMode.dark : ThemeMode.light;

  ThemeProvider() {
    _loadTheme(); // load saved theme on app start
  }

  void toggleTheme() async {
    _isDark = !_isDark;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark', _isDark); // save the theme state
  }

  void _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _isDark =
        prefs.getBool('isDark') ?? false; // get saved theme or default light
    notifyListeners();
  }
}
