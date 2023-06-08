import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/API/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../API/Models/graduated/grd_expr_data.dart';
import '../companies/company_item.dart';
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
  for(int i=0;i<campaniesName.length;i++){
      if(companiesId[i]==data.payload![i].companyId)
        idName.insert(idName.length, campaniesName[i]);
  }
;}
@override
  Widget build(BuildContext context) {
   return Scaffold(
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
                   Future.delayed(Duration(seconds: 8),(){
                     setState(() {});
                   });
                   return ListView.builder(
                       itemCount: snapShot.data!.payload!.length!,
                       itemBuilder:(context,index){
                         return ExprItem(
                             data.payload![index]!.jobTitle!,
                             data.payload![index]!.startDate!,
                           data.payload![index]!.endDate!,
                            'vodavon',
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
     ));
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

