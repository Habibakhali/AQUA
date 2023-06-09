
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:project/API/api_manager.dart';
import 'package:project/Layout/programs.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../API/Models/Student/GetActivity.dart';
import '../graduated/Layout/HomeScreen.dart';
import '../student/layout/homeScreen.dart';

class SettingProvider extends ChangeNotifier{
  String currentLang='en';
  String currtokenStudent='';
  String emailStudent='';
  String passwordStudent='';
   bool result=false;
   bool selection=false;
  ThemeMode currTheme=ThemeMode.light;
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