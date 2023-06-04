import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project/graduated/personal%20setting/details.dart';

import '../../Styling/icon.dart';
import '../Acadimic RegisterGrd/registration_form.dart';
import '../SettingGrd/setting.dart';
import '../companies/companies.dart';
import '../personal setting/settingProfGrd.dart';
import '../questionnerGrd/Form_questionner.dart';

class HomeScreenGrd extends StatefulWidget {
static const String routeName="homeScrrenGraduated";

  @override
  State<HomeScreenGrd> createState() => _HomeScreenGrdState();
}

class _HomeScreenGrdState extends State<HomeScreenGrd> {
int index=0;

List<Widget>tabs=[GraduationCertificate(),ProfileGrd()];

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

          BottomNavigationBarItem(icon: Icon(Icons.business),label: 'Companies'),
          BottomNavigationBarItem(icon: Icon(Icons.person,),label: 'Edit details'),
        ],
      ),
    ),
    body: tabs[index],
  );
}
}
