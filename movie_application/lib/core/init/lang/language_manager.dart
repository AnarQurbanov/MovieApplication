import 'package:flutter/material.dart';

class LanguageManager {
  // static LanguageManager? _instance;
  // static LanguageManager get instance {
  //   if (_instance == null) _instance = LanguageManager._init();
  //   return instance;
  // }

  // LanguageManager._init();

  static LanguageManager instance = LanguageManager();

  final enLocale = const Locale("en", "US");
  final trLocale = const Locale("tr", "TR");

  List<Locale> get supportedLocales => [enLocale, trLocale];
}
