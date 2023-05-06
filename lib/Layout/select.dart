import 'package:flutter/material.dart';
import 'package:project/doctor/login&signup/doctor_login.dart';
import 'package:project/Layout/partement.dart';
import 'package:project/providers/setting_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../graduated/login&signup/graduated_login.dart';
import '../student/login&signUp/student_login.dart';

class SelectionPart extends StatelessWidget {
  static const String routename = 'selection';

  @override
  Widget build(BuildContext context) {
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
                child:
                  Image.asset(Theme.of(context).brightness == Brightness.light?'assets/images/blue_logo.png'
                      : "assets/images/white_logo.png"),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: Row(children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                              Navigator.pushReplacementNamed(context, StudentLogin.routeName);
                          },
                          child: Column(
                            children: [
                              Expanded(flex:2,child: Image.asset('assets/images/student.png',)),
                              Expanded(child: Text(AppLocalizations.of(context)!.student_login,textAlign: TextAlign.center
                                ,)),
                            ],
                          ))),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                              Navigator.pushReplacementNamed(context, GraduatedLogIn.routeName);
                          },
                          child: Column(
                            children: [
                              Expanded(flex:2,child: Image.asset('assets/images/graduat.png',)),
                              Expanded(child: Text(AppLocalizations.of(context)!.graduated_login,textAlign: TextAlign.center
                                ,)),
                            ],
                          ))
                  ),
                ]),
              ),
              SizedBox(
                height: 8,
              ),
              Spacer(),
              TextButton(
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
            ],
          ),
        ),
      ),
    );
  }
}
