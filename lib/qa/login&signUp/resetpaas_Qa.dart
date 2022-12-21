import 'package:flutter/material.dart';
import 'package:project/qa/login&signUp/qa_Login.dart';
import 'package:project/student/login&signUp/student_login.dart';

import '../../graduated/login&signup/create_new_pass_word.dart';

class ResetPassQa extends StatelessWidget {
static const String routeName='resetpassstudent';
  @override
  Widget build(BuildContext context) {
    return PasswordResetGra(QALogin.routeName);
  }
}
