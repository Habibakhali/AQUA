import 'package:flutter/material.dart';
import 'package:project/student/login&signUp/student_login.dart';

import '../../graduated/create_new_pass_word.dart';

class ResetPassStu extends StatelessWidget {
static const String routeName='resetpassstudent';
  @override
  Widget build(BuildContext context) {
    return PasswordResetGra(StudentLogin.routeName);
  }
}
