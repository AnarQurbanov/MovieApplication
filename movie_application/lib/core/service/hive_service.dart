import 'package:flutter/material.dart';
import 'package:movie_application/core/init/notifier/hive_notifier.dart';
import 'package:movie_application/core/state/theme_state.dart';
import 'package:movie_application/feature/_model/results_model.dart';
import 'package:provider/provider.dart';

class HiveService {
  void addNotes(BuildContext context, Results model) async {
    await Provider.of<HiveNotifier>(context, listen: false).initNotesBox();
    await Provider.of<HiveNotifier>(context, listen: false)
        .notesBox
        ?.put(model.id, model);
    ChangeNotifier();
    print(
        "---------------${model.id} numarali film eklendi-------------------");
  }

  Future<List<Results>> fetchNotes(BuildContext context) async {
    await Provider.of<HiveNotifier>(context, listen: false).initNotesBox();
    if (Provider.of<HiveNotifier>(context, listen: false).notesBox != null) {
      List<Results> listNotes =
          await Provider.of<HiveNotifier>(context, listen: false)
              .notesBox!
              .values
              .toList();
      return listNotes;
    } else {
      List<Results> listNotes = [];
      return listNotes;
    }
  }

  void deleteNote(BuildContext context, Results model) async {
    await Future.wait([
      Provider.of<HiveNotifier>(context, listen: false).initNotesBox(),
      Provider.of<HiveNotifier>(context, listen: false)
              .notesBox
              ?.delete(model.id) ??
          Future.value(null),
    ]);

    ChangeNotifier();
  }

  Future<void> changeTheme(BuildContext context, AppThemes theme) async {
    await Provider.of<HiveNotifier>(context, listen: false).initThemeBox();
    await Provider.of<HiveNotifier>(context, listen: false).themeBox?.clear();
    await Provider.of<HiveNotifier>(context, listen: false)
        .themeBox
        ?.add(theme);

    print(
        "**********************THEME VERI DEGISTI*****************************");
    print(
        "**********************YENI VERI ${theme}*****************************");
  }

  Future<AppThemes> fetchTheme(BuildContext context) async {
    await Provider.of<HiveNotifier>(context, listen: false).initNotesBox();
    if (Provider.of<HiveNotifier>(context, listen: false).themeBox != null) {
      List<AppThemes>? listNotes =
          await Provider.of<HiveNotifier>(context, listen: false)
              .themeBox
              ?.values
              .toList();
      return listNotes![0];
    } else {
      return AppThemes.DARK;
    }
  }
}
