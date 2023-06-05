import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../API/Models/Student/forget_pass_student.dart';
import '../../API/api_manager.dart';
import '../../student/personal setting/resetPassWord.dart';

class OTpSettingPersonalGrd extends StatefulWidget {
  static String routeName='otpGraduatedSettingPersonal';

  @override
  State<OTpSettingPersonalGrd> createState() => _OTpSettingPersonalGrdState();
}

class _OTpSettingPersonalGrdState extends State<OTpSettingPersonalGrd> {
  TextEditingController textController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    textController.text='shima@sci.asu.edu';
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20,right: 20,top: MediaQuery.of(context).size.height*0.12),
        child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Send Code to this Email",style: TextStyle(
                  fontSize: 25
              ),),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                enabled: false,
                controller: textController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    label: Text(AppLocalizations.of(context)!.email_label),
                    border: OutlineInputBorder(
                    )
                ),
              ),
              SizedBox(height: 20,),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.07,
                  child: ElevatedButton(onPressed: () async{
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
                      , child: Text('Send',style: TextStyle(
                          fontSize: 18
                      ),)))
            ],
          ),
        ),
      ),
    );
  }
  validation()async{
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context,ResetPassWord.routeName );
      return showDialog(context: context, builder: (context) =>
          AlertDialog(
              title: Text("hi👋🏻,shima"),
              // To display the title it is optional
              content: Text('reset your password')),);

  }
}
