import 'package:flutter/material.dart';
import 'package:project/doctor/doctor_login.dart';
import 'package:project/graduated/Otp_form.dart';
import 'package:project/programs.dart';
import 'package:project/student/acadimec%20regsteration.dart';
import 'package:project/graduated/create_new_pass_word.dart';
import 'package:project/graduated/graduated_login.dart';
import 'package:project/home_page.dart';
import 'package:project/qa/qa_Login.dart';
import 'package:project/student/OtpStudent.dart';
import 'package:project/student/courses.dart';
import 'package:project/student/homeScreen.dart';
import 'package:project/student/registration_form.dart';
import 'package:project/student/resetpaas_student.dart';
import 'package:project/student/setting.dart';
import 'package:project/student/signup_student.dart';
import 'package:project/student/student_login.dart';
import 'graduated/Otp_form_email.dart';
import 'graduated/signupGr.dart';
import 'select.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Programs.routeName,
        routes: {
          Setting.routeName:(_)=>Setting(),
          Courses.routeName:(_)=>Courses(),
          RegistrationForm.routeName:(_)=>RegistrationForm(),
          HomeScreenStudent.routeName:(_)=>HomeScreenStudent(),
          Programs.routeName:(_)=>Programs(),
          AcadimecRegsteration.routeName:(_)=>AcadimecRegsteration(),
        OtpFormEmailGraduated.routeName:(_)=>OtpFormEmailGraduated(GraduatedLogIn.routeName),
        SelectionPart.routename: (_) => SelectionPart(),
        GraduatedLogIn.routeName: (_) => GraduatedLogIn(SignUpGraduated.routeName,OtpFormGraduated.routeName,'Not published Now'),
        StudentLogin.routeName: (_) => StudentLogin(),
        DoctorLogin.routeName: (_) => DoctorLogin(),
        SignUpGraduated.routeName: (_) => SignUpGraduated(GraduatedLogIn.routeName),
        QALogin.routeName: (_) => QALogin(),
        SignUpGraduated.routeName: (_) => SignUpGraduated(OtpFormEmailGraduated.routeName),
        SignUpStudent.routeName:(_)=>SignUpStudent(),
        OtpFormGraduated.routeName:(_)=>OtpFormGraduated(PasswordResetGra.routeName),
        OtpStudent.routeName:(_)=>OtpStudent(),
        ResetPassStu.routeName:(_)=>ResetPassStu(),
        PasswordResetGra.routeName:(_) => PasswordResetGra(GraduatedLogIn.routeName),}
    );
}}
