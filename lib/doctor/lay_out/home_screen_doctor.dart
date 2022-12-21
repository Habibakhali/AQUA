import 'package:flutter/material.dart';
import 'package:project/doctor/exams/doc_exam.dart';
import 'package:project/doctor/setting/personal_setting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../office_hours/office_hours.dart';
import '../table/table.dart';

class HomeScreenDoctor extends StatefulWidget {
  static const String routeName='homeScreenDoctor';
  @override
  State<HomeScreenDoctor> createState() => _HomeScreenDoctorState();
}

class _HomeScreenDoctorState extends State<HomeScreenDoctor> {
  int index=0;

  @override
  Widget build(BuildContext context) {
    List<Widget>tabs=[ExamDoc(),OfficeHours(),MyTable(),PersonalSetting()];

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

            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/test-cheating.png'),),label: AppLocalizations.of(context)!.exam),
            BottomNavigationBarItem(icon: Icon(Icons.access_time_outlined),label: AppLocalizations.of(context)!.office_hours),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/data_sheet.png'),),label: AppLocalizations.of(context)!.table),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline_sharp),label: AppLocalizations.of(context)!.edit_profile),


          ],
        ),
      ),
      body: tabs[index],
    );
  }
}