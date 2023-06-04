import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project/API/api_manager.dart';
import 'package:project/student/login&signUp/student_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../API/Models/Student/reset_forget_pass_student.dart';
import '../../MyDesign/password_textfield.dart';
import '../../MyDesign/selection_button.dart';

class ResetPassStu extends StatefulWidget {
static const String routeName='resetpassStudent';

  @override
  State<ResetPassStu> createState() => _ResetPassStuState();
}

class _ResetPassStuState extends State<ResetPassStu> {
var password=TextEditingController();

var confirm=TextEditingController();

var pincode='';

GlobalKey<FormState>formKey=GlobalKey<FormState>();

@override
Widget build(BuildContext context) {
  var all=ModalRoute.of(context)!.settings.arguments;
  pincode=all.toString();
  return Scaffold(
    body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              SizedBox(
                height: 16,
              ),
              Text(
                AppLocalizations.of(context)!.new_password,
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                AppLocalizations.of(context)!.note_new_password,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(height: 20,),
              PasswordTextField(AppLocalizations.of(context)!.password_label, AppLocalizations.of(context)!.password_letter,
                  AppLocalizations.of(context)!.confirm_label, AppLocalizations.of(context)!.password_lettertwo,password,confirm),
              Container(
                margin: EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height*0.07,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: ()  {
                      validation();
                    },
                    child: Text(
                      AppLocalizations.of(context)!.reset_password,
                      style: TextStyle(fontSize: 20),
                    )),
              ),
            ],
          ),
        )),
  );
}

//
void validation()async {
  final pref=await SharedPreferences.getInstance();
  if(formKey.currentState!.validate()){
    ResetForgetPassStudent data=await ApiManager.resetForgetPassStudent(pincode, password.text, confirm.text);
    if(data.errors==null){
      Navigator.pushReplacementNamed(context, StudentLogin.routeName);
      pref.setString('token', '');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("saved the new password")));
    }
    else{
      return showDialog(context: context, builder: (c)=>AlertDialog(
        title: Text("Error"),
        content: Text(data.message!),
      ));
    }
  }
}
}
