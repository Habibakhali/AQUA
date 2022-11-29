import 'package:flutter/material.dart';
import 'package:project/icon.dart';
import 'package:project/selection_button.dart';
import 'package:project/type_of_textfeild/password_textfield.dart';
import 'package:project/type_of_textfeild/text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



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
                TextFeilf(AppLocalizations.of(context)!.user_name_hint, AppLocalizations.of(context)!.user_name, TextInputType.name,Icon(Icons.person)),
                TextFeilf(AppLocalizations.of(context)!.email_hint, AppLocalizations.of(context)!.email_label,
                    TextInputType.emailAddress,Icon(Icons.email_outlined)),
                TextFeilf(AppLocalizations.of(context)!.phone_hint, AppLocalizations.of(context)!.phone,
                    TextInputType.number,Icon(Icons.phone)),
               TextFeilf(AppLocalizations.of(context)!.id_hint, AppLocalizations.of(context)!.id, TextInputType.number, Icon(Icons.perm_identity_outlined)),
               TextFeilf(AppLocalizations.of(context)!.level_hint, AppLocalizations.of(context)!.level, TextInputType.number, Icon(MyFlutterApp.graduation_cap)),
                SizedBox(height: 20,),
                PasswordTextField(AppLocalizations.of(context)!.password_label, AppLocalizations.of(context)!.password_hint,''),
                PasswordTextField(AppLocalizations.of(context)!.confirm_label, AppLocalizations.of(context)!.confirm_hint,''),
                SeleBtn( AppLocalizations.of(context)!.register, widget.routeverfi)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
