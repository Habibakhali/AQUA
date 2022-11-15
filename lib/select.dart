import 'package:flutter/material.dart';
import 'package:project/assistant/assistant_Login.dart';
import 'package:project/doctor/doctor_login.dart';
import 'package:project/graduated/graduated_login.dart';
import 'package:project/graduated/signup.dart';
import 'package:project/student/student_login.dart';

import 'selection_button.dart';

class SelectionPart extends StatelessWidget {
  static const String routename = 'selection';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.account_box_outlined, color: Colors.white),
              label: Text(
                'About Us',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.call, color: Colors.white),
              label: Text(
                'Contaxt Us',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            'images/Logo.jpg',
          ),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SeleBtn('Graduated',GraduatedLogIn.routeName,SignUpGraduated.routeName)
              ]
          )
        ],
      ),
    );
  }
}
