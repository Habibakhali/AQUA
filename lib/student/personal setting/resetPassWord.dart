import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/MyDesign/selection_button.dart';
import 'package:project/MyDesign//buildTextField.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project/MyDesign//password_textfield.dart';
import 'package:project/student/personal%20setting/setting_page.dart';

class ResetPassWord extends StatelessWidget {
  static const String routeName = 'resetPassWord';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var password=TextEditingController();
  var confirm=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.change_password),
        ),
        body: Container(
            padding: EdgeInsets.only(left: 16, top: 25, right: 16),
            child: Column(children: [
              Form(
                key: formKey,
                child: PasswordTextField(
                    AppLocalizations.of(context)!.password_label,
                    AppLocalizations.of(context)!.password_hint,
                    AppLocalizations.of(context)!.confirm_label,
                    AppLocalizations.of(context)!.confirm_hint,password,confirm),
              ),
              SizedBox(
                height: 40,
              ),
              SeleBtn(AppLocalizations.of(context)!.save,
                  SettingsPageSt.routeName, formKey)
            ])));
  }
}
