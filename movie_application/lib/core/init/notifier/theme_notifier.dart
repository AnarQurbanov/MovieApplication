import 'package:flutter/material.dart';

import 'package:movie_application/core/init/theme/theme_dark.dart';
import 'package:movie_application/core/init/theme/theme_light.dart';
import 'package:movie_application/core/state/theme_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData currentTheme = ThemeDark().theme;

  AppThemes currenThemeEnum = AppThemes.DARK;

  bool isDark = true;

  // AppThemes get currenThemeEnum => _currenThemeEnum;

  // ThemeData get currentTheme => _currentTheme;

  themeSettings(bool isDark) {
    if (isDark) {
      currentTheme = ThemeDark().theme;
      currenThemeEnum = AppThemes.DARK;
    } else {
      currentTheme = ThemeLight().theme;
      currenThemeEnum = AppThemes.LIGHT;
    }
  }

  Future<ThemeData> getTheme() async {
    SharedPreferences sharedPre = await SharedPreferences.getInstance();
    if (sharedPre.getBool("isDark")!) {
      currentTheme = ThemeDark().theme;
      currenThemeEnum = AppThemes.DARK;
      isDark = true;
      return ThemeDark().theme;
    } else {
      currentTheme = ThemeLight().theme;
      currenThemeEnum = AppThemes.LIGHT;
      isDark = false;
      return ThemeLight().theme;
    }
  }

  Future<AppThemes> changeTheme() async {
    SharedPreferences sharedPre = await SharedPreferences.getInstance();
    if (currenThemeEnum == AppThemes.LIGHT) {
      currentTheme = ThemeDark().theme;
      currenThemeEnum = AppThemes.DARK;
      sharedPre.setBool("isDark", true);
    } else {
      currentTheme = ThemeLight().theme;
      currenThemeEnum = AppThemes.LIGHT;
      sharedPre.setBool("isDark", false);
    }
    print(
        "****************ISDARK ${sharedPre.getBool("isDark")}*******************************");
    notifyListeners();
    return currenThemeEnum;
  }
}
