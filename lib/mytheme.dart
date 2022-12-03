import 'package:flutter/material.dart';

class MyTheme{
  static const Color light_primaryColor=Colors.blue;
  static const Color dark_primaryColor=Color.fromRGBO(36, 51, 74, 1.0);
  static const Color dark_background= Color.fromRGBO(9, 25, 51, 1.0);
  static final ThemeData lightMode=ThemeData(
    brightness: Brightness.light,
    primaryColor: light_primaryColor,
    secondaryHeaderColor: Colors.white,
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    canvasColor: Colors.grey,
    textTheme: TextTheme(
      headlineMedium: TextStyle(
          color: Color.fromRGBO(0, 22, 65, 0.7019607843137254),
        fontSize: 14
      ),
      bodySmall: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 0.5)
      ),
      subtitle1: TextStyle( fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
      bodyLarge: TextStyle(color: Colors.black)
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: light_primaryColor,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w200
      )
    ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.white,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: Colors.blue,
      ),
      unselectedIconTheme: IconThemeData(
          color: Colors.grey
      ),

      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
    )
  );
  static final ThemeData darkMode=ThemeData(
    brightness: Brightness.dark,
    canvasColor: Colors.white,
    backgroundColor: dark_background,
    primaryColor: dark_primaryColor,
    secondaryHeaderColor: dark_primaryColor,
      textTheme: TextTheme(
          headlineMedium: TextStyle(
              color: Colors.white,
            fontSize: 14
          ),
          bodySmall: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.5)),
          bodyMedium: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.white),
        subtitle1: TextStyle( fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(dark_primaryColor),
      )
    ),
    scaffoldBackgroundColor: dark_background,
    appBarTheme: AppBarTheme(
      backgroundColor: dark_primaryColor,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w200
      )
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: dark_primaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: Colors.white,
      ),
      unselectedIconTheme: IconThemeData(
          color: Colors.blue
      ),

      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
    )
  );

}