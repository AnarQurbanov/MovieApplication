// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AccountViewModel on _AccountViewModelBase, Store {
  late final _$themeAtom =
      Atom(name: '_AccountViewModelBase.theme', context: context);

  @override
  AppThemes? get theme {
    _$themeAtom.reportRead();
    return super.theme;
  }

  @override
  set theme(AppThemes? value) {
    _$themeAtom.reportWrite(value, super.theme, () {
      super.theme = value;
    });
  }

  late final _$appLocaleAtom =
      Atom(name: '_AccountViewModelBase.appLocale', context: context);

  @override
  Locale? get appLocale {
    _$appLocaleAtom.reportRead();
    return super.appLocale;
  }

  @override
  set appLocale(Locale? value) {
    _$appLocaleAtom.reportWrite(value, super.appLocale, () {
      super.appLocale = value;
    });
  }

  late final _$changeValueAsyncAction =
      AsyncAction('_AccountViewModelBase.changeValue', context: context);

  @override
  Future<void> changeValue(BuildContext context) {
    return _$changeValueAsyncAction.run(() => super.changeValue(context));
  }

  late final _$_AccountViewModelBaseActionController =
      ActionController(name: '_AccountViewModelBase', context: context);

  @override
  void changeLanguage(BuildContext context) {
    final _$actionInfo = _$_AccountViewModelBaseActionController.startAction(
        name: '_AccountViewModelBase.changeLanguage');
    try {
      return super.changeLanguage(context);
    } finally {
      _$_AccountViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
theme: ${theme},
appLocale: ${appLocale}
    ''';
  }
}
