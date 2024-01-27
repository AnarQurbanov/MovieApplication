import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_application/core/base/view/base_view.dart';
import 'package:movie_application/core/extension/context_extension.dart';
import 'package:movie_application/core/init/lang/locale_keys.g.dart';
import 'package:movie_application/core/init/notifier/theme_notifier.dart';
import 'package:movie_application/core/state/screen_state.dart';
import 'package:movie_application/feature/movie/view/movie_view.dart';
import 'package:movie_application/feature/search/viewmodel/search_view_model.dart';
import 'package:movie_application/product/card/my_card.dart';
import 'package:provider/provider.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  Widget body = Scaffold();
  String name = "";
  @override
  Widget build(BuildContext context) {
    return BaseView<SearchViewModel>(
      viewModel: SearchViewModel(),
      onPageBuilder: (BuildContext context, viewModel) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(Icons.search),
              )
            ],
            title: TextField(
              style: TextStyle(
                  color: Provider.of<ThemeNotifier>(context)
                      .currentTheme
                      .hintColor),
              decoration: InputDecoration(
                labelStyle: context.textTheme.subtitle1,
                focusedBorder: Provider.of<ThemeNotifier>(context)
                    .currentTheme
                    .inputDecorationTheme
                    .focusedBorder,
                enabledBorder: Provider.of<ThemeNotifier>(context)
                    .currentTheme
                    .inputDecorationTheme
                    .enabledBorder,
              ),
              cursorColor:
                  Provider.of<ThemeNotifier>(context).currentTheme.primaryColor,
              onChanged: (value) {
                viewModel.page = 1;
                name = value;
                viewModel.listResults = [];
                viewModel.searchMovies(value);
                print("+++++++++++++++++++++++++++++++");
                print(viewModel.screenState.name);
                print("----------------ilk : $name----------------------");
                setState(() {});
              },
            ),
          ),
          body: Observer(
            builder: (BuildContext context) {
              return switch (viewModel.screenState) {
                ScreenState.ERROR => body = errorWidget(),
                ScreenState.LOADING => body = loadingWidget(),
                ScreenState.SUCCESS => body = successWidget(viewModel, context),
              };
            },
          ),
        );
      },
    );
  }

  Widget successWidget(SearchViewModel viewModel, BuildContext context) {
    return NotificationListener<ScrollEndNotification>(
        onNotification: (notification) {
      if (viewModel.scrollController.position.pixels >=
          viewModel.scrollController.position.maxScrollExtent - 20) {
        viewModel.page += 1;
        print("Esit*******");
        print(viewModel.page);
        viewModel.searchMovies(name);
      }
      return true;
    }, child: Observer(
      builder: (context) {
        if (viewModel.listResults.isEmpty) {
          return Center(child: Text(LocaleKeys.main_search_movieNotFound.tr()));
        }
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            GridView.builder(
              controller: viewModel.scrollController,
              itemCount: viewModel.listResults.length,
              itemBuilder: (context, index) {
                try {
                  //Resim hatasi oluyor
                  return MyCard(
                    id: viewModel.listResults[index].id!,
                    movieName: viewModel.listResults[index].titleText!.text!,
                    year:
                        "${viewModel.listResults[index].releaseYear?.year ?? LocaleKeys.main_search_noData.tr()}",
                    imageUrl: viewModel.listResults[index].primaryImage?.url ??
                        "https://t4.ftcdn.net/jpg/02/51/95/53/360_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg",
                    function: (temp) async {
                      final awaitPageNavigator =
                          await Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            MovieView(id: viewModel.listResults[index].id!),
                      ));
                      if (awaitPageNavigator == null) {
                        //viewModel.searchMovies(name);
                      } else if (awaitPageNavigator) {
                        //viewModel.searchMovies(name);
                      }
                    },
                  );
                } catch (e) {
                  return MyCard(
                    id: viewModel.listResults[index].id!,
                    movieName: viewModel.listResults[index].titleText!.text!,
                    year:
                        "${viewModel.listResults[index].releaseYear?.year ?? LocaleKeys.main_search_noData.tr()}",
                    imageUrl:
                        "https://t4.ftcdn.net/jpg/02/51/95/53/360_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg",
                    function: (temp) async {
                      final awaitPageNavigator =
                          await Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            MovieView(id: viewModel.listResults[index].id!),
                      ));
                      if (awaitPageNavigator) {
                        viewModel.searchMovies(name);
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
            viewModel.isLoading
                ? CircularProgressIndicator(
                    color: Provider.of<ThemeNotifier>(context)
                        .currentTheme
                        .primaryColor,
                  )
                : SizedBox(),
          ],
        );
      },
    ));
  }

  Widget loadingWidget() {
    return Scaffold(
      body: Center(
          // child: CircularProgressIndicator(
          //   color: Provider.of<ThemeNotifier>(context).currentTheme.primaryColor,
          // ),
          ),
    );
  }

  Widget errorWidget() {
    return Scaffold(
      body: Center(child: Text(LocaleKeys.login_error)),
    );
  }
}
