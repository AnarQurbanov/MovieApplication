import 'package:flutter/material.dart';

class ThemeLight {
  ThemeData get theme => ThemeData.light().copyWith(
      textTheme: myTextTheme,
      primaryColor: Colors.orange,
      cardColor: Color(0xffdbdbdb),
      hintColor: Colors.black,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        backgroundColor: Color(0xffdbdbdb),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.black),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: Color(0xffdbdbdb),
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)));

  TextTheme get myTextTheme => TextTheme().copyWith(
        bodyMedium: TextStyle(color: Colors.black),
        headlineLarge: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
        headlineSmall: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.italic),
      );
}
