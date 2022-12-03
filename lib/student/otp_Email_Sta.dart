import 'package:flutter/material.dart';
import 'package:project/graduated/Otp_form_email.dart';
import 'package:project/student/student_login.dart';

import 'resetpaas_student.dart';

class OtpStudentEmail extends StatelessWidget {
static const String routeName='otpEmailStudent';
  @override
  Widget build(BuildContext context) {
    return OtpFormEmailGraduated(StudentLogin.routeName);
  }
}
