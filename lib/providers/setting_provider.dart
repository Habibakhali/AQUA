
import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier{
  String currentLang='en';
  ThemeMode currTheme=ThemeMode.system;
  bool defultTheme(){
    currTheme=ThemeMode.system;
    notifyListeners();
    if(currTheme==ThemeMode.light)
      return true;

    return false;

  }
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