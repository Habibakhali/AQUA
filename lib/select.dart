import 'package:flutter/material.dart';
import 'package:project/doctor/doctor_login.dart';
import 'package:project/graduated/graduated_login.dart';
import 'package:project/partement.dart';
import 'package:project/qa/qa_Login.dart';
import 'package:project/student/student_login.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SelectionPart extends StatelessWidget {
  static const String routename = 'selection';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Expanded(
                child: Image.asset(
                  'assets/images/logo_blue.png',
                ),
              ),
              SizedBox(height: 30,)
              , Expanded(
                child: Row(
                    children: [
                      Expanded(child: Partment(
                          AppLocalizations.of(context)!.student_login,
                          StudentLogin.routeName, 'assets/images/student.png')),
                      SizedBox(width: 8,),
                      Expanded(child: Partment(
                          AppLocalizations.of(context)!.qa_login,
                          QALogin.routeName, 'assets/images/qa.png')),
                    ]
                ),
              ),
              SizedBox(height: 8,),
              Expanded(
                child: Row(

                    children: [
                      Expanded(child: Partment(
                          AppLocalizations.of(context)!.doctor_login,
                          DoctorLogin.routeName, 'assets/images/doctor.png')),
                      SizedBox(width: 8,),
                      Expanded(child: Partment(
                          AppLocalizations.of(context)!.graduated_login,
                          GraduatedLogIn.routeName,
                          'assets/images/graduat.png')),
                    ]
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(onPressed: () {}, child: Text(
                  AppLocalizations.of(context)!.qa,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 22, 65, 0.7019607843137254)),
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}