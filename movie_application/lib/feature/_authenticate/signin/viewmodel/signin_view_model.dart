import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_application/core/service/firebase_auth_service.dart';

part 'signin_view_model.g.dart';

class SignInViewModel = _SignInViewModelBase with _$SignInViewModel;

abstract class _SignInViewModelBase with Store {
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @observable
  bool isLockOpen = false;

  @action
  Future<void> signInService() async {
    if (formState.currentState!.validate()) {
      formState.currentState!.save();

      await FirebaseAuthService()
          .signInWithMail(emailController.text, passwordController.text)
          .then((value) {
        print("********************KULLANICI HESABA GIRDI********************");
      });
    }
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  @action
  void isLockStateChange() {
    isLockOpen = !isLockOpen;
  }
}
