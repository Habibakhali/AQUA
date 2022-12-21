import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../MyDesign/password_textfield.dart';
import '../../MyDesign/selection_button.dart';
import '../../MyDesign/text_field.dart';
import '../../Styling/icon.dart';
import 'otp_Email_Qa.dart';


class SignUpQa extends StatefulWidget {
static const String routeName='signupqa';

@override
State<SignUpQa> createState() => _SignUpQaState();
}

class _SignUpQaState extends State<SignUpQa> {
  GlobalKey<FormState>formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var p=TextEditingController();
    var c=TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*.1),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      MyTextField(
                          AppLocalizations.of(context)!.user_name_hint,
                          AppLocalizations.of(context)!.user_name,
                          TextInputType.name,
                          Icon(
                            Icons.person,
                            color: Theme.of(context).canvasColor,
                          )),
                      MyTextField(
                          AppLocalizations.of(context)!.id_hint,
                          AppLocalizations.of(context)!.id,
                          TextInputType.number,
                          Icon(Icons.perm_identity_outlined,color: Theme.of(context).canvasColor,)),
                      MyTextField(
                          AppLocalizations.of(context)!.email_hint,
                          AppLocalizations.of(context)!.university_email,
                          TextInputType.emailAddress,
                          Icon(Icons.email_outlined,color: Theme.of(context).canvasColor,)),
                      MyTextField(
                          AppLocalizations.of(context)!.phone_hint,
                          AppLocalizations.of(context)!.phone,
                          TextInputType.number,
                          Icon(Icons.phone,color: Theme.of(context).canvasColor,)),
                      SizedBox(
                        height: 20,
                      ),
                      PasswordTextField(AppLocalizations.of(context)!.password_label,
                          AppLocalizations.of(context)!.password_hint,AppLocalizations.of(context)!.confirm_label,
                          AppLocalizations.of(context)!.confirm_hint),
                      SeleBtn(AppLocalizations.of(context)!.register, OtpQaEmail.routeName,formKey)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
