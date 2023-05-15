import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project/Layout/partement.dart';
import 'package:project/student/Courses/courses.dart';
import 'package:project/student/Courses/exam.dart';
import 'package:project/student/Courses/questionner/Form_questionner.dart';
import '../Acadimic Register/acadimec regsteration.dart';
import '../Activity/activity.dart';
import '../Registration Form/registration_form.dart';
import '../personal setting/prof.dart';
import '../personal setting/setting_page.dart';
import '../personal setting/training/training.dart';
import 'SelectedItem.dart';



class CourseSelected extends StatefulWidget {
static const String routeName='rouey';
static bool visited=true;
List<Widget>tabs=[SeleCtedITemCoure(),AcadimecRegsteration(),RegistrationForm(),Training()];


  @override
  State<CourseSelected> createState() => _CourseSelectedState();
}

class _CourseSelectedState extends State<CourseSelected> {
  int index=0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.app_title),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
            ),
            onPressed: () {
              Navigator.pushNamed(context, SettingsPageSt.routeName);
            },
          ),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Theme.of(context).secondaryHeaderColor),
        child: BottomNavigationBar(
          onTap: (value){
            index=value;
            setState(() {

            });
          },
          currentIndex: index,
          items: [
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/courses.png'),),label: AppLocalizations.of(context)!.courses_title),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/acadimic_regstration.png'),),label: AppLocalizations.of(context)!.academic_register),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/registration_form.png'),),label: AppLocalizations.of(context)!.registration_form),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/activity.png',),size: 28,),label: AppLocalizations.of(context)!.activity),
          ],
        ),
      ),
   body:widget.tabs[index]
      )
    ;
  }

}
