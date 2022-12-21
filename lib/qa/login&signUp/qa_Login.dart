import 'package:flutter/material.dart';
import 'package:project/qa/login&signUp/signup_Qa.dart';
import 'package:project/student/layout/homeScreen.dart';
import 'package:project/student/login&signUp/signup_student.dart';

import '../../graduated/login&signup/graduated_login.dart';
import '../LayOut/HomeScreenQa.dart';
import 'OtpQa.dart';


class QALogin extends StatelessWidget {
  static const String routeName='loginqa';

  @override
  Widget build(BuildContext context) {
    return GraduatedLogIn(SignUpQa.routeName, OtpQA.routeName,HomeScreenQa.routeName);
  }
}
