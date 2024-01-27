import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_application/core/init/lang/language_manager.dart';
import 'package:movie_application/core/init/notifier/theme_notifier.dart';
import 'package:movie_application/core/state/theme_state.dart';
import 'package:provider/provider.dart';
part 'account_view_model.g.dart';

class AccountViewModel = _AccountViewModelBase with _$AccountViewModel;

abstract class _AccountViewModelBase with Store {
  @observable
  AppThemes? theme;

  @observable
  Locale? appLocale = LanguageManager.instance.enLocale;

  @action
  Future<void> changeValue(BuildContext context) async {
    // if (theme == AppThemes.DARK) {
    //   theme = AppThemes.LIGHT;
    // } else {
    //   theme = AppThemes.DARK;
    // }
    theme =
        await Provider.of<ThemeNotifier>(context, listen: false).changeTheme();
  }

  @action
  void changeLanguage(BuildContext context) {
    if (appLocale == LanguageManager.instance.enLocale) {
      appLocale = LanguageManager.instance.trLocale;
    } else {
      appLocale = LanguageManager.instance.enLocale;
    }
    context.setLocale(appLocale!);
  }
}
