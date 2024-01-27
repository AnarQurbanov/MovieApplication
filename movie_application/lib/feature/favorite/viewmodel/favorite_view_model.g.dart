// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoriteViewModel on _FavoriteViewModelBase, Store {
  late final _$pageAtom =
      Atom(name: '_FavoriteViewModelBase.page', context: context);

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_FavoriteViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$listResultsAtom =
      Atom(name: '_FavoriteViewModelBase.listResults', context: context);

  @override
  List<Results> get listResults {
    _$listResultsAtom.reportRead();
    return super.listResults;
  }

  @override
  set listResults(List<Results> value) {
    _$listResultsAtom.reportWrite(value, super.listResults, () {
      super.listResults = value;
    });
  }

  late final _$listfavoriteMoviesIDAtom = Atom(
      name: '_FavoriteViewModelBase.listfavoriteMoviesID', context: context);

  @override
  List<dynamic> get listfavoriteMoviesID {
    _$listfavoriteMoviesIDAtom.reportRead();
    return super.listfavoriteMoviesID;
  }

  @override
  set listfavoriteMoviesID(List<dynamic> value) {
    _$listfavoriteMoviesIDAtom.reportWrite(value, super.listfavoriteMoviesID,
        () {
      super.listfavoriteMoviesID = value;
    });
  }

  late final _$scrollControllerAtom =
      Atom(name: '_FavoriteViewModelBase.scrollController', context: context);

  @override
  ScrollController get scrollController {
    _$scrollControllerAtom.reportRead();
    return super.scrollController;
  }

  @override
  set scrollController(ScrollController value) {
    _$scrollControllerAtom.reportWrite(value, super.scrollController, () {
      super.scrollController = value;
    });
  }

  late final _$screenStateAtom =
      Atom(name: '_FavoriteViewModelBase.screenState', context: context);

  @override
  ScreenState get screenState {
    _$screenStateAtom.reportRead();
    return super.screenState;
  }

  @override
  set screenState(ScreenState value) {
    _$screenStateAtom.reportWrite(value, super.screenState, () {
      super.screenState = value;
    });
  }

  @override
  String toString() {
    return '''
page: ${page},
isLoading: ${isLoading},
listResults: ${listResults},
listfavoriteMoviesID: ${listfavoriteMoviesID},
scrollController: ${scrollController},
screenState: ${screenState}
    ''';
  }
}
