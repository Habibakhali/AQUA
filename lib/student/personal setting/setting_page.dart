import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project/student/Settingst/setting.dart';
import 'package:project/student/login&signUp/student_login.dart';
import 'package:project/student/personal%20setting/send_otp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'account_seeting.dart';
import 'resetPassWord.dart';

class SettingsPageSt extends StatefulWidget {
  static const String routeName = 'Settingst';
  @override
  _SettingsPageStState createState() => _SettingsPageStState();
}


class _SettingsPageStState extends State<SettingsPageSt> {
  @override
  String? name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:   Text(
         AppLocalizations.of(context)!.setting
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16,bottom: 18),
        child: Column(
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
                Expanded(
                  child: Text(
                  AppLocalizations.of(context)!.account,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(name??"")
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            AccountSetting(AppLocalizations.of(context)!.change_password,OTpSettingPersonal.routeName),
            AccountSetting(AppLocalizations.of(context)!.lang_theme,SettingSt.routeName),
            Spacer(),
        Container(
            width: MediaQuery.of(context).size.width*0.95,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                    color: Colors.black26
                )
            ),
            child: TextButton(
              onPressed: () async{
                final pref=await SharedPreferences.getInstance();
                pref.setString('token', '');
                Navigator.pushNamed(context,StudentLogin.routeName);

              },
              child: Text(AppLocalizations.of(context)!.sign_out),
            )),

    ])));
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              trackColor: Colors.grey, // **INACTIVE STATE COLOR**
              activeColor: Colors.blue,
              value: isActive,
              onChanged: (bool val) {
                setState(() {
                  isActive=val;
                });

              },

            )

        )
      ],
    );
  }



}