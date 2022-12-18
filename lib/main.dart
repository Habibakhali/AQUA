import 'package:flutter/material.dart';
import 'package:project/doctor/doctor_login.dart';
import 'package:project/graduated/Layout/HomeScreen.dart';
import 'package:project/Styling/mytheme.dart';
import 'package:project/Layout/programs.dart';
import 'package:project/providers/setting_provider.dart';
import 'package:project/student/personal%20setting/resetPassWord.dart';
import 'package:project/student/Acadimic%20Register/acadimec%20regsteration.dart';
import 'package:project/graduated/login&signup/create_new_pass_word.dart';
import 'package:project/qa/qa_Login.dart';
import 'package:project/student/Courses/course_selected.dart';
import 'package:project/student/Courses/courses.dart';
import 'package:project/student/Courses/pdf_viewer_final.dart';
import 'package:project/student/Settingst/setting.dart';
import 'package:project/student/layout/homeScreen.dart';
import 'package:project/student/login&signUp/OtpStudent.dart';
import 'package:project/student/login&signUp/resetpaas_student.dart';
import 'package:project/student/login&signUp/signup_student.dart';
import 'package:project/student/login&signUp/student_login.dart';
import 'package:project/student/Courses/exam.dart';
import 'package:project/student/login&signUp/otp_Email_Sta.dart';
import 'package:project/student/Registration%20Form/registration_form.dart';
import 'package:project/student/personal%20setting/prof.dart';
import 'package:project/student/personal%20setting/setting_page.dart';
import 'package:provider/provider.dart';
import 'Layout/select.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'graduated/login&signup/Otp_form.dart';
import 'graduated/login&signup/Otp_form_email.dart';
import 'graduated/login&signup/graduated_login.dart';
import 'graduated/login&signup/signupGr.dart';
import 'graduated/personal setting/profileGrd.dart';


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
          ProfileGrd.routeName:(_)=>ProfileGrd(),
          SettingSt.routeName:(_)=>SettingSt(),
          Exam.routeName:(_)=>Exam(),
          CourseSelected.routeName:(_)=>CourseSelected(),
          FinalPdfViewer.routeName:(_)=>FinalPdfViewer(),
          RegistrationForm.routeName:(_)=>RegistrationForm(),
          HomeScreenStudent.routeName:(_)=>HomeScreenStudent(),
          Programs.routeName:(_)=>Programs(),
          AcadimecRegsteration.routeName:(_)=>AcadimecRegsteration(),
          Prof.routeName:(_)=>Prof(),
          SettingsPageSt.routeName:(_)=>SettingsPageSt(),
          ResetPassWord.routeName:(_)=>  ResetPassWord(),
          HomeScreenGrd.routeName:(_)=>HomeScreenGrd(),
          SelectionPart.routename: (_) => SelectionPart(),
          GraduatedLogIn.routeName: (_) => GraduatedLogIn(SignUpGraduated.routeName,OtpFormGraduated.routeName,HomeScreenGrd.routeName),
          StudentLogin.routeName: (_) => StudentLogin(),
          DoctorLogin.routeName: (_) => DoctorLogin(),
          QALogin.routeName: (_) => QALogin(),
          OtpFormGraduated.routeName:(_)=>OtpFormGraduated(PasswordResetGra.routeName),
          OtpStudent.routeName:(_)=>OtpStudent(),
           SignUpGraduated.routeName: (_) => SignUpGraduated(),
          SignUpStudent.routeName:(_)=>SignUpStudent(),
          OtpFormEmailGraduated.routeName:(_)=>OtpFormEmailGraduated(GraduatedLogIn.routeName),
          OtpStudentEmail.routeName:(_)=>OtpStudentEmail(),
          ResetPassStu.routeName:(_)=>ResetPassStu(),
          PasswordResetGra.routeName:(_) => PasswordResetGra(GraduatedLogIn.routeName)}
    );
  }}