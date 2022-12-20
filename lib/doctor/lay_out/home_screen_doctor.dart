import 'package:flutter/material.dart';
import 'package:project/doctor/exams/doc_exam.dart';
import 'package:project/student/Acadimic%20Register/acadimec%20regsteration.dart';
import 'package:project/student/Activity/activity.dart';
import 'package:project/student/Courses/courses.dart';
import 'package:project/student/Registration%20Form/registration_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreenDoctor extends StatefulWidget {
  static const String routeName='homeScreenDoctor';
  @override
  State<HomeScreenDoctor> createState() => _HomeScreenDoctorState();
}

class _HomeScreenDoctorState extends State<HomeScreenDoctor> {
  int index=0;

  @override
  Widget build(BuildContext context) {
    List<Widget>tabs=[ExamDoc(),ExamDoc(),ExamDoc()];

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.app_title),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
            ),
            onPressed: () {
              Navigator.pushNamed(context, HomeScreenDoctor.routeName);
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
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/positive-dynamic.png'),),label: AppLocalizations.of(context)!.data),
            BottomNavigationBarItem(icon: Icon(Icons.access_time_outlined),label: AppLocalizations.of(context)!.office_hours),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/test-cheating.png'),),label: AppLocalizations.of(context)!.exam),
          ],
        ),
      ),
      body: tabs[index],
    );
  }
}