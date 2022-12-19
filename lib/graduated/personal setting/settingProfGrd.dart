import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project/graduated/login&signup/graduated_login.dart';
import 'package:project/student/Settingst/setting.dart';
import '../../student/personal setting/account_seeting.dart';
import '../../student/personal setting/resetPassWord.dart';

class SettingsPageGrd extends StatefulWidget {
  static const String routeName = 'SettingprofGRd';

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
        child: ListView(
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
            AccountSetting(AppLocalizations.of(context)!.change_password,ResetPassWord.routeName),
            AccountSetting(AppLocalizations.of(context)!.lang_theme,SettingSt.routeName),
            AccountSetting( AppLocalizations.of(context)!.privacy,''),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.volume_up_outlined,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  AppLocalizations.of(context)!.notification,
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
            buildNotificationOptionRow(AppLocalizations.of(context)!.new_foryou, true),
            buildNotificationOptionRow(AppLocalizations.of(context)!.activity, true),
            SizedBox(
              height: 50,
            ),
            Center(
              child:             ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  elevation: MaterialStateProperty.all(1),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
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
            )
          ],
        ),
      ),
    );
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