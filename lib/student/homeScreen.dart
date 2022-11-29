import 'package:flutter/material.dart';
import 'package:project/student/acadimec%20regsteration.dart';
import 'package:project/student/courses.dart';
import 'package:project/student/registration_form.dart';
import 'package:project/student/setting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeScreenStudent extends StatefulWidget {
  static const String routeName='homeScreenStudent';

  @override
  State<HomeScreenStudent> createState() => _HomeScreenStudentState();
}

class _HomeScreenStudentState extends State<HomeScreenStudent> {
int index=0;

List<Widget>tabs=[AcadimecRegsteration(),RegistrationForm(),Courses(),Setting()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.app_title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value){
          index=value;
          setState(() {

          });
        },
        currentIndex: index,
        selectedIconTheme: IconThemeData(
          color: Colors.blue,
        ),
        unselectedIconTheme: IconThemeData(
          color: Colors.grey
        ),

        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/acadimic_regstration.png'),),label: AppLocalizations.of(context)!.academic_register),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/registration_form.png'),),label: AppLocalizations.of(context)!.registration_form),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/courses.png'),),label: AppLocalizations.of(context)!.courses_title),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/setting.png'),),label: AppLocalizations.of(context)!.setting),
        ],
      ),
      body: tabs[index],
    );
  }
}
