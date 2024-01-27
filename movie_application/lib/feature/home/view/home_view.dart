import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_application/core/base/view/base_view.dart';
import 'package:movie_application/core/extension/context_extension.dart';
import 'package:movie_application/core/init/lang/locale_keys.g.dart';
import 'package:movie_application/core/init/notifier/theme_notifier.dart';
import 'package:movie_application/core/state/screen_state.dart';
import 'package:movie_application/feature/home/viewmodel/home_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_application/feature/movie/view/movie_view.dart';
import 'package:movie_application/product/card/my_card.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onPageBuilder: (BuildContext context, value) {
        value.fetchMovies();
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

  Widget successWidget(HomeViewModel value) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.main_home_movie.tr()),
        centerTitle: true,
      ),
      body: NotificationListener<ScrollEndNotification>(
        onNotification: (notification) {
          if (value.scrollController.position.pixels >=
              value.scrollController.position.maxScrollExtent - 20) {
            value.page += 1;
            print("Esit*******");
            print(value.page);
            value.fetchMovies();
          }
          return true;
        },
        child: Observer(
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
                    try {
                      //Resim hatasi oluyor
                      return MyCard(
                        id: value.listResults[index].id!,
                        movieName: value.listResults[index].titleText!.text!,
                        year:
                            "${value.listResults[index].releaseYear?.year ?? LocaleKeys.main_search_noData.tr()}",
                        imageUrl: value.listResults[index].primaryImage?.url ??
                            "https://t4.ftcdn.net/jpg/02/51/95/53/360_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg",
                        function: (temp) async {
                          final awaitPageNavigator = await Navigator.of(context)
                              .push(MaterialPageRoute(
                            builder: (context) =>
                                MovieView(id: value.listResults[index].id!),
                          ));
                          if (awaitPageNavigator == null) {
                            //value.fetchMovies();
                          } else if (awaitPageNavigator) {
                            //value.fetchMovies();
                          }
                        },
                      );
                    } catch (e) {
                      return MyCard(
                        id: value.listResults[index].id!,
                        movieName: value.listResults[index].titleText!.text!,
                        year:
                            "${value.listResults[index].releaseYear?.year ?? LocaleKeys.main_search_noData.tr()}",
                        imageUrl:
                            "https://t4.ftcdn.net/jpg/02/51/95/53/360_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg",
                        function: (temp) async {
                          final awaitPageNavigator = await Navigator.of(context)
                              .push(MaterialPageRoute(
                            builder: (context) =>
                                MovieView(id: value.listResults[index].id!),
                          ));
                          if (awaitPageNavigator) {
                            value.fetchMovies();
                          }
                        },
                      );
                    }
                  },
                  padding: context.paddingLow,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.7,
                    crossAxisCount: 2,
                  ),
                ),
                value.isLoading
                    ? CircularProgressIndicator(
                        color: Provider.of<ThemeNotifier>(context)
                            .currentTheme
                            .primaryColor,
                      )
                    : SizedBox(),
              ],
            );
            // return GridView.count(
            //   controller: value.scrollController,
            //   childAspectRatio: 0.7,
            //   crossAxisCount: 2,
            //   padding: context.paddingLow,
            //   children: value.listCard,
            // );
          },
        ),
      ),
    );
  }

  Widget loadingWidget() {
    return Scaffold(
      body: Center(
          child: CircularProgressIndicator(
        color: Provider.of<ThemeNotifier>(context).currentTheme.primaryColor,
      )),
    );
  }

  Widget errorWidget() {
    return Scaffold(
      body: Center(child: Text(LocaleKeys.login_error.tr())),
    );
  }
}
