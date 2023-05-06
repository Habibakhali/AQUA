
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class SettingProvider extends ChangeNotifier{
  String currentLang='en';
  String currtokenStudent='';
  String emailStudent='';
  String passwordStudent='';
   bool result=false;
   bool selection=false;
  ThemeMode currTheme=ThemeMode.system;
  bool changeSelectedCourses(bool click){
    selection=!selection;
    notifyListeners();
    return selection;
  }
  void ConnectionState()async{
   var r=await InternetConnectionChecker().hasConnection;
   result =r;
   notifyListeners();
  }
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