import 'package:flutter/material.dart';
import 'package:project/providers/setting_provider.dart';
import 'package:project/selection_button.dart';
import 'package:project/type_of_textfeild/password_textfield.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../type_of_textfeild/text_field.dart';
import 'Otp_form.dart';

class GraduatedLogIn extends StatelessWidget {
  static const String routeName = 'Login_Gradutated';
  String loginroutename;
  String signUpRouteName;
  String otpGrouteName;

  GraduatedLogIn(this.signUpRouteName, this.otpGrouteName, this.loginroutename);

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<SettingProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Image.asset(
                    pro.currTheme==ThemeMode.light? 'assets/images/logo_blue.png':'assets/images/white.png'),

                TextFeilf(
                    AppLocalizations.of(context)!.email_hint,
                    AppLocalizations.of(context)!.email_label,
                    TextInputType.emailAddress,
                    Icon(Icons.email_outlined,color: Theme.of(context).canvasColor,)),
                SizedBox(
                  height: 20,
                ),
                PasswordTextField(AppLocalizations.of(context)!.password_label,
                    AppLocalizations.of(context)!.password_hint, ''),
                SeleBtn(AppLocalizations.of(context)!.login, loginroutename),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, OtpFormGraduated.routeName);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.forget_password,
                      style: Theme.of(context).textTheme.bodyMedium,
                    )),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, signUpRouteName);
                  },
                  child: Text(AppLocalizations.of(context)!.new_account),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
