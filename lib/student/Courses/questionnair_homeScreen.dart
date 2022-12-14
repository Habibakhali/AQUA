import 'package:flutter/material.dart';
import 'package:project/student/Acadimic%20Register/acadimec%20regsteration.dart';
import 'package:project/student/Activity/activity.dart';
import 'package:project/student/Courses/questionner/Form_questionner.dart';
import 'package:project/student/Registration%20Form/registration_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../personal setting/prof.dart';
import '../personal setting/setting_page.dart';


class QUestionHome extends StatefulWidget {
  static const String routeName='QuestionnaorhomeScreen';
  @override
  State<QUestionHome> createState() => _QUestionHomeState();
}

class _QUestionHomeState extends State<QUestionHome> {
  int index=0;

  @override
  Widget build(BuildContext context) {
    List<Widget>tabs=[Questionner(),AcadimecRegsteration(),RegistrationForm(),StudentActivity(),Prof()];

    return Scaffold(
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
            BottomNavigationBarItem(icon: Icon(Icons.question_answer_outlined),label: AppLocalizations.of(context)!.questioner),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/acadimic_regstration.png'),),label: AppLocalizations.of(context)!.academic_register),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/registration_form.png'),),label: AppLocalizations.of(context)!.registration_form),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/activity.png',),size: 28,),label: AppLocalizations.of(context)!.activity),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline_sharp),label: AppLocalizations.of(context)!.edit_profile),
          ],
        ),
      ),
      body: tabs[index],
    );
  }
}
