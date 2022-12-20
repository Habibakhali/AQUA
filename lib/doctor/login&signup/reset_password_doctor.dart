import 'package:flutter/material.dart';
import 'package:project/doctor/login&signup/doctor_login.dart';
import '../../graduated/login&signup/create_new_pass_word.dart';

class ResetPassDoctor extends StatelessWidget {
  static const String routeName='resetpassdoctor';
  @override
  Widget build(BuildContext context) {
    return PasswordResetGra(DoctorLogin.routeName);
  }
}