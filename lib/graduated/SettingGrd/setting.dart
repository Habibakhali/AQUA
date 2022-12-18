import 'package:flutter/material.dart';
import 'package:project/providers/setting_provider.dart';
import 'package:project/student/Settingst/setting_lang_data.dart';
import 'package:provider/provider.dart';
import '../../Styling/mytheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../student/Settingst/setting_theme_data.dart';

class SettingGrd extends StatelessWidget{
  static const String routeName = 'Setting_homeScreenGrd';

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<SettingProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppLocalizations.of(context)!.language,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: 4,
              ),
              InkWell(
                onTap: () {
                  ShowBottomSheetLang(context);
                },
                child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(229, 225, 225, 1.0),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: 1,
                          color: MyTheme.light_primaryColor,
                        )),
                    child: Text(
                      pro.currentLang == 'ar'
                          ? AppLocalizations.of(context)!.arabicLang
                          : AppLocalizations.of(context)!.englishLang,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Color.fromRGBO(0, 0, 0, 0.9)
                      ),
                    )),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                AppLocalizations.of(context)!.theme,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: 4,
              ),
              InkWell(
                onTap: () {
                  ShowBottomSheetTheme(context);
                },
                child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(229, 225, 225, 1.0),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(

                          width: 1,
                          color: MyTheme.light_primaryColor,
                        )),
                    child: Text(pro.currTheme == ThemeMode.light
                        ? AppLocalizations.of(context)!.lightMode
                        : AppLocalizations.of(context)!.dartMode,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: Color.fromRGBO(0, 0, 0, 0.9)),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void ShowBottomSheetLang(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return LangData();
        });
  }

  void ShowBottomSheetTheme(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ThemData();
        });
  }
}
