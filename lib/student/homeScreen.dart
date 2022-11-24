import 'package:flutter/material.dart';
import 'package:project/student/acadimec%20regsteration.dart';
import 'package:project/student/courses.dart';
import 'package:project/student/registration_form.dart';
import 'package:project/student/setting.dart';

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
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor:Colors.blue),
        child: BottomNavigationBar(
          onTap: (value){
            index=value;
            setState(() {

            });
          },
          currentIndex: index,
          selectedIconTheme: IconThemeData(
            color: Colors.black,
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.white
          ),
          unselectedLabelStyle: TextStyle(
            color: Colors.white
          ),
          selectedLabelStyle: TextStyle(
            color: Colors.black
          ),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/acadimic_regstration.png'),),label: 'Academic Register'),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/registration_form.png'),),label: 'Registration Form'),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/courses.png'),),label: 'Courses'),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/setting.png'),),label: 'Setting'),
          ],
        ),
      ),
      body: tabs[index],
    );
  }
}
