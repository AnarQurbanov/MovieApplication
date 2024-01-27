import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_application/core/init/notifier/firebase_notifier.dart';
import 'package:movie_application/core/service/dio_service.dart';
import 'package:movie_application/core/service/firebase_service.dart';
import 'package:movie_application/core/state/screen_state.dart';
import 'package:movie_application/feature/_model/results_model.dart';
import 'package:movie_application/feature/_model/user_model.dart';
import 'package:provider/provider.dart';
part 'favorite_view_model.g.dart';

class FavoriteViewModel = _FavoriteViewModelBase with _$FavoriteViewModel;

abstract class _FavoriteViewModelBase with Store {
  @observable
  int page = 1;

  @observable
  bool isLoading = false;

  @observable
  List<Results> listResults = [];

  @observable
  List listfavoriteMoviesID = [];

  @observable
  ScrollController scrollController =
      ScrollController(initialScrollOffset: 0.0);

  @observable
  ScreenState screenState = ScreenState.LOADING;

  // Future<void> fetchFavoriteMovie(BuildContext context) async {
  //   screenState = ScreenState.LOADING;

  //   final service = HiveService();
  //   try {
  //     listResults = await service.fetchNotes(context);
  //     screenState = ScreenState.SUCCESS;
  //   } catch (e) {
  //     screenState = ScreenState.ERROR;
  //   }
  // }

  Future<void> fetchFavoriteMovieList(BuildContext context) async {
    screenState = ScreenState.LOADING;
    try {
      UserModel user = await FireBaseService().fetchUser(
          Provider.of<FirebaseNotifier>(context, listen: false).userID!);
      listfavoriteMoviesID = user.favoriteMovies;
      List<Future<Results>> liste = [];
      for (String id in listfavoriteMoviesID) {
        liste.add(DioService().fetchMovieWithID(id: id));
      }
      listResults = await Future.wait<Results>(liste);
      screenState = ScreenState.SUCCESS;
    } catch (e) {
      print(e.toString());
      screenState = ScreenState.ERROR;
    }
  }
}
