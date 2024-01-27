import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_application/core/init/notifier/firebase_notifier.dart';
import 'package:movie_application/core/service/dio_service.dart';
import 'package:movie_application/core/service/firebase_service.dart';
import 'package:movie_application/core/state/screen_state.dart';
import 'package:movie_application/feature/_model/results_model.dart';
import 'package:movie_application/feature/_model/user_model.dart';
import 'package:provider/provider.dart';
part 'movie_view_model.g.dart';

class MovieViewModel = _MovieViewModelBase with _$MovieViewModel;

abstract class _MovieViewModelBase with Store {
  @observable
  Results result = Results();

  @observable
  bool favorite = false;

  @observable
  ScreenState screenStateMovie = ScreenState.LOADING;

  @observable
  ScreenState screenStateFavorite = ScreenState.LOADING;

  @action
  Future<void> fetchMovieWithID(String id, BuildContext context) async {
    print("***************** fetchMovieWithID basladi*********************");
    screenStateMovie = ScreenState.LOADING;
    final dioService = DioService();

    // ignore: body_might_complete_normally_catch_error
    result = await dioService.fetchMovieWithID(id: id).catchError((e) {
      screenStateMovie = ScreenState.ERROR;
    });
    //favoriteMovie(context);

    screenStateMovie = ScreenState.SUCCESS;
    print("***************** fetchMovieWithID bitti*********************");
    print(result.id);
  }

  @action
  Future<void> favoriteMovie(BuildContext context) async {
    print(
        "*********************** FAVORI BASLADI *****************************");

    screenStateFavorite = ScreenState.LOADING;
    try {
      print("*********************** ASAMA 2 *****************************");
      print(Provider.of<FirebaseNotifier>(context).userID!);
      UserModel user = await FireBaseService()
          .fetchUser(Provider.of<FirebaseNotifier>(context).userID!);
      print("*********************** ASAMA 3 *****************************");
      for (String id in user.favoriteMovies) {
        print(id);
        print(result.id);
        if (id == result.id) {
          print(
              "*********************** BU FILM FAVORI *****************************");
          favorite = true;
          break;
        }
      }
      screenStateFavorite = ScreenState.SUCCESS;
    } catch (e) {
      screenStateFavorite = ScreenState.ERROR;
    }
  }

  // @action
  // Future<void> favoriteMovie(BuildContext context) async {
  //   print("***************** favoriteMovie basladi*********************");
  //   screenStateFavorite = ScreenState.LOADING;

  //   final service = HiveService();
  //   try {
  //     print("***************** Veri cekiliyor*********************");
  //     listResults = await service.fetchNotes(context);
  //     print("***************** veri cekildi*********************");
  //     print(listResults[0].id);
  //     for (Results item in listResults) {
  //       if (result.id == item.id) {
  //         favorite = true;
  //         print("True kismi calisti********************************");
  //         break;
  //       }
  //     }
  //     screenStateFavorite = ScreenState.SUCCESS;
  //   } catch (e) {
  //     screenStateFavorite = ScreenState.ERROR;
  //   }
  //   print("***************** fetchMovieWithID bitti*********************");
  // }
}
