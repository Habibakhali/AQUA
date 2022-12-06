import 'package:flutter/material.dart';
import 'package:project/graduated/Otp_form.dart';

import 'resetpaas_student.dart';

class OtpStudent extends StatelessWidget {
static const String routeName='otpStudent';
  @override
  Widget build(BuildContext context) {
    return OtpFormGraduated(ResetPassStu.routeName);
  }
}
