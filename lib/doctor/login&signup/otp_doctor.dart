import 'package:flutter/material.dart';
import 'package:project/doctor/login&signup/reset_password_doctor.dart';

import '../../graduated/login&signup/Otp_form.dart';

class OtpDoctor extends StatelessWidget {
  static const String routeName='otpdoctor';
  @override
  Widget build(BuildContext context) {
    return OtpFormGraduated(ResetPassDoctor.routeName);
  }
}