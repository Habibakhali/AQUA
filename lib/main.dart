import 'package:flutter/material.dart';
import 'package:project/assistant/assistant_Login.dart';
import 'package:project/doctor/doctor_login.dart';
import 'package:project/graduated/Otp_form.dart';
import 'package:project/graduated/create_new_pass_word.dart';
import 'package:project/graduated/graduated_login.dart';
import 'package:project/student/student_login.dart';


import 'graduated/signup.dart';
import 'select.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SelectionPart.routename,
      routes: {
        SelectionPart.routename: (_) => SelectionPart(),
        GraduatedLogIn.routeName: (_) => GraduatedLogIn(),
        StudentLogin.routeName: (_) => StudentLogin(),
        DoctorLogin.routeName: (_) => DoctorLogin(),
        AssistantLogin.routeName: (_) => AssistantLogin(),
        SignUp.routeName: (_) => SignUp(),
        otpForm.routeName:(_)=>otpForm(),
    PassWordReset.routeName:(_) => PassWordReset(),
      },
    );
  }
}

