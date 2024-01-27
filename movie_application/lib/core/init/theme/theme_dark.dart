import 'package:flutter/material.dart';

class ThemeDark {
  ThemeData get theme => ThemeData.dark().copyWith(
      primaryColor: Colors.orange,
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(selectedItemColor: Colors.orange),
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
      ),
      cardColor: Color(0xff919191),
      hintColor: Colors.white,
      textTheme: myTextTheme,
      iconTheme: IconThemeData(color: Colors.orange),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(0xff919191),
      ));

  TextTheme get myTextTheme => TextTheme().copyWith(
      headlineLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
      headlineSmall: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.italic));
}
