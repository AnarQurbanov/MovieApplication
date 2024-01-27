// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieViewModel on _MovieViewModelBase, Store {
  late final _$resultAtom =
      Atom(name: '_MovieViewModelBase.result', context: context);

  @override
  Results get result {
    _$resultAtom.reportRead();
    return super.result;
  }

  @override
  set result(Results value) {
    _$resultAtom.reportWrite(value, super.result, () {
      super.result = value;
    });
  }

  late final _$favoriteAtom =
      Atom(name: '_MovieViewModelBase.favorite', context: context);

  @override
  bool get favorite {
    _$favoriteAtom.reportRead();
    return super.favorite;
  }

  @override
  set favorite(bool value) {
    _$favoriteAtom.reportWrite(value, super.favorite, () {
      super.favorite = value;
    });
  }

  late final _$screenStateMovieAtom =
      Atom(name: '_MovieViewModelBase.screenStateMovie', context: context);

  @override
  ScreenState get screenStateMovie {
    _$screenStateMovieAtom.reportRead();
    return super.screenStateMovie;
  }

  @override
  set screenStateMovie(ScreenState value) {
    _$screenStateMovieAtom.reportWrite(value, super.screenStateMovie, () {
      super.screenStateMovie = value;
    });
  }

  late final _$screenStateFavoriteAtom =
      Atom(name: '_MovieViewModelBase.screenStateFavorite', context: context);

  @override
  ScreenState get screenStateFavorite {
    _$screenStateFavoriteAtom.reportRead();
    return super.screenStateFavorite;
  }

  @override
  set screenStateFavorite(ScreenState value) {
    _$screenStateFavoriteAtom.reportWrite(value, super.screenStateFavorite, () {
      super.screenStateFavorite = value;
    });
  }

  late final _$fetchMovieWithIDAsyncAction =
      AsyncAction('_MovieViewModelBase.fetchMovieWithID', context: context);

  @override
  Future<void> fetchMovieWithID(String id, BuildContext context) {
    return _$fetchMovieWithIDAsyncAction
        .run(() => super.fetchMovieWithID(id, context));
  }

  late final _$favoriteMovieAsyncAction =
      AsyncAction('_MovieViewModelBase.favoriteMovie', context: context);

  @override
  Future<void> favoriteMovie(BuildContext context) {
    return _$favoriteMovieAsyncAction.run(() => super.favoriteMovie(context));
  }

  @override
  String toString() {
    return '''
result: ${result},
favorite: ${favorite},
screenStateMovie: ${screenStateMovie},
screenStateFavorite: ${screenStateFavorite}
    ''';
  }
}
