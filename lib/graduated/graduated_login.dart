import 'package:flutter/material.dart';
import 'package:project/graduated/Otp_form.dart';
import 'package:project/selection_button.dart';
import 'package:project/type_of_textfeild/password_textfield.dart';

import '../type_of_textfeild/text_field.dart';

class GraduatedLogIn extends StatelessWidget {
  static const String routeName = 'Login_Gradutated';
  String signUpRouteName;
  String otpformGraduated;
  GraduatedLogIn(this.signUpRouteName,this.otpformGraduated);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Image.asset(
                'assets/images/Logo.jpg',
              ),
              TextFeilf(
                  'Enter your Email', 'Email', TextInputType.emailAddress,Icon(Icons.email_outlined)),
              SizedBox(height: 20,),
              PasswordTextField('Password', 'Enter your Password',''),
             Container(width:200,child: SeleBtn('Login', '')),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, otpformGraduated);
                  },
                  child: Text(
                    'Forget My Password?',
                    style: TextStyle(color: Colors.black),

                  )),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, signUpRouteName);
                },
                child: Text('Create New Account'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
