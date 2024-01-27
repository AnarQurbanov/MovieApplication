import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_application/core/service/dio_service.dart';
import 'package:movie_application/core/state/screen_state.dart';
import 'package:movie_application/feature/_model/results_model.dart';
part 'search_view_model.g.dart';

class SearchViewModel = _SearchViewModelBase with _$SearchViewModel;

abstract class _SearchViewModelBase with Store {
  @observable
  int page = 1;

  @observable
  ScrollController scrollController =
      ScrollController(initialScrollOffset: 0.0);

  @observable
  List<Results> listResults = [];

  @observable
  bool isLoading = false;

  @observable
  ScreenState screenState = ScreenState.LOADING;

  Future<void> searchMovies(String name) async {
    if (page == 1) {
      screenState = ScreenState.LOADING;
    }
    final dioService = DioService();

    isLoading = true;

    await dioService
        .searchMovieWithName(
      name: name,
      page: '$page',
      limit: 10,
    )
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
  }
}
