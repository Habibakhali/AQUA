import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/API/api_manager.dart';

class GraduateExperience extends StatefulWidget {
  static const String routeName='graduate_exper';

  @override
  State<GraduateExperience> createState() => _GraduateExperienceState();
}

class _GraduateExperienceState extends State<GraduateExperience> {
  TextEditingController jobTitle=TextEditingController();
  TextEditingController startDate=TextEditingController();
  TextEditingController endDate=TextEditingController();
  TextEditingController companyId=TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(

       padding: EdgeInsets.only(left: 16, top: 25, right: 16),
       child:
       Form(
         key: formKey,
         child: ListView(
           children: [
             Row(
               children: [

                 Text(
                  "Your experience in company",
                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                 ),
               ],
             ),
             Divider(
               height: 15,
               thickness: 2,
             ),
             SizedBox(
               height: 10,
             ),
             Container(
               margin: EdgeInsets.symmetric(horizontal: 20),
               child:  Column(
                 children: [
                   TextFormField(
                     decoration: InputDecoration(
                         hintText: "job_title"
                     ),
                     validator: (value) {
                       if(value == null || value.trim().isEmpty) {
                         return 'please enter job title';
                       }
                       return null;
                     },
                     controller: jobTitle,

                   ),
                   SizedBox(
                     height: 20,
                   ),
                   TextFormField(
                     decoration: InputDecoration(
                         hintText: "Start date"
                     ),
                     validator: (value) {
                       if(value == null || value.trim().isEmpty) {
                         return 'please enter Start date';
                       }
                       return null;
                     },
                     controller: startDate,

                   ),
                   SizedBox(
                     height: 20,
                   ),
                   TextFormField(
                     decoration: InputDecoration(
                         hintText: "End Date"
                     ),
                     validator: (value) {
                       return null;
                     },
                     controller: endDate,

                   ),
                   SizedBox(
                     height: 20,
                   ),

             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 ElevatedButton(
                   style: ButtonStyle(
                     backgroundColor: MaterialStateProperty.all(Colors.white),
                     elevation: MaterialStateProperty.all(1),
                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                       RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(18.0),
                       ),
                     ),
                   ),
                   onPressed: () {
                   },
                   child: Text('Delete',
                       style: TextStyle(
                           fontSize: 14,
                           letterSpacing: 2.2,
                           color: Colors.blue)),
                 ),
                 ElevatedButton(
                     style: ButtonStyle(
                         backgroundColor: MaterialStateProperty.all(Colors.blue),
                         elevation: MaterialStateProperty.all(1),
                         shape:
                         MaterialStateProperty.all<RoundedRectangleBorder>(
                             RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(18.0),
                             ))),
                     onPressed: () {
                       storeData();
                     },
                     child: Text("save",
                         style: TextStyle(
                             fontSize: 14,
                             letterSpacing: 2.2,
                             color: Colors.white))),
                 ],
               ),]

             ),

       ),
           ],
         ),

     ),
   ));
  }
  void storeData()async{

    }
}

