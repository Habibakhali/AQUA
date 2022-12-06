import 'package:flutter/material.dart';
import 'package:project/student/login&signUp/otp_Email_Sta.dart';

import '../../graduated/signupGr.dart';


class SignUpStudent extends StatelessWidget {
static const String routeName='signup-student';
  @override
  Widget build(BuildContext context) {
    return SignUpGraduated(OtpStudentEmail.routeName);
  }
}
