import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project/Layout/partement.dart';
import 'package:project/student/Courses/courses.dart';
import 'package:project/student/Courses/parallel.dart';
import '../personal setting/prof.dart';



class CourseSelected extends StatelessWidget {
static const String routeName='rouey';
  @override
  Widget build(BuildContext context) {
    List<String> coursesRoutes = [
      Parallel.routeName,
      Parallel.routeName,
      Parallel.routeName,
      Parallel.routeName,
      Parallel.routeName,
    ];
    var arg=ModalRoute.of(context)!.settings.arguments as CourseArg;
    return Scaffold(
        appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.app_title),
    actions: [
    IconButton(onPressed: (){
    Navigator.pushNamed(context, Prof.routeName);
    }, icon:Icon(Icons.person)),
    ],
    ),
    body: Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 10,),
          Text('Your Subject',textAlign: TextAlign.center,style: Theme.of(context).textTheme.headlineLarge,),
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
            return Partment(arg.s[index],coursesRoutes[index],'assets/images/ocourse.png');
          }),),
        ],
      ),
    )
      ,);
  }
}
