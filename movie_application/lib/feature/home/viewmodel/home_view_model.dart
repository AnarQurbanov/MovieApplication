import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_application/core/service/dio_service.dart';
import 'package:movie_application/core/state/screen_state.dart';
import 'package:movie_application/feature/_model/results_model.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  @observable
  int page = 1;

  @observable
  bool isLoading = false;

  @observable
  List<Results> listResults = [];

  @observable
  ScrollController scrollController =
      ScrollController(initialScrollOffset: 0.0);

  @observable
  ScreenState screenState = ScreenState.LOADING;

  @action
  void pageAdd() {
    page += 1;
  }

  @action
  Future<void> fetchMovies() async {
    if (page == 1) {
      screenState = ScreenState.LOADING;
    }
    final dioService = DioService();

    isLoading = true;
    await dioService
        .fetchMovies(titleType: 'movie', page: "${page}", limit: 10, year: 2024)
        .then((movies) {
      for (Results item in movies.results!) {
        listResults.add(item);
      }
    }).catchError((e) {
      print('Hata oluştu: $e');
      screenState = ScreenState.ERROR;
    });
    screenState = ScreenState.SUCCESS;
    isLoading = false;
    print("***********************success******************************");
    print(screenState);
  }
}
