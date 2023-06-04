import 'package:flutter/material.dart';
import 'package:project/API/api_manager.dart';
import 'package:project/providers/setting_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project/student/layout/homeScreen.dart';
import 'package:project/student/login&signUp/forget_passwoord.dart';
import 'package:project/student/login&signUp/signup_student.dart';
import 'package:provider/provider.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';



class StudentLogin extends StatefulWidget {
static const String routeName='Student_login';


@override
State<StudentLogin> createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {
  bool visubility = true;
  TextEditingController textController=TextEditingController();
  TextEditingController passController=TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<SettingProvider>(context);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.09,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child:  Image.asset(Theme.of(context).brightness == Brightness.light?'assets/images/blue_logo.png'
                        : "assets/images/white_logo.png"),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.04,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                        validator: (text) {
                          if (text == null || text.trim().isEmpty ||!text.contains('@sci.asu.edu.eg'))
                            return '${AppLocalizations.of(context)!.please_enter}${AppLocalizations.of(context)!.email_label}';
                          return null;
                        },
                        controller: textController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            label: Text(AppLocalizations.of(context)!.email_label),
                            labelStyle: TextStyle(color: Colors.black26),
                            hintText: AppLocalizations.of(context)!.email_hint,
                            hintStyle: Theme.of(context).textTheme.bodySmall,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Theme.of(context).canvasColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Theme.of(context).canvasColor),
                              borderRadius: BorderRadius.circular(10),
                            )
                        )
                    ),
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
                                visubility ? Icons.visibility : Icons.visibility_off,
                                color: Theme.of(context).canvasColor,
                              )),
                          label: Text(AppLocalizations.of(context)!.password_label),
                          labelStyle: TextStyle(color: Colors.black26),
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
                  Container(
                    margin: EdgeInsets.all(20),
                    height: MediaQuery.of(context).size.height*0.07,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            bool result = await InternetConnectionChecker()
                                .hasConnection;
                            if (result) {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) =>
                                      StatefulBuilder(builder:
                                          (context, StateSetter setState) {
                                        return SimpleDialog(
                                            title: Container(
                                                padding: EdgeInsets.all(10),
                                                child: Center(
                                                  child:
                                                  CircularProgressIndicator(),
                                                )));
                                      }));

                              validation();
                            }
                            else {
                              return showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Center(
                                        child: Text("No Internet")),
                                    content: Image.asset(
                                      'assets/images/wi-fi-disconnected.png',
                                      width: 100,
                                      height: 100,
                                    ),
                                  ));
                            }
                          }
                        },
                        child: Text(
                          AppLocalizations.of(context)!.login,
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, ForgetMyPasswordStudent.routeName);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.forget_password,
                        style: Theme.of(context).textTheme.bodyMedium,
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.25,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.black26
                      )
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignUpStudent.routeName);
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
      )  );
  }
  Future<dynamic> validation()async{
    var data =await ApiManager.loginStudent(textController.text, passController.text);
    if(data.error==null){
      Navigator.pop(context);
     Navigator.pushReplacementNamed(context, HomeScreenStudent.routeName,
     );
     return showDialog(context: context, builder: (context) =>
         AlertDialog(
             title: Text("Completed"),
             // To display the title it is optional
             content: Text("success")),
     );
    }
    else {
      Navigator.pop(context);
      return showDialog(context: context, builder: (context) =>
          AlertDialog(
              title: Text("Error"),
              // To display the title it is optional
              content: Text(data.error!)),
      );
    }


}
  }
