import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/selection_button.dart';
import 'package:project/type_of_textfeild/buildTextField.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project/type_of_textfeild/password_textfield.dart';

class ResetPassWord extends StatelessWidget {
  static const String routeName='resetPassWord';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text("change Password"),
          elevation: 1,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.blue,
            ),
          ),
        ),
        body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
    child: Column(
    children: [
      PasswordTextField(AppLocalizations.of(context)!.password_label,
          AppLocalizations.of(context)!.password_hint,AppLocalizations.of(context)!.confirm_label,
          AppLocalizations.of(context)!.confirm_hint),
  ])));
}}
