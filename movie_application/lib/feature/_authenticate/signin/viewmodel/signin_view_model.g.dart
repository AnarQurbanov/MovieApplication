// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignInViewModel on _SignInViewModelBase, Store {
  late final _$isLockOpenAtom =
      Atom(name: '_SignInViewModelBase.isLockOpen', context: context);

  @override
  bool get isLockOpen {
    _$isLockOpenAtom.reportRead();
    return super.isLockOpen;
  }

  @override
  set isLockOpen(bool value) {
    _$isLockOpenAtom.reportWrite(value, super.isLockOpen, () {
      super.isLockOpen = value;
    });
  }

  late final _$signInServiceAsyncAction =
      AsyncAction('_SignInViewModelBase.signInService', context: context);

  @override
  Future<void> signInService() {
    return _$signInServiceAsyncAction.run(() => super.signInService());
  }

  late final _$_SignInViewModelBaseActionController =
      ActionController(name: '_SignInViewModelBase', context: context);

  @override
  void isLockStateChange() {
    final _$actionInfo = _$_SignInViewModelBaseActionController.startAction(
        name: '_SignInViewModelBase.isLockStateChange');
    try {
      return super.isLockStateChange();
    } finally {
      _$_SignInViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLockOpen: ${isLockOpen}
    ''';
  }
}
