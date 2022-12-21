import 'package:flutter/material.dart';

import '../../graduated/login&signup/Otp_form.dart';
import 'resetpaas_Qa.dart';

class OtpQA extends StatelessWidget {
static const String routeName='otpQa';
  @override
  Widget build(BuildContext context) {
    return OtpFormGraduated(ResetPassQa.routeName);
  }
}
