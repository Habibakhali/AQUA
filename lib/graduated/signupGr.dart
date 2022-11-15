import 'package:flutter/material.dart';
import 'package:project/icon.dart';
import 'package:project/selection_button.dart';
import 'package:project/type_of_textfeild/password_textfield.dart';
import 'package:project/type_of_textfeild/text_field.dart';


class SignUpGraduated extends StatefulWidget {
  static const String routeName = 'signup';
  String routeverfi;
  SignUpGraduated(this.routeverfi);

  @override
  State<SignUpGraduated> createState() => _SignUpGraduatedState();
}

class _SignUpGraduatedState extends State<SignUpGraduated> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                TextFeilf('Enter Your name', 'User name', TextInputType.name,Icon(Icons.person)),
                TextFeilf('Enter Your Email', 'University Email',
                    TextInputType.emailAddress,Icon(Icons.email_outlined)),
                TextFeilf('Enter Your Phone Number', 'Phone Number',
                    TextInputType.number,Icon(Icons.phone)),
               TextFeilf('Enter your National ID', 'National ID', TextInputType.number, Icon(Icons.perm_identity_outlined)),
               TextFeilf('Enter your Acadymic Year', 'Acadymic Year', TextInputType.number, Icon(MyFlutterApp.graduation_cap)),
                SizedBox(height: 20,),
                PasswordTextField('Password', 'Enter your password',''),
                PasswordTextField('Confirm Password', 'Enter your the same password',''),
                SeleBtn(' Register ', widget.routeverfi)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
