
import 'package:flutter/material.dart';

class StateProvider extends ChangeNotifier{
  UpdateCompaniesState(){
      notifyListeners();
  }
  checkUpdateActivity( String activityState){
    if(activityState =='del'||activityState=='up'||activityState=='post')
      notifyListeners();
  }
}