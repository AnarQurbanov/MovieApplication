// ignore: depend_on_referenced_packages
import 'package:movie_application/core/init/notifier/firebase_notifier.dart';
import 'package:movie_application/core/init/notifier/hive_notifier.dart';
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/single_child_widget.dart';
import 'theme_notifier.dart';

class ApplicationProvider {
  static ApplicationProvider? _instance;
  static ApplicationProvider? get instance {
    if (_instance == null) _instance = ApplicationProvider._init();
    return _instance;
  }

  ApplicationProvider._init();

  List<SingleChildWidget> singleItems = [];

  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
    ),
    ChangeNotifierProvider(
      create: (context) => HiveNotifier(),
    ),
    ChangeNotifierProvider(
      create: (context) => FirebaseNotifier(),
    ),
  ];

  List<SingleChildWidget> uiChangesItems = [];
}
