import 'package:flutter/material.dart';
import 'package:project/student/student_login.dart';
import '../graduated/create_new_pass_word.dart';

class ResetPassStu extends StatelessWidget {
static const String routeName='resetpassstudent';
String gotoRouteName=StudentLogin.routeName;
  @override
  Widget build(BuildContext context) {
    return PasswordResetGra(gotoRouteName);
  }
}
