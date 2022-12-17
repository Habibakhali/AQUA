import 'package:flutter/material.dart';
import 'package:project/student/Acadimic%20Register/acadimec%20regsteration.dart';
import 'package:project/student/Activity/activity.dart';
import 'package:project/student/Courses/courses.dart';
import 'package:project/student/Registration%20Form/registration_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../graduated/personal setting/profileGrd.dart';
import '../Settingst/setting.dart';
import '../personal setting/setting_page.dart';


class HomeScreenStudent extends StatefulWidget {
  static const String routeName='homeScreenStudent';

  @override
  State<HomeScreenStudent> createState() => _HomeScreenStudentState();
}

class _HomeScreenStudentState extends State<HomeScreenStudent> {
int index=0;
List<Widget>tabs=[AcadimecRegsteration(),RegistrationForm(),Courses(),StudentActivity(),SettingSt()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.app_title),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, ProfileGrd.routeName);
          }, icon:Icon(Icons.person)),
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
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/acadimic_regstration.png'),),label: AppLocalizations.of(context)!.academic_register),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/registration_form.png'),),label: AppLocalizations.of(context)!.registration_form),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/courses.png'),),label: AppLocalizations.of(context)!.courses_title),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/activity.png',),size: 28,),label: AppLocalizations.of(context)!.activity),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/setting.png'),),label: AppLocalizations.of(context)!.setting),
          ],
        ),
      ),
      body: tabs[index],
    );
  }
}
