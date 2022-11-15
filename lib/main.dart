import 'package:flutter/material.dart';
import 'package:project/assistant/assistant_Login.dart';
import 'package:project/doctor/doctor_login.dart';
import 'package:project/graduated/Otp_form.dart';
import 'package:project/graduated/create_new_pass_word.dart';
import 'package:project/graduated/graduated_login.dart';
import 'package:project/student/OtpStudent.dart';
import 'package:project/student/resetpaas_student.dart';
import 'package:project/student/signup_student.dart';
import 'package:project/student/student_login.dart';


import 'graduated/signupGr.dart';
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
        GraduatedLogIn.routeName: (_) => GraduatedLogIn(SignUpGraduated.routeName,OtpFormGraduated.routeName),
        StudentLogin.routeName: (_) => StudentLogin(),
        DoctorLogin.routeName: (_) => DoctorLogin(),
        AssistantLogin.routeName: (_) => AssistantLogin(),
        SignUpGraduated.routeName: (_) => SignUpGraduated(GraduatedLogIn.routeName),
        SignUpStudent.routeName:(_)=>SignUpStudent(),
        OtpFormGraduated.routeName:(_)=>OtpFormGraduated(PasswordResetGra.routeName),
        OtpStudent.routeName:(_)=>OtpStudent(),
        ResetPassStu.routeName:(_)=>ResetPassStu(),
        PasswordResetGra.routeName:(_) => PasswordResetGra(GraduatedLogIn.routeName),
      },
    );
  }
}

