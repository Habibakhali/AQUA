import 'package:flutter/material.dart';
import 'package:project/student/OtpStudent.dart';
import 'package:project/student/signup_student.dart';

import '../graduated/graduated_login.dart';

class StudentLogin extends StatelessWidget {
static const String routeName='Student_login';
  @override
  Widget build(BuildContext context) {
    return GraduatedLogIn(SignUpStudent.routeName, OtpStudent.routeName);
  }
}
