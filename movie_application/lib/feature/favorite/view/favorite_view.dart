import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_application/core/base/view/base_view.dart';
import 'package:movie_application/core/extension/context_extension.dart';
import 'package:movie_application/core/init/lang/locale_keys.g.dart';
import 'package:movie_application/core/init/notifier/theme_notifier.dart';
import 'package:movie_application/core/state/screen_state.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_application/feature/favorite/viewmodel/favorite_view_model.dart';
import 'package:movie_application/feature/movie/view/movie_view.dart';
import 'package:movie_application/product/card/my_card.dart';
import 'package:provider/provider.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<FavoriteViewModel>(
      viewModel: FavoriteViewModel(),
      onPageBuilder: (BuildContext context, value) {
        value.fetchFavoriteMovieList(context);
        print("*****" + value.screenState.name);
        return Observer(
          builder: (BuildContext context) {
            return switch (value.screenState) {
              ScreenState.ERROR => errorWidget(),
              ScreenState.LOADING => loadingWidget(),
              ScreenState.SUCCESS => successWidget(value),
            };
          },
        );
      },
    );
  }

  Widget successWidget(FavoriteViewModel value) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.main_favori_favoriteMovies.tr()),
        centerTitle: true,
      ),
      body: Observer(
        builder: (context) {
          if (value.listResults.isEmpty) {
            return Center(
                child: Text(LocaleKeys.main_search_movieNotFound.tr()));
          }
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              GridView.builder(
                controller: value.scrollController,
                itemCount: value.listResults.length,
                itemBuilder: (context, index) {
                  return MyCard(
                    id: value.listResults[index].id!,
                    movieName: value.listResults[index].titleText!.text!,
                    year: '${value.listResults[index].releaseYear!.year!}',
                    imageUrl: value.listResults[index].primaryImage!.url!,
                    function: (temp) async {
                      final awaitPageNavigator =
                          await Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            MovieView(id: value.listResults[index].id!),
                      ));
                      if (awaitPageNavigator == null) {
                        //value.fetchFavoriteMovie(context);
                        value.fetchFavoriteMovieList(context);
                      } else if (awaitPageNavigator) {
                        //value.fetchFavoriteMovie(context);
                        value.fetchFavoriteMovieList(context);
                      }
                    },
                  );
                },
                padding: context.paddingLow,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.7,
                  crossAxisCount: 2,
                ),
              ),
              value.isLoading
                  ? CircularProgressIndicator(
                      color: Provider.of<ThemeNotifier>(context, listen: false)
                          .currentTheme
                          .primaryColor,
                    )
                  : SizedBox(),
            ],
          );
        },
      ),
    );
  }

  Widget loadingWidget() {
    return Scaffold(
      body: Center(
          child: CircularProgressIndicator(
        color: Provider.of<ThemeNotifier>(context, listen: false)
            .currentTheme
            .primaryColor,
      )),
    );
  }

  Widget errorWidget() {
    return Scaffold(
      body: Center(child: Text(LocaleKeys.login_error.tr())),
    );
  }
}
