import 'package:flutter/material.dart';
import 'package:project/student/layout/homeScreen.dart';
import 'package:project/student/login&signUp/signup_student.dart';

import '../../graduated/login&signup/graduated_login.dart';
import 'OtpStudent.dart';


class StudentLogin extends StatelessWidget {
static const String routeName='Student_login';

  @override
  Widget build(BuildContext context) {
    return GraduatedLogIn(SignUpStudent.routeName, OtpStudent.routeName,HomeScreenStudent.routeName);
  }
}
