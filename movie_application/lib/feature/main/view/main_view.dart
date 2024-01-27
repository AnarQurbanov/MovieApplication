import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_application/core/init/lang/locale_keys.g.dart';
import 'package:movie_application/core/init/notifier/theme_notifier.dart';
import 'package:movie_application/feature/account/view/account_view.dart';
import 'package:movie_application/feature/favorite/view/favorite_view.dart';
import 'package:movie_application/feature/home/view/home_view.dart';
import 'package:movie_application/feature/search/view/search_view.dart';
import 'package:provider/provider.dart';

class MainView extends StatefulWidget {
  final String id;

  const MainView({super.key, required this.id});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      HomeView(),
      SearchView(),
      FavoriteView(),
      AccountView(id: widget.id),
    ];
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Provider.of<ThemeNotifier>(context)
        //     .currentTheme
        //     .bottomNavigationBarTheme
        //     .backgroundColor,
        backgroundColor: Colors.red,
        selectedItemColor: Provider.of<ThemeNotifier>(context)
            .currentTheme
            .bottomNavigationBarTheme
            .selectedItemColor,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: LocaleKeys.main_home_home.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: LocaleKeys.main_search_search.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: LocaleKeys.main_favori_favorite.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: LocaleKeys.main_account_you.tr(),
          ),
        ],
      ),
    );
  }
}
