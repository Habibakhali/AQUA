import 'package:flutter/material.dart';
import 'package:project/doctor/login&signup/otp_doctor.dart';
import 'package:project/doctor/login&signup/signup_doctor.dart';

import '../../graduated/login&signup/graduated_login.dart';
import '../lay_out/home_screen_doctor.dart';

class DoctorLogin extends StatelessWidget {
static const String routeName='Docotr';
  @override
  Widget build(BuildContext context) {
    return GraduatedLogIn(SignUpDoctor.routeName, OtpDoctor.routeName,HomeScreenDoctor.routeName);
  }
}
