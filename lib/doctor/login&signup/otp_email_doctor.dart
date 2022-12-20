import 'package:flutter/material.dart';
import 'package:project/doctor/login&signup/doctor_login.dart';

import '../../graduated/login&signup/Otp_form_email.dart';

class OtpDoctorEmail extends StatelessWidget {
  static const String routeName='otpEmailDoctor';
  @override
  Widget build(BuildContext context) {
    return OtpFormEmailGraduated(DoctorLogin.routeName);
  }
}
