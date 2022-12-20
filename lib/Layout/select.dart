import 'package:flutter/material.dart';
import 'package:project/doctor/login&signup/doctor_login.dart';
import 'package:project/Layout/partement.dart';
import 'package:project/providers/setting_provider.dart';
import 'package:project/qa/qa_Login.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../graduated/login&signup/graduated_login.dart';
import '../student/login&signUp/student_login.dart';

class SelectionPart extends StatelessWidget {
  static const String routename = 'selection';

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<SettingProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: Image.asset(
                    pro.currTheme==ThemeMode.light? 'assets/images/blue_logo.png':'assets/images/white_logo.png'),

              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: Row(children: [
                  Expanded(
                      child: Partment(
                          AppLocalizations.of(context)!.student_login,
                          StudentLogin.routeName,
                          'assets/images/student.png')),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: Partment(AppLocalizations.of(context)!.qa_login,
                          QALogin.routeName, 'assets/images/qa.png')),
                ]),
              ),
              SizedBox(
                height: 8,
              ),
              Expanded(
                child: Row(children: [
                  Expanded(
                      child: Partment(
                          AppLocalizations.of(context)!.doctor_login,
                          DoctorLogin.routeName,
                          'assets/images/doctor.png')),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: Partment(
                          AppLocalizations.of(context)!.graduated_login,
                          GraduatedLogIn.routeName,
                          'assets/images/graduat.png')),
                ]),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                      onPressed: ()async{
                        const url='mailto:naglaa_reda@sci.asu.edu.eg';
                        if (await canLaunchUrl(Uri.parse(url))) {
                          await launchUrl(Uri.parse(url));
                        } else {
                          throw 'Could not launch $url';
                        }},
                  child: Text(
                    AppLocalizations.of(context)!.qa,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
