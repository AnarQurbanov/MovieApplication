import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_application/core/base/view/base_view.dart';
import 'package:movie_application/core/extension/context_extension.dart';
import 'package:movie_application/core/init/lang/language_manager.dart';
import 'package:movie_application/core/init/lang/locale_keys.g.dart';
import 'package:movie_application/core/init/notifier/theme_notifier.dart';
import 'package:movie_application/core/service/firebase_auth_service.dart';
import 'package:movie_application/core/service/firebase_service.dart';
import 'package:movie_application/core/state/theme_state.dart';
import 'package:movie_application/feature/_model/user_model.dart';
import 'package:movie_application/feature/account/viewmodel/account_view_model.dart';
import 'package:provider/provider.dart';

class AccountView extends StatefulWidget {
  final String id;

  const AccountView({super.key, required this.id});
  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    AppThemes theme = Provider.of<ThemeNotifier>(context).currenThemeEnum;
    Locale locale = context.locale;
    return BaseView<AccountViewModel>(
      viewModel: AccountViewModel(),
      onPageBuilder: (BuildContext contex, AccountViewModel value) {
        // HiveService().fetchTheme(context).then((theme) {
        //   value.theme = theme;
        //   print("*******************${value.theme}***********************");
        // });
        value.theme = theme;
        value.appLocale = locale;
        return FutureBuilder(
          future: FireBaseService().fetchUser(widget.id),
          builder: (contex, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                ),
              );
            } else {
              return Scaffold(
                body: ListView(
                  children: [
                    userHeader(context, value, snapshot),
                    ListTile(
                      leading: Icon(
                        Icons.language,
                        color: Provider.of<ThemeNotifier>(context)
                            .currentTheme
                            .primaryColor,
                      ),
                      title: Text(
                        LocaleKeys.main_account_language.tr(),
                        style: Provider.of<ThemeNotifier>(context)
                            .currentTheme
                            .textTheme
                            .bodyLarge,
                      ),
                      trailing: DropdownButton<Locale>(
                        value: value.appLocale,
                        items: [
                          DropdownMenuItem(
                            value: LanguageManager.instance.trLocale,
                            child: Text(
                              LanguageManager.instance.trLocale.countryCode
                                      ?.toUpperCase() ??
                                  '',
                              style: TextStyle(
                                  color: Provider.of<ThemeNotifier>(context)
                                      .currentTheme
                                      .hintColor),
                            ),
                          ),
                          DropdownMenuItem(
                            value: LanguageManager.instance.enLocale,
                            child: Text(
                              LanguageManager.instance.enLocale.countryCode
                                      ?.toUpperCase() ??
                                  '',
                              style: TextStyle(
                                  color: Provider.of<ThemeNotifier>(context)
                                      .currentTheme
                                      .hintColor),
                            ),
                          ),
                        ],
                        onChanged: (Locale? locale) {
                          value.changeLanguage(context);
                        },
                      ),
                    ),
                    changeThemeData(value, context),
                    logoutMethod(context),
                  ],
                ),
              );
            }
          },
        );
      },
    );
  }

  Container userHeader(BuildContext context, AccountViewModel value,
      AsyncSnapshot<UserModel> snapshot) {
    return Container(
      padding: context.paddingMediumHorizontal,
      height: context.height * 0.3,
      decoration: BoxDecoration(
        color: Provider.of<ThemeNotifier>(context).currentTheme.primaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: context.height / 60,
          ),
          CircleAvatar(
            radius: context.height / 13,
            child: ClipOval(
              child: Image.network(
                value.theme == AppThemes.DARK
                    ? "https://cdn2.vectorstock.com/i/1000x1000/20/61/user-sign-orange-icon-on-black-vector-13392061.jpg"
                    : "https://icones.pro/wp-content/uploads/2022/07/icones-d-administration-orange.png",
              ),
            ),
          ),
          SizedBox(
            height: context.height / 60,
          ),
          Text(
            snapshot.data!.username,
            style: Provider.of<ThemeNotifier>(context)
                .currentTheme
                .textTheme
                .bodyLarge,
          ),
          SizedBox(
            height: context.height / 100,
          ),
          Text(
            snapshot.data!.email,
          ),
        ],
      ),
    );
  }

  InkWell logoutMethod(BuildContext context) {
    return InkWell(
      onTap: () => FirebaseAuthService().signOut(),
      child: ListTile(
        leading: Icon(
          Icons.logout,
          color: Provider.of<ThemeNotifier>(context).currentTheme.primaryColor,
        ),
        title: Text(
          LocaleKeys.main_account_logout.tr(),
          style: Provider.of<ThemeNotifier>(context)
              .currentTheme
              .textTheme
              .bodyLarge,
        ),
      ),
    );
  }

  InkWell changeThemeData(AccountViewModel value, BuildContext context) {
    return InkWell(
      onTap: () {
        value.changeValue(context);
      },
      child: ListTile(
        leading: Icon(
          value.theme != AppThemes.DARK ? Icons.dark_mode : Icons.light_mode,
          color: value.theme != AppThemes.DARK ? Colors.black : Colors.white,
        ),
        title: Text(
          value.theme == AppThemes.DARK
              ? "${LocaleKeys.main_account_light.tr()} ${LocaleKeys.main_account_mode.tr()}"
              : "${LocaleKeys.main_account_dark.tr()} ${LocaleKeys.main_account_mode.tr()}",
          style: Provider.of<ThemeNotifier>(context)
              .currentTheme
              .textTheme
              .bodyLarge,
        ),
      ),
    );
  }
}
