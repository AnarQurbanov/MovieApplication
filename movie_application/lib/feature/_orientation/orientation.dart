import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_application/core/init/notifier/firebase_notifier.dart';
import 'package:movie_application/core/service/firebase_auth_service.dart';
import 'package:movie_application/feature/_authenticate/signup/view/signup_view.dart';
import 'package:movie_application/feature/main/view/main_view.dart';
import 'package:provider/provider.dart';

class Orientationn extends StatelessWidget {
  const Orientationn({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuthService().authState,
      builder: (context, snapshot) {
        //FirebaseAuthService().signOut();
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            print(
                "*****************************MAIN VIEW CALISIYOR************************");
            Provider.of<FirebaseNotifier>(context).userID = snapshot.data!.uid;
            return MainView(
              id: snapshot.data!.uid,
            );
          } else {
            print(
                "*****************************LOGIN VIEW CALISIYOR************************");
            return SignUpView();
          }
        } else {
          return SignUpView();
        }
      },
    );
  }
}
