import 'package:flutter/material.dart';
import 'package:project/doctor/login&signup/signup_doctor.dart';
import 'package:provider/provider.dart';
import '../../providers/setting_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'forget_pass_doc.dart';

class DoctorLogin extends StatefulWidget {
  static const String routeName = 'DocotrLogin';

  @override
  State<DoctorLogin> createState() => _DoctorLoginState();
}

class _DoctorLoginState extends State<DoctorLogin> {
  bool visubility = true;
  TextEditingController textController = TextEditingController();
  TextEditingController passController = TextEditingController();
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
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Image.asset(
                        Theme.of(context).brightness == Brightness.light
                            ? 'assets/images/blue_logo.png'
                            : "assets/images/white_logo.png"),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                        validator: (text) {
                          if (text == null || text.trim().isEmpty)
                            return '${AppLocalizations.of(context)!.please_enter}${AppLocalizations.of(context)!.email_label}';
                          return null;
                        },
                        controller: textController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            label:
                                Text(AppLocalizations.of(context)!.email_label),
                            labelStyle: TextStyle(color: Colors.black26),
                            hintText: AppLocalizations.of(context)!.email_hint,
                            hintStyle: Theme.of(context).textTheme.bodySmall,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).canvasColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).canvasColor),
                              borderRadius: BorderRadius.circular(10),
                            ))),
                  ),
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
                      controller: passController,
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
                                visubility
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).canvasColor,
                              )),
                          label: Text(
                              AppLocalizations.of(context)!.password_label),
                          labelStyle: TextStyle(color: Colors.black26),
                          hintText: AppLocalizations.of(context)!.password_hint,
                          hintStyle: Theme.of(context).textTheme.bodySmall,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).canvasColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).canvasColor),
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        onPressed: () {
                          validation();
                        },
                        child: Text(
                          AppLocalizations.of(context)!.login,
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, ForgetMyPasswordDr.routeName);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.forget_password,
                        style: Theme.of(context).textTheme.bodyMedium,
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black26)),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignUpDoctor.routeName);
                      },
                      child: Text(AppLocalizations.of(context)!.new_account),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validation() {}
}
