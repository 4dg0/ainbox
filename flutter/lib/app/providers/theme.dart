import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.lightGreen,
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.lightGreen,
  );
}

class ThemeNotifier extends Notifier<ThemeData> {
  @override
  ThemeData build() {
    _loadTheme();
    return AppThemes.darkTheme;
  }

  Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = state == AppThemes.lightTheme;

    state = isDarkMode ? AppThemes.darkTheme : AppThemes.lightTheme;
    await prefs.setBool('isDarkMode', isDarkMode);
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('isDarkMode') ?? false;
    state = isDarkMode ? AppThemes.darkTheme : AppThemes.lightTheme;
  }
}

final themeProvider = NotifierProvider<ThemeNotifier, ThemeData>(() {
  return ThemeNotifier();
});
