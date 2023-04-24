import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project/API/api_manager.dart';
import 'package:project/student/login&signUp/student_login.dart';

import '../../API/Models/Student/otp_student_api.dart';

class OtpStudentEmail extends StatefulWidget {
  static const String routeName='otpEmailStudent';
String email='';

  @override
  State<OtpStudentEmail> createState() => _OtpStudentEmailState();
}

class _OtpStudentEmailState extends State<OtpStudentEmail> {
  String all="";
  TextEditingController tf1=TextEditingController();
  TextEditingController tf2=TextEditingController();
  TextEditingController tf3=TextEditingController();
  TextEditingController tf4=TextEditingController();
  TextEditingController tf5=TextEditingController();
  TextEditingController tf6=TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var argEMail=ModalRoute.of(context)!.settings.arguments;
    widget.email=argEMail.toString();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 12,vertical: 28),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(AppLocalizations.of(context)!.verification_code,
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.headlineSmall),
                SizedBox(
                  height: 20,
                ),
                Text(AppLocalizations.of(context)!.sending_to_email,
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.bodySmall),
                Text(argEMail.toString(),
                    style: Theme.of(context).textTheme.headlineSmall),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: tf1,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return AppLocalizations.of(context)!.validation_otp;
                          }
                          return null;
                        },
                        style: Theme.of(context).textTheme.headline6,
                        autofocus: true,
                        showCursor: false,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          counter: Offstage(),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 2, color: Colors.black12),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 2, color: Colors.blue),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: tf2,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return AppLocalizations.of(context)!.validation_otp;
                          }
                          return null;
                        },
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        style: Theme.of(context).textTheme.headline6,
                        autofocus: true,
                        showCursor: false,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          counter: Offstage(),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 2, color: Colors.black12),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 2, color: Colors.blue),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: tf3,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return AppLocalizations.of(context)!.validation_otp;
                          }
                          return null;
                        },
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        style: Theme.of(context).textTheme.headline6,
                        autofocus: true,
                        showCursor: false,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          counter: Offstage(),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 2, color: Colors.black12),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 2, color: Colors.blue),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: tf4,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return AppLocalizations.of(context)!.validation_otp;
                          }
                          return null;
                        },
                        onChanged: (value) {
                          if (value.length == 1) {

                            FocusScope.of(context).nextFocus();
                          }
                        },
                        style: Theme.of(context).textTheme.headline6,
                        autofocus: true,
                        showCursor: false,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          counter: Offstage(),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 2, color: Colors.black12),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 2, color: Colors.blue),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ), 
                    Expanded(
                      child: TextFormField(
                        controller: tf5,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return AppLocalizations.of(context)!.validation_otp;
                          }
                          return null;
                        },
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        style: Theme.of(context).textTheme.headline6,
                        autofocus: true,
                        showCursor: false,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          counter: Offstage(),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 2, color: Colors.black12),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 2, color: Colors.blue),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ), 
                    Expanded(
                      child: TextFormField(
                        controller: tf6,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return AppLocalizations.of(context)!.validation_otp;
                          }
                          return null;
                        },
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        style: Theme.of(context).textTheme.headline6,
                        autofocus: true,
                        showCursor: false,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          counter: Offstage(),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 2, color: Colors.black12),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 2, color: Colors.blue),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      child: ElevatedButton(
                          onPressed: ()  {
                            validation();
                          },
                          child: Text(
                            AppLocalizations.of(context)!.verify,
                            style: TextStyle(fontSize: 18),
                          )),
                    )
                  ],
                ),
                InkWell(
                  onTap: (){
                    ResndCode();
                  },
                  child: Text(AppLocalizations.of(context)!.didnt_recirve,
                      style: Theme.of(context).textTheme.headlineSmall),
                ),
                SizedBox(
                  height: 18,
                ),
                InkWell(
                  onTap: (){
                    ResndCode();
                  },
                  child: Text(
                    AppLocalizations.of(context)!.resend_code,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                )
              ],
            ),
          )),
    );
  }
  void ResndCode()async{
    var data=await ApiManager.resendOtpStudent(widget.email);
    if(data.errors!=null){
      return showDialog(context: context, builder: (context) =>
          AlertDialog(
              title: Text("Error"),
              // To display the title it is optional
              content: Text(data.message!)),);
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Verification code has been sent')),
      );
    }
    }
  Future<dynamic> validation()async{

    if(formKey.currentState?.validate()==true){
      all=tf1.text+tf2.text+tf3.text+tf4.text+tf5.text+tf6.text;
      print("all is = $all");
      ApiOtpStudent data=await ApiManager.otpVstudent(all);
      if(data.errors==null){
        Navigator.pushReplacementNamed(context, StudentLogin.routeName);
        return showDialog(context: context, builder: (context) =>
            AlertDialog(
                title: Text("completed 🥳"),
                // To display the title it is optional
                content: Text('procced to verify your email')),
        );
      }
      else{
        return showDialog(context: context, builder: (context) =>
            AlertDialog(
                title: Text("Error"),
                // To display the title it is optional
                content: Text(data.errors!.otp!.first)),);
      }
    }
  }
}

