import 'package:flutter/material.dart';
import 'package:project/icon.dart';
import 'package:project/selection_button.dart';
import 'package:project/type_of_textfeild/password_textfield.dart';
import 'package:project/type_of_textfeild/text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SignUpGraduated extends StatefulWidget {
  static const String routeName = 'signup';
  String routeverfi;

  SignUpGraduated(this.routeverfi);

  @override
  State<SignUpGraduated> createState() => _SignUpGraduatedState();
}

class _SignUpGraduatedState extends State<SignUpGraduated> {
  GlobalKey<FormState>formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFeilf(
                      AppLocalizations.of(context)!.user_name_hint,
                      AppLocalizations.of(context)!.user_name,
                      TextInputType.name,
                      Icon(
                        Icons.person,
                        color: Theme.of(context).canvasColor,
                      )),
                  TextFeilf(
                      AppLocalizations.of(context)!.id_hint,
                      AppLocalizations.of(context)!.id,
                      TextInputType.number,
                      Icon(Icons.perm_identity_outlined,color: Theme.of(context).canvasColor,)),
                  TextFeilf(
                      AppLocalizations.of(context)!.email_hint,
                      AppLocalizations.of(context)!.university_email,
                      TextInputType.emailAddress,
                      Icon(Icons.email_outlined,color: Theme.of(context).canvasColor,)),
                  TextFeilf(
                      AppLocalizations.of(context)!.phone_hint,
                      AppLocalizations.of(context)!.phone,
                      TextInputType.number,
                      Icon(Icons.phone,color: Theme.of(context).canvasColor,)),
                  TextFeilf(
                      AppLocalizations.of(context)!.level_hint,
                      AppLocalizations.of(context)!.level,
                      TextInputType.number,
                      Icon(MyFlutterApp.graduation_cap,color: Theme.of(context).canvasColor,)),
                  SizedBox(
                    height: 20,
                  ),
                  PasswordTextField(AppLocalizations.of(context)!.password_label,
                      AppLocalizations.of(context)!.password_hint, ''),
                  PasswordTextField(AppLocalizations.of(context)!.confirm_label,
                      AppLocalizations.of(context)!.confirm_hint, ''),
                  SeleBtn(AppLocalizations.of(context)!.register, widget.routeverfi,formKey)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
