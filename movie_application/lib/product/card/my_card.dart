import 'package:flutter/material.dart';
import 'package:movie_application/core/extension/context_extension.dart';
import 'package:movie_application/core/init/notifier/theme_notifier.dart';
import 'package:provider/provider.dart';

class MyCard extends StatelessWidget {
  final String id;
  final String movieName;
  final String year;
  final String imageUrl;
  final Function(bool) function;
  const MyCard({
    super.key,
    required this.id,
    required this.movieName,
    required this.year,
    required this.imageUrl,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        // onTap: () {
        //   Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => MovieView(id: id),
        //   ));
        // },
        onTap: () async {
          return await function.call(true);
        },
        child: Padding(
          padding: context.paddingLow,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  width: 2.5,
                  color: Provider.of<ThemeNotifier>(context)
                      .currentTheme
                      .primaryColor),
              borderRadius: BorderRadius.circular(10),
              color: Provider.of<ThemeNotifier>(context).currentTheme.cardColor,
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 7,
                  child: Image.network(
                    imageUrl,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.network(
                        "https://t4.ftcdn.net/jpg/02/51/95/53/360_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      );
                    },
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Spacer(flex: 1),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      movieName.length <= 20
                          ? movieName
                          : movieName.substring(0, 15) + "...",
                      style: Provider.of<ThemeNotifier>(context)
                          .currentTheme
                          .textTheme
                          .bodyLarge,
                    ),
                  ),
                ),
                Spacer(flex: 1),
                Expanded(
                  flex: 1,
                  child: Text(year),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
