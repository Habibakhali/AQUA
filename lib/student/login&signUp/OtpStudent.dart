import 'package:flutter/material.dart';

import '../../graduated/login&signup/Otp_form.dart';
import 'resetpaas_student.dart';

class OtpStudent extends StatelessWidget {
static const String routeName='otpStudent';
  @override
  Widget build(BuildContext context) {
    return OtpFormGraduated(ResetPassStu.routeName);
  }
}
