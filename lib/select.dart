import 'package:flutter/material.dart';
import 'package:project/doctor/doctor_login.dart';
import 'package:project/graduated/graduated_login.dart';
import 'package:project/qa/qa_Login.dart';
import 'package:project/student/student_login.dart';

import 'selection_button.dart';

class SelectionPart extends StatelessWidget {
  static const String routename = 'selection';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            'assets/images/Logo.jpg',
          ),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SeleBtn('Student',StudentLogin.routeName),
                SeleBtn('Graduated',GraduatedLogIn.routeName)
              ]
          ),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SeleBtn('Doctor & Assistant',DoctorLogin.routeName),
                SeleBtn('QA',QALogin.routeName)
              ]
          )
        ],
      ),
    );
  }
}
