
import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier{
  String currentLang='en';
  ThemeMode currTheme=ThemeMode.light;
  void changeTheme(ThemeMode newtheme){
    if(currTheme==newtheme){
      return ;
    }
    currTheme=newtheme;
    notifyListeners();
  }

  void changeLAnguage(String text){
    if(currentLang==text){
      return ;
    }
    currentLang=text;
    notifyListeners();
  }
}