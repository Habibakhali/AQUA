import 'package:flutter/material.dart';
import 'package:project/qa/login&signUp/qa_Login.dart';

import 'package:project/student/login&signUp/student_login.dart';

import '../../graduated/login&signup/Otp_form_email.dart';

class OtpQaEmail extends StatelessWidget {
static const String routeName='otpEmailQA';
  @override
  Widget build(BuildContext context) {
    return OtpFormEmailGraduated(QALogin.routeName);
  }
}
