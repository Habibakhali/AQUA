import 'package:flutter/material.dart';
import 'package:project/MyDesign//selection_button.dart';
import 'package:project/MyDesign//password_textfield.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class PasswordResetGra extends StatelessWidget {
  static const String routeName = 'newPassWord';
  String backToligin;
  PasswordResetGra(this.backToligin);
GlobalKey<FormState>formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
         AppLocalizations.of(context)!.back,
          style: TextStyle(color: Colors.white),
        ),
        leadingWidth: 30,
      ),
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
                    AppLocalizations.of(context)!.confirm_label, AppLocalizations.of(context)!.password_lettertwo),
              SeleBtn(AppLocalizations.of(context)!.reset_password, backToligin,formKey),
              ],
            ),
          )),
    );
  }
}
