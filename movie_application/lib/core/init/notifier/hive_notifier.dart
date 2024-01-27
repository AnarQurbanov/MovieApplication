import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_application/core/constants/app_constants.dart';
import 'package:movie_application/core/state/theme_state.dart';
import 'package:movie_application/feature/_model/results_model.dart';

class HiveNotifier extends ChangeNotifier {
  Box<Results>? _notesBox;
  Box<AppThemes>? _themeBox;
  Box<String>? _languageBox;

  HiveNotifier() {
    //_notesBox?.close();
    //initNotesBox();
    _languageBox?.close();
    _themeBox?.close();
    initThemeBox();
    initLanguageBox();
  }

  Future<void> initNotesBox() async {
    if (_notesBox == null) {
      Hive.initFlutter();
      _notesBox = await Hive.openBox(ApplicationConstants.NOTES_BOX);
    }
  }

  Future<void> initThemeBox() async {
    if (_themeBox == null) {
      Hive.initFlutter();
      _themeBox = await Hive.openBox(ApplicationConstants.THEME_BOX);
    }
  }

  Future<void> initLanguageBox() async {
    if (_languageBox == null) {
      Hive.initFlutter();
      _languageBox = await Hive.openBox(ApplicationConstants.LANGUAGE_BOX);
    }
  }

  Box<Results>? get notesBox => _notesBox;
  Box<AppThemes>? get themeBox => _themeBox;
  Box<String>? get languageBox => _languageBox;
}
