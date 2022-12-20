import 'package:flutter/material.dart';
import 'package:project/providers/setting_provider.dart';
import 'package:project/MyDesign/selection_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../MyDesign/text_field.dart';


class GraduatedLogIn extends StatefulWidget {
  static const String routeName = 'Login_Gradutated';
  String loginroutename;
  String signUpRouteName;
  String otpGrouteName;


  GraduatedLogIn(this.signUpRouteName, this.otpGrouteName, this.loginroutename);

  @override
  State<GraduatedLogIn> createState() => _GraduatedLogInState();
}

class _GraduatedLogInState extends State<GraduatedLogIn> {
  bool visubility = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<SettingProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child:  Image.asset(Theme.of(context).brightness == Brightness.light?'assets/images/blue_logo.png'
                        : "assets/images/white_logo.png"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                      AppLocalizations.of(context)!.email_hint,
                      AppLocalizations.of(context)!.email_label,
                      TextInputType.emailAddress,
                      Icon(
                        Icons.email_outlined,
                        color: Theme.of(context).canvasColor,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return '${AppLocalizations.of(context)!.please_enter} ${AppLocalizations.of(context)!.password_label}';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: visubility,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Theme.of(context).canvasColor,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                visubility = !visubility;
                                setState(() {});
                              },
                              icon: Icon(
                                visubility ? Icons.visibility : Icons.visibility_off,
                                color: Theme.of(context).canvasColor,
                              )),
                          label: Text(AppLocalizations.of(context)!.password_label),
                          labelStyle: Theme.of(context).textTheme.bodyMedium,
                          hintText: AppLocalizations.of(context)!.password_hint,
                          hintStyle: Theme.of(context).textTheme.bodySmall,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).canvasColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).canvasColor),
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                  ),
                  SeleBtn(AppLocalizations.of(context)!.login,
                      widget.loginroutename, formKey),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, widget.otpGrouteName);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.forget_password,
                        style: Theme.of(context).textTheme.bodyMedium,
                      )),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, widget.signUpRouteName);
                    },
                    child: Text(AppLocalizations.of(context)!.new_account),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
