import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/API/api_manager.dart';
import 'package:project/providers/state_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../API/Models/graduated/grd_expr_data.dart';
import '../../providers/setting_provider.dart';
import 'content_grd_exp.dart';
import 'exp_item.dart';

class GraduateExperience extends StatefulWidget {
  static const String routeName='graduate_exper';

  @override
  State<GraduateExperience> createState() => _GraduateExperienceState();
}

class _GraduateExperienceState extends State<GraduateExperience> {
@override
List<String>campaniesName=[];
List<String>companiesId=[];
List<String>idName=[];
List<String>id=[];
  void initState() {
    // TODO: implement initState
    super.initState();
    iiiyt();
  }
iiiyt() async{
  final pref=await SharedPreferences.getInstance();
  campaniesName=pref.getStringList('companiesNamew')??[];
  companiesId=pref.getStringList('companiesId')??[];
  var data=await ApiManager.getGrdExperiences();
  for(int j=0;j<data.payload!.length;j++){
         idName.insert(idName.length, campaniesName[companiesId.indexOf(data.payload![j].companyId.toString())]);
      }
    }
@override
late SettingProvider pro;
Widget build(BuildContext context) {
  pro=Provider.of<SettingProvider>(context);
  return  Scaffold(
       floatingActionButton: FloatingActionButton(
         onPressed:(){
           showModalwllw();
         }
         ,child: Icon(Icons.add),
       ),
       body:Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           Expanded(
             child: FutureBuilder<getGrdExp>(
               future: ApiManager.getGrdExperiences(),
               builder: (context, snapShot) {
                 if (snapShot.connectionState == ConnectionState.waiting)
                   return Center(child: CircularProgressIndicator());
                 if (snapShot.hasError)
                   return Center(
                       child: Text(
                         'Some thing went wrong',
                         style: TextStyle(color: Colors.red),
                       ));
                 else {
                   var data = snapShot.data;
                   if (data!.payload!.isNotEmpty) {
                     fn();

                     return ListView.builder(
                         itemCount: snapShot.data!.payload!.length!,
                         itemBuilder:(context,index){
                           print(index);
                           return ExprItem(
                               data.payload![index]!.jobTitle!,
                               data.payload![index]!.startDate!,
                             data.payload![index]!.endDate??'0',
                             idName[index],
                             data.payload![index]!.id!
                           );
                         });

                   }
                   else {
                     return Center(
                       child: Text(
                         'No Experiance Found 😕',
                         style: TextStyle(color: Colors.blue),
                       ),
                     );
                   }
                 }
               },
             ),
           ),
         ],
       )
  );
  }
  fn()async{
    final pref=await SharedPreferences.getInstance();
    campaniesName=pref.getStringList('companiesNamew')??[];
    companiesId=pref.getStringList('companiesId')??[];
    var data=await ApiManager.getGrdExperiences();
    for(int j=0;j<data.payload!.length;j++){
      idName.insert(j, campaniesName[companiesId.indexOf(data.payload![j].companyId.toString())]);
      print(idName[j]);
    }
  }
  showModalwllw(){
    showModalBottomSheet(
        isScrollControlled: true,
        context: context, builder: (context){
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom
            ),
            child: ContentOfGrdEx(),
          );
    });
  }
}

