import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:movie_application/core/constants/app_constants.dart';
import 'package:movie_application/core/init/lang/language_manager.dart';
import 'package:movie_application/core/init/notifier/provider_list.dart';
import 'package:movie_application/core/init/notifier/theme_notifier.dart';
import 'package:movie_application/feature/_orientation/orientation.dart';
import 'package:movie_application/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences sharedPre = await SharedPreferences.getInstance();
  if (sharedPre.getBool("isDark") == null) {
    sharedPre.setBool("isDark", true);
  }
  ThemeNotifier().themeSettings(sharedPre.getBool("isDark")!);
  print(
      "****************ISDARK ${sharedPre.getBool("isDark")}*******************************");
  //Hive.initFlutter();
  //Hive.registerAdapter(AppThemesAdapter());
  // Hive.registerAdapter(ResultsAdapter());
  // Hive.registerAdapter(PrimaryImageAdapter());
  // Hive.registerAdapter(CaptionAdapter());
  // Hive.registerAdapter(TitleTypeAdapter());
  // Hive.registerAdapter(TitleTextAdapter());
  // Hive.registerAdapter(ReleaseYearAdapter());
  // Hive.registerAdapter(ReleaseDateAdapter());

  runApp(
    MultiProvider(
      providers: [...ApplicationProvider.instance!.dependItems],
      child: EasyLocalization(
        // ignore: sort_child_properties_last
        child: MyApp(isDark: sharedPre.getBool("isDark")!),
        startLocale: LanguageManager.instance.enLocale,
        supportedLocales: LanguageManager.instance.supportedLocales,
        path: ApplicationConstants.LANG_ASSET_PATH,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isDark;
  const MyApp({super.key, required this.isDark});
  @override
  Widget build(BuildContext context) {
    //Provider.of<ThemeNotifier>(context).getTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Movie',
      theme: Provider.of<ThemeNotifier>(context).currentTheme,
      home: const Orientationn(),
    );
  }
}
