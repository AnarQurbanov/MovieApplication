import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_application/core/service/firebase_auth_service.dart';
import 'package:movie_application/core/service/firebase_service.dart';

part 'signup_view_model.g.dart';

class SignUpViewModel = _SignUpViewModelBase with _$SignUpViewModel;

abstract class _SignUpViewModelBase with Store {
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  @observable
  bool isLockOpen = false;

  @action
  Future<void> signUpService() async {
    if (formState.currentState!.validate()) {
      formState.currentState!.save();
      if (usernameController.text.isEmpty ||
          passwordController.text.isEmpty ||
          emailController.text.isEmpty) {
        throw Exception();
      }

      String uid = await FirebaseAuthService().signUpWithMail(
          emailController.text,
          passwordController.text,
          usernameController.text);
      if (emailController.text.contains("@") &&
          emailController.text.contains(".")) {
        FireBaseService().addUser(
          uid,
          emailController.text,
          passwordController.text,
          usernameController.text,
        );
      } else {
        throw Exception();
      }

      print(
          "********************KULLANICI VERI TABANINA EKLENDI********************");
    }
  }

  bool emailControl(String email) {
    if (email.contains("@") && email.contains(".") && email.isNotEmpty) {
      return true;
    }
    return false;
  }

  bool passwordControl(String password) {
    if (password.length >= 6) {
      return true;
    }
    return false;
  }

  @action
  void isLockStateChange() {
    isLockOpen = !isLockOpen;
  }
}
