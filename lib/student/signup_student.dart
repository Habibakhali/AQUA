import 'package:flutter/material.dart';
import 'package:project/graduated/Otp_form_email.dart';
import 'package:project/student/otp_Email_Sta.dart';
import 'package:project/student/student_login.dart';

import '../graduated/signupGr.dart';

class SignUpStudent extends StatelessWidget {
static const String routeName='signup-student';
  @override
  Widget build(BuildContext context) {
    return SignUpGraduated(OtpStudentEmail.routeName);
  }
}
