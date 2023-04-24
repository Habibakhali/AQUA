import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project/doctor/login&signup/doctor_login.dart';
import '../../MyDesign/password_textfield.dart';
import '../../MyDesign/selection_button.dart';

class ResetPassDoctor extends StatelessWidget {
  static const String routeName='resetpassdoctor';
  var password=TextEditingController();
  var confirm=TextEditingController();
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
                    AppLocalizations.of(context)!.confirm_label, AppLocalizations.of(context)!.password_lettertwo,password,confirm),
                SeleBtn(AppLocalizations.of(context)!.reset_password, DoctorLogin.routeName,formKey),
              ],
            ),
          )),
    );
  }
}
