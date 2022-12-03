import 'package:flutter/material.dart';
import 'package:project/doctor/doctor_login.dart';
import 'package:project/graduated/Otp_form.dart';
import 'package:project/mytheme.dart';
import 'package:project/programs.dart';
import 'package:project/providers/setting_provider.dart';
import 'package:project/student/acadimec%20regsteration.dart';
import 'package:project/graduated/create_new_pass_word.dart';
import 'package:project/graduated/graduated_login.dart';
import 'package:project/qa/qa_Login.dart';
import 'package:project/student/OtpStudent.dart';
import 'package:project/student/courses.dart';
import 'package:project/student/homeScreen.dart';
import 'package:project/student/parallel.dart';
import 'package:project/student/otp_Email_Sta.dart';
import 'package:project/student/registration_form.dart';
import 'package:project/student/resetpaas_student.dart';
import 'package:project/student/setting.dart';
import 'package:project/student/signup_student.dart';
import 'package:project/student/student_login.dart';
import 'package:provider/provider.dart';
import 'graduated/Otp_form_email.dart';
import 'graduated/signupGr.dart';
import 'select.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main(){
  runApp(ChangeNotifierProvider<SettingProvider>(
      create:(buildContext){
        return SettingProvider();
      } ,
      child: MyApp()));
}
class MyApp extends StatelessWidget {

  @override  Widget build(BuildContext context) {
     var pro=Provider.of<SettingProvider>(context);
    return MaterialApp(
      theme: MyTheme.lightMode,
        darkTheme: MyTheme.darkMode,
        themeMode: pro.currTheme,
        debugShowCheckedModeBanner: false,
          localizationsDelegates: [
         AppLocalizations.delegate, // Add this line
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', ''), // English, no country code
          Locale('ar', ''), // Spanish, no country code
        ],
        locale: Locale(pro.currentLang),
        initialRoute: Programs.routeName,
        routes: {
          Setting.routeName:(_)=>Setting(),
          Courses.routeName:(_)=>Courses(),
          Parallel.routeName:(_)=>Parallel(),
          RegistrationForm.routeName:(_)=>RegistrationForm(),
          HomeScreenStudent.routeName:(_)=>HomeScreenStudent(),
          Programs.routeName:(_)=>Programs(),
          AcadimecRegsteration.routeName:(_)=>AcadimecRegsteration(),
          OtpFormEmailGraduated.routeName:(_)=>OtpFormEmailGraduated(GraduatedLogIn.routeName),
          SelectionPart.routename: (_) => SelectionPart(),
          GraduatedLogIn.routeName: (_) => GraduatedLogIn(SignUpGraduated.routeName,OtpFormGraduated.routeName,'Not published Now'),
          StudentLogin.routeName: (_) => StudentLogin(),
          DoctorLogin.routeName: (_) => DoctorLogin(),
          QALogin.routeName: (_) => QALogin(),
          SignUpGraduated.routeName: (_) => SignUpGraduated(OtpFormEmailGraduated.routeName),
          SignUpStudent.routeName:(_)=>SignUpStudent(),
          OtpFormGraduated.routeName:(_)=>OtpFormGraduated(PasswordResetGra.routeName),
          OtpStudent.routeName:(_)=>OtpStudent(),
          OtpStudentEmail.routeName:(_)=>OtpStudentEmail(),
          ResetPassStu.routeName:(_)=>ResetPassStu(),
          PasswordResetGra.routeName:(_) => PasswordResetGra(GraduatedLogIn.routeName),}
    );
  }}