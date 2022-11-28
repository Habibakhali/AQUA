import 'package:flutter/material.dart';
import 'package:project/doctor/doctor_login.dart';
import 'package:project/graduated/graduated_login.dart';
import 'package:project/partement.dart';
import 'package:project/qa/qa_Login.dart';
import 'package:project/student/student_login.dart';

class SelectionPart extends StatelessWidget {
  static const String routename = 'selection';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Expanded(
                child: Image.asset(
                  'assets/images/logo_blue.png',
                ),
              ),
              SizedBox(height: 30,)
              ,Expanded(
                child: Row(
                    children: [
                      Expanded(child: Partment('Student',StudentLogin.routeName,'assets/images/student.png')),
                      SizedBox(width: 8,),
                      Expanded(child: Partment('Quality Assurance',QALogin.routeName,'assets/images/qa.png')),
                    ]
                ),
              ),
              SizedBox(height: 8,),
              Expanded(
                child: Row(

                    children: [
                      Expanded(child: Partment('Doctor & Assistant',DoctorLogin.routeName,'assets/images/doctor.png')),
                      SizedBox(width: 8,),
                      Expanded(child: Partment('Graduated',GraduatedLogIn.routeName,'assets/images/graduat.png')),
                    ]
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(onPressed: (){}, child:  Text(
                  'Quality assurance Unit\nAin Shams University',
                  style: TextStyle(
                      color: Color.fromRGBO(0, 22, 65, 0.7019607843137254)),
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
