import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_application/core/base/view/base_view.dart';
import 'package:movie_application/core/extension/context_extension.dart';
import 'package:movie_application/core/init/lang/locale_keys.g.dart';
import 'package:movie_application/core/init/notifier/firebase_notifier.dart';
import 'package:movie_application/core/init/notifier/theme_notifier.dart';
import 'package:movie_application/core/service/firebase_service.dart';
import 'package:movie_application/core/state/screen_state.dart';
import 'package:movie_application/feature/movie/viewmodel/movie_view_model.dart';
import 'package:provider/provider.dart';

class MovieView extends StatefulWidget {
  final String id;

  const MovieView({super.key, required this.id});

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<MovieViewModel>(
        viewModel: MovieViewModel(),
        onPageBuilder: (BuildContext context, value) {
          value.fetchMovieWithID(widget.id, context);
          return Observer(
            builder: (BuildContext context) {
              value.favoriteMovie(context);
              return switch (value.screenStateMovie) {
                ScreenState.ERROR => errorWidget(),
                ScreenState.LOADING => loadingWidget(),
                ScreenState.SUCCESS => successWidget(value, context),
              };
            },
          );
        });
  }

  Widget successWidget(MovieViewModel value, BuildContext context) {
    return switch (value.screenStateMovie) {
      //Favorite yap
      ScreenState.ERROR => errorWidget(),
      ScreenState.LOADING => loadingWidget(),
      ScreenState.SUCCESS => Scaffold(
          body: Observer(
            builder: (context) {
              return ListView(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, context.mediumValue, 0, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.orange, width: 2)),
                      ),
                      alignment: Alignment.center,
                      height: context.height / 10 * 6,
                      child: Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => imageWidget(value
                                              .result.primaryImage?.url ??
                                          "https://t4.ftcdn.net/jpg/02/51/95/53/360_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg")));
                            },
                            child: Hero(
                              tag: value.result.primaryImage?.url ??
                                  "https://t4.ftcdn.net/jpg/02/51/95/53/360_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg",
                              child: Center(
                                child: Image.network(
                                  value.result.primaryImage?.url ??
                                      "https://t4.ftcdn.net/jpg/02/51/95/53/360_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg",
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                  icon: Icon(Icons.arrow_back,
                                      size: 40,
                                      color: Provider.of<ThemeNotifier>(context)
                                          .currentTheme
                                          .hintColor)),
                              IconButton(
                                  onPressed: () {
                                    if (!value.favorite) {
                                      // HiveService()
                                      //     .addNotes(context, value.result);
                                      FireBaseService().addFavoriteMovie(
                                          Provider.of<FirebaseNotifier>(context,
                                                  listen: false)
                                              .userID!,
                                          widget.id);
                                      value.favorite = true;
                                    } else {
                                      // HiveService()
                                      //     .deleteNote(context, value.result);
                                      FireBaseService().deleteFavoriteMovie(
                                          Provider.of<FirebaseNotifier>(context,
                                                  listen: false)
                                              .userID!,
                                          widget.id);
                                      value.favorite = false;
                                    }
                                  },
                                  icon: Icon(Icons.favorite,
                                      size: 40,
                                      color: value.favorite
                                          ? Colors.red
                                          : Provider.of<ThemeNotifier>(context)
                                              .currentTheme
                                              .hintColor)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: context.height / 10,
                      ),
                      Text(value.result.titleText!.text ?? "",
                          style: Provider.of<ThemeNotifier>(context)
                              .currentTheme
                              .textTheme
                              .headlineLarge),
                      SizedBox(
                        height: context.height / 20,
                      ),
                      Text(
                        (value.result.releaseDate?.day != null &&
                                value.result.releaseDate?.month != null)
                            ? "${value.result.releaseDate?.day} - ${value.result.releaseDate?.month} - ${value.result.releaseDate?.year}"
                            : "${value.result.releaseDate?.year}",
                        style: Provider.of<ThemeNotifier>(context)
                            .currentTheme
                            .textTheme
                            .headlineSmall,
                      ),
                      SizedBox(
                        height: context.height / 20,
                      ),
                      Text(
                        value.result.primaryImage?.caption?.plainText! ?? "",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        )
    };
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
      body: Center(child: Text(LocaleKeys.login_error)),
    );
  }

  Widget imageWidget(String url) {
    return Scaffold(
        body: Center(
            child: Container(
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Hero(
          tag: url,
          child: Image.network(url),
        ),
      ),
    )));
  }
}
