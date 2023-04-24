import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project/graduated/personal%20setting/profileGrd.dart';

import '../../Styling/icon.dart';
import '../Acadimic RegisterGrd/registration_form.dart';
import '../Graduation_certificate/certificated.dart';
import '../SettingGrd/setting.dart';
import '../personal setting/settingProfGrd.dart';
import '../questionnerGrd/Form_questionner.dart';

class HomeScreenGrd extends StatefulWidget {
static const String routeName="homeScrrenGraduated";

  @override
  State<HomeScreenGrd> createState() => _HomeScreenGrdState();
}

class _HomeScreenGrdState extends State<HomeScreenGrd> {
int index=0;

List<Widget>tabs=[RegistrationFormGrd(),GraduationCertificate(),ProfileGrd()];

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(AppLocalizations.of(context)!.app_title),
      actions: [
        IconButton(
          icon: Icon(
            Icons.more_vert,
          ),
          onPressed: () {
            Navigator.pushNamed(context, SettingsPageGrd.routeName);
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
          BottomNavigationBarItem(icon: Icon(MyFlutterApp.graduation_cap),label: AppLocalizations.of(context)!.garduation_certification),
          BottomNavigationBarItem(icon: Icon(Icons.person,),label: AppLocalizations.of(context)!.edit_profile),
        ],
      ),
    ),
    body: tabs[index],
  );
}
}
