import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project/Layout/partement.dart';
import 'package:project/student/Courses/courses.dart';
import 'package:project/student/Courses/exam.dart';
import 'package:project/student/Courses/questionner/Form_questionner.dart';
import '../personal setting/prof.dart';



class CourseSelected extends StatelessWidget {
static const String routeName='rouey';
static bool visited=true;

  @override
  Widget build(BuildContext context) {
    var arg=ModalRoute.of(context)!.settings.arguments as CourseArg;
    return  Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 10,),
              Text(AppLocalizations.of(context)!.subject,textAlign: TextAlign.center,style: Theme.of(context).textTheme.headlineLarge,),
              SizedBox(height: 20,),
              Expanded( child:
          GridView.builder(
          itemCount: arg.s.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  crossAxisCount: 2,
                  childAspectRatio: 1/1.15
              ),
              itemBuilder: (context, index) {
                return ElevatedButton(
                  onPressed: () {
                    showDialog(context: context, builder: (context)=>SimpleDialog(
                      title: Column(
                        children: [
                          Text(AppLocalizations.of(context)!.select,),
                          Divider(
                            thickness: 1,
                          )
                        ],
                      ),
                      contentPadding: EdgeInsets.only(left: 20,right: 20,bottom: 20,top:5),
                      backgroundColor: Theme.of(context).secondaryHeaderColor,
                      children: [
                        InkWell(
                            child: Row(
                              children: [
                                Text(AppLocalizations.of(context)!.exam),
                              ],
                            ),
                            onTap: (){
                             Navigator.pushReplacementNamed(context, Exam.routeName,);

                            }),
                        SizedBox(height: 8,),
                        InkWell(
                            child: Row(
                              children: [
                                Text(AppLocalizations.of(context)!.questioner),
                              ],
                            ),
                            onTap: (){
                              Navigator.pushReplacementNamed(context, Questionner.routeName,);
                            }),
                      ],
                    ));
                  }, child: Column(
                  children: [
                    Expanded( flex:2,child: Image.asset('assets/images/ocourse.png')),
                    Expanded(child: Text(arg.s[index], textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white)
                      ,)),
                  ],
                ),
                );
              }),),
            ],
          )
          ,),
      ),
    );
  }
}
