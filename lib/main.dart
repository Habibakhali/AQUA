import 'package:flutter/material.dart';
import 'package:project/doctor/exams/doc_exam.dart';
import 'package:project/doctor/lay_out/home_screen_doctor.dart';
import 'package:project/doctor/login&signup/doctor_login.dart';
import 'package:project/doctor/login&signup/otp_doctor.dart';
import 'package:project/doctor/login&signup/otp_email_doctor.dart';
import 'package:project/doctor/setting/setting.dart';
import 'package:project/graduated/Layout/HomeScreen.dart';
import 'package:project/Styling/mytheme.dart';
import 'package:project/Layout/programs.dart';
import 'package:project/providers/setting_provider.dart';
import 'package:project/qa/LayOut/HomeScreenQa.dart';
import 'package:project/qa/login&signUp/signup_Qa.dart';
import 'package:project/student/Courses/SelectedItem.dart';
import 'package:project/student/Courses/questionnair_homeScreen.dart';
import 'package:project/student/Courses/questionner/Form_questionner.dart';
import 'package:project/student/personal%20setting/resetPassWord.dart';
import 'package:project/student/Acadimic%20Register/acadimec%20regsteration.dart';
import 'package:project/graduated/login&signup/create_new_pass_word.dart';
import 'package:project/qa/login&signUp/qa_Login.dart';
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
import 'package:project/student/personal%20setting/table.dart';
import 'package:project/student/personal%20setting/training/training.dart';
import 'package:provider/provider.dart';
import 'Layout/select.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'doctor/login&signup/reset_password_doctor.dart';
import 'doctor/login&signup/signup_doctor.dart';
import 'doctor/office_hours/office_hours.dart';
import 'doctor/setting/personal_setting.dart';
import 'graduated/login&signup/Otp_form.dart';
import 'graduated/login&signup/Otp_form_email.dart';
import 'graduated/login&signup/graduated_login.dart';
import 'graduated/login&signup/signupGr.dart';
import 'graduated/personal setting/profileGrd.dart';
import 'graduated/personal setting/settingProfGrd.dart';

void main() {
  runApp(ChangeNotifierProvider<SettingProvider>(
      create: (buildContext) {
        return SettingProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<SettingProvider>(context);
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
        Training.routName:(_)=>Training(),
          QUestionHome.routeName:(_)=>QUestionHome(),
          SeleCtedITemCoure.routeName:(_)=>SeleCtedITemCoure(),
          TablesStudent.routeName:(_)=>TablesStudent(),
          SettingsPageGrd.routeName:(_)=>SettingsPageGrd(),
          Questionner.routeName:(_)=>Questionner(),
          ProfileGrd.routeName: (_) => ProfileGrd(),
          SettingSt.routeName: (_) => SettingSt(),
          Exam.routeName: (_) => Exam(),
          CourseSelected.routeName: (_) => CourseSelected(),
          FinalPdfViewer.routeName: (_) => FinalPdfViewer(),
          RegistrationForm.routeName: (_) => RegistrationForm(),
          HomeScreenStudent.routeName: (_) => HomeScreenStudent(),
          Programs.routeName: (_) => Programs(),
          AcadimecRegsteration.routeName: (_) => AcadimecRegsteration(),
          Prof.routeName: (_) => Prof(),
          SettingsPageSt.routeName: (_) => SettingsPageSt(),
          ResetPassWord.routeName: (_) => ResetPassWord(),
          HomeScreenGrd.routeName: (_) => HomeScreenGrd(),
          HomeScreenDoctor.routeName: (_) => HomeScreenDoctor(),
          ExamDoc.routeName:(_)=>ExamDoc(),
          SelectionPart.routename: (_) => SelectionPart(),
          GraduatedLogIn.routeName: (_) => GraduatedLogIn(
              SignUpGraduated.routeName,
              OtpFormGraduated.routeName,
              HomeScreenGrd.routeName),
          StudentLogin.routeName: (_) => StudentLogin(),
          DoctorLogin.routeName: (_) => DoctorLogin(),
          QALogin.routeName: (_) => QALogin(),
          HomeScreenQa.routeName:(_)=>HomeScreenQa(),
          SignUpQa.routeName:(_)=>SignUpQa(),
          OtpFormGraduated.routeName: (_) =>
              OtpFormGraduated(PasswordResetGra.routeName),
          OtpStudent.routeName: (_) => OtpStudent(),
          OtpDoctor.routeName: (_) => OtpDoctor(),
          OfficeHours.routeName:(_)=>OfficeHours(),
          SignUpGraduated.routeName: (_) => SignUpGraduated(),
          SignUpStudent.routeName: (_) => SignUpStudent(),
          SignUpDoctor.routeName: (_) => SignUpDoctor(),
          OtpFormEmailGraduated.routeName: (_) =>
              OtpFormEmailGraduated(GraduatedLogIn.routeName),
          OtpStudentEmail.routeName: (_) => OtpStudentEmail(),
          OtpDoctorEmail.routeName: (_) => OtpDoctorEmail(),
          ResetPassStu.routeName: (_) => ResetPassStu(),
          ResetPassDoctor.routeName: (_) => ResetPassDoctor(),
          PasswordResetGra.routeName: (_) =>
              PasswordResetGra(GraduatedLogIn.routeName),
          SettingsPageDoc.routeName:(_)=>SettingsPageDoc(),
          PersonalSetting.routeName:(_)=>PersonalSetting()
        });
  }
}
