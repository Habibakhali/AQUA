
import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier{
  String currentLang='en';
  void changeLAnguage(String text){
    if(currentLang==text){
      return ;
    }
    currentLang=text;
    notifyListeners();
  }
}