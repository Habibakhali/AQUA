import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project/graduated/login&signup/graduated_login.dart';
import 'package:project/student/Settingst/setting.dart';
import '../../student/personal setting/account_seeting.dart';
import '../../student/personal setting/resetPassWord.dart';
import '../../student/personal setting/send_otp.dart';
import 'otp_change_password.dart';

class SettingsPageGrd extends StatefulWidget {
  static const String routeName = 'SettingprokddddddddfGRd';

  @override
  State<SettingsPageGrd> createState() => _SettingsPageGrdState();
}

class _SettingsPageGrdState extends State<SettingsPageGrd> {
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.setting,),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
            child : Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      AppLocalizations.of(context)!.account,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Divider(
                  height: 15,
                  thickness: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                AccountSetting(AppLocalizations.of(context)!.change_password,OTpSettingPersonalGrd.routeName),
                AccountSetting(AppLocalizations.of(context)!.lang_theme,SettingSt.routeName),
                SizedBox(
                  height: 40,
                ),


                Center(
                  child:    Container(
                    width: MediaQuery.of(context).size.width*0.95,
                    height: MediaQuery.of(context).size.height*.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: Colors.black26
                        )
                    ),child:          ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, GraduatedLogIn.routeName);
                    },
                    child: Text(AppLocalizations.of(context)!.sign_out,
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.blue)),
                  ),
                ))
              ],
            )
      ),
    );
  }





}