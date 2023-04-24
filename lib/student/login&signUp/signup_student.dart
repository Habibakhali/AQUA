import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project/API/Models/Student/register.dart';
import 'package:project/API/api_manager.dart';
import '../../MyDesign/password_textfield.dart';
import '../../Styling/icon.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'otp_Email_Sta.dart';


class SignUpStudent extends StatefulWidget {
  static const String routeName = 'signup-student';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController acdi_year = TextEditingController();
  TextEditingController phone = TextEditingController();
  var p = TextEditingController();
  var c = TextEditingController();


  @override
  State<SignUpStudent> createState() => _SignUpStudentState();
}

class _SignUpStudentState extends State<SignUpStudent> {
  late Register _register;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: widget.formKey,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: TextFormField(
                        validator: (text) {
                          if (text == null || text
                              .trim()
                              .isEmpty)
                            return '${AppLocalizations.of(context)!
                                .please_enter} ${AppLocalizations.of(context)!
                                .user_name}';
                          return null;
                        },
                        controller: widget.userName,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Theme
                                  .of(context)
                                  .canvasColor,
                            ),
                            label:
                            Text(AppLocalizations.of(context)!.user_name),
                            labelStyle: Theme
                                .of(context)
                                .textTheme
                                .bodyMedium,
                            hintText:
                            AppLocalizations.of(context)!.user_name_hint,
                            hintStyle: Theme
                                .of(context)
                                .textTheme
                                .bodySmall,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme
                                      .of(context)
                                      .canvasColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme
                                      .of(context)
                                      .canvasColor),
                              borderRadius: BorderRadius.circular(10),
                            ))),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: TextFormField(
                        validator: (text) {
                          if (text == null || text
                              .trim()
                              .isEmpty)
                            return '${AppLocalizations.of(context)!
                                .please_enter} ${AppLocalizations.of(context)!
                                .id}';
                          if (!(int.tryParse(text) != null &&
                              text.length == 14)) {
                            return '${AppLocalizations.of(context)!
                                .id} ${AppLocalizations.of(context)!
                                .validation_id}';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.perm_identity_outlined,
                              color: Theme
                                  .of(context)
                                  .canvasColor,
                            ),
                            label: Text(AppLocalizations.of(context)!.id),
                            labelStyle: Theme
                                .of(context)
                                .textTheme
                                .bodyMedium,
                            hintText: AppLocalizations.of(context)!.id_hint,
                            hintStyle: Theme
                                .of(context)
                                .textTheme
                                .bodySmall,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme
                                      .of(context)
                                      .canvasColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme
                                      .of(context)
                                      .canvasColor),
                              borderRadius: BorderRadius.circular(10),
                            ))),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: TextFormField(
                        validator: (text) {
                          if (text == null || text
                              .trim()
                              .isEmpty)
                            return '${AppLocalizations.of(context)!
                                .please_enter} ${AppLocalizations.of(context)!
                                .university_email}';
                          if (!text.contains('@sci.asu.edu.eg'))
                            return '${AppLocalizations.of(context)!
                                .please_enter} ${AppLocalizations.of(context)!
                                .university_email}';

                          return null;
                        },
                        controller: widget.email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Theme
                                  .of(context)
                                  .canvasColor,
                            ),
                            label: Text(
                                AppLocalizations.of(context)!.university_email),
                            labelStyle: Theme
                                .of(context)
                                .textTheme
                                .bodyMedium,
                            hintText: AppLocalizations.of(context)!.email_hint,
                            hintStyle: Theme
                                .of(context)
                                .textTheme
                                .bodySmall,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme
                                      .of(context)
                                      .canvasColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme
                                      .of(context)
                                      .canvasColor),
                              borderRadius: BorderRadius.circular(10),
                            ))),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: TextFormField(
                        validator: (text) {
                          if (text == null || text
                              .trim()
                              .isEmpty)
                            return '${AppLocalizations.of(context)!
                                .please_enter} ${AppLocalizations.of(context)!
                                .phone}';
                          if (!(int.tryParse(text) != null &&
                              text.length == 11))
                            return AppLocalizations.of(context)!
                                .validation_phone;
                          return null;
                        },
                        controller: widget.phone,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Theme
                                  .of(context)
                                  .canvasColor,
                            ),
                            label:
                            Text(AppLocalizations.of(context)!.phone),
                            labelStyle: Theme
                                .of(context)
                                .textTheme
                                .bodyMedium,
                            hintText:
                            AppLocalizations.of(context)!.phone_hint,
                            hintStyle: Theme
                                .of(context)
                                .textTheme
                                .bodySmall,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme
                                      .of(context)
                                      .canvasColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme
                                      .of(context)
                                      .canvasColor),
                              borderRadius: BorderRadius.circular(10),
                            ))),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: TextFormField(
                        validator: (text) {
                          if (text == null || text
                              .trim()
                              .isEmpty)
                            return '${AppLocalizations.of(context)!
                                .please_enter} ${AppLocalizations.of(context)!
                                .level}';
                          if (!(text == '1' || text == '2' || text == '3' ||
                              text == '4'))
                            return '${AppLocalizations.of(context)!.invalid}';
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              MyFlutterApp.graduation_cap,
                              color: Theme
                                  .of(context)
                                  .canvasColor,
                            ),
                            label: Text(AppLocalizations.of(context)!.level),
                            labelStyle: Theme
                                .of(context)
                                .textTheme
                                .bodyMedium,
                            hintText: AppLocalizations.of(context)!.level_hint,
                            hintStyle: Theme
                                .of(context)
                                .textTheme
                                .bodySmall,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Theme
                                  .of(context)
                                  .canvasColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Theme
                                  .of(context)
                                  .canvasColor),
                              borderRadius: BorderRadius.circular(10),
                            )
                        )
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PasswordTextField(
                      AppLocalizations.of(context)!.password_label,
                      AppLocalizations.of(context)!.password_hint,
                      AppLocalizations.of(context)!.confirm_label,
                      AppLocalizations.of(context)!.confirm_hint,
                      widget.p,
                      widget.c),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * .5,
                      child: ElevatedButton(
                          onPressed: ()  {
                            validation();
                             },
                          child: Text(
                            AppLocalizations.of(context)!.register,
                            style: TextStyle(fontSize: 18),
                          ))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> validation() async {
    if (widget.formKey.currentState?.validate() == true) {
      var name = widget.userName.text;
      var email = widget.email.text;
      var password = widget.p.text;
      var confirm = widget.c.text;
      Register data = await ApiManager.postRegisterStud(name, email, password, confirm);
      if (data.errors==null) {
        Navigator.pushReplacementNamed(context, OtpStudentEmail.routeName,
        arguments: widget.email.text);
        return showDialog(context: context, builder: (context) =>
            AlertDialog(
                title: Text("completed🥳"),
                // To display the title it is optional
                content: Text('procced to verify your email')),
        );
      }
      else {
        return showDialog(context: context, builder: (context) =>
            AlertDialog(
                title: Text("Error"),
                // To display the title it is optional
                content: Text(data.message!)));
      }
    }
  }
}