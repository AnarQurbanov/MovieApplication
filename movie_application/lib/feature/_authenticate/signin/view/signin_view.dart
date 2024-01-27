import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_application/core/base/view/base_view.dart';
import 'package:movie_application/core/extension/context_extension.dart';
import 'package:movie_application/core/init/lang/locale_keys.g.dart';
import 'package:movie_application/core/init/notifier/theme_notifier.dart';
import 'package:movie_application/feature/_authenticate/signup/view/signup_view.dart';
import 'package:movie_application/feature/_authenticate/signin/viewmodel/signin_view_model.dart';
import 'package:provider/provider.dart';

class SignInView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<SignInViewModel>(
      viewModel: SignInViewModel(),
      onPageBuilder: (BuildContext context, SignInViewModel value) =>
          DefaultTabController(
        length: 2,
        child: Scaffold(
          key: value.scaffoldState,
          body: SafeArea(
            //Ekranin esit olarak uste kaymasi icin
            child: ListView(
              children: [
                buildContainer(context),
                Padding(
                    padding: context.paddingNormal,
                    child: buildForm(value, context)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildContainer(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
          color: Provider.of<ThemeNotifier>(context).currentTheme.primaryColor),
      //duration: context.lowDuration,
      height: context.mediaQuery.viewInsets.bottom > 0
          ? 0
          : context.height * 0.3, //Klavye acilmistir
      child: Center(
        child: FlutterLogo(
          size: context.height * 0.15,
        ),
      ),
    );
  }
}

Form buildForm(SignInViewModel value, BuildContext context) {
  return Form(
    key: value.formState,
    autovalidateMode: AutovalidateMode.always,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: context.height / 15,
        ),
        buildTextFormFieldEmail(context, value),
        SizedBox(
          height: context.mediumValue,
        ),
        buildTextFormFieldPassword(context, value),
        SizedBox(
          height: context.height / 20,
        ),
        buildRaisedButtonSignIn(context, value),
        signInFunction(context),
      ],
    ),
  );
}

Center signInFunction(BuildContext context) {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(LocaleKeys.login_haveAccount.tr()),
        TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpView(),
                  ));
            },
            child: Text(LocaleKeys.login_signup.tr())),
      ],
    ),
  );
}

Widget buildTextFormFieldPassword(
    BuildContext context, SignInViewModel viewModel) {
  return Observer(
    builder: (_) {
      return TextFormField(
        style: TextStyle(
            color: Provider.of<ThemeNotifier>(context).currentTheme.hintColor),
        controller: viewModel.passwordController,
        obscureText: viewModel.isLockOpen,
        decoration: InputDecoration(
          filled: true,
          hintText: LocaleKeys.login_enterPassword.tr(),
          hintStyle: TextStyle(
              color:
                  Provider.of<ThemeNotifier>(context).currentTheme.hintColor),
          labelStyle: context.textTheme.subtitle1,
          suffixIcon: IconButton(
            onPressed: () {
              viewModel.isLockStateChange();
            },
            padding: EdgeInsets.zero,
            icon: Observer(
              builder: (_) {
                return Icon(viewModel.isLockOpen
                    ? Icons.visibility_off
                    : Icons.visibility);
              },
            ),
          ),
        ),
      );
    },
  );
}

Widget buildTextFormFieldEmail(
    BuildContext context, SignInViewModel viewModel) {
  return Observer(
    builder: (_) {
      return TextFormField(
        style: TextStyle(
            color: Provider.of<ThemeNotifier>(context).currentTheme.hintColor),
        controller: viewModel.emailController,
        decoration: InputDecoration(
          filled: true,
          hintText: LocaleKeys.login_enterEmail.tr(),
        ),
      );
    },
  );
}

Widget buildRaisedButtonSignIn(
    BuildContext context, SignInViewModel viewModel) {
  return Observer(
    builder: (_) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: context.paddingNormal,
          shape: const StadiumBorder(),
          backgroundColor:
              Provider.of<ThemeNotifier>(context).currentTheme.primaryColor,
        ),
        onPressed: () async {
          try {
            print(
                "************************ GIRIS BASLADI *************************");
            await viewModel.signInService();
            Navigator.pop(context);
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor:
                  Provider.of<ThemeNotifier>(context, listen: false)
                      .currentTheme
                      .primaryColor,
              content: Text(
                LocaleKeys.login_error.tr(),
                style: Provider.of<ThemeNotifier>(context, listen: false)
                    .currentTheme
                    .textTheme
                    .bodyLarge!
                    .copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ));
            print(e.toString());
          }
        },
        child: Center(
          child: Text(
            LocaleKeys.login_tab1.tr(),
            style: Provider.of<ThemeNotifier>(context)
                .currentTheme
                .textTheme
                .bodyLarge,
          ),
        ),
      );
    },
  );
}
