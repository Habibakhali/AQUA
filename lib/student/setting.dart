import 'package:flutter/material.dart';
import 'package:project/student/setting_data.dart';

import '../mytheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Setting extends StatelessWidget {
static const String routeName='Setting';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,
          style: Theme.of(context).textTheme.bodyText1,),
          SizedBox(height: 4,),
          InkWell(
            onTap: (){
              ShowBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(229, 225, 225, 1.0),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 1,
                    color:MyTheme.colorBlue,
                  )

                ),
                child: Text(AppLocalizations.of(context)!.currentLang)),
          )
        ],
      ),
    );
  }
  void ShowBottomSheet(BuildContext context){
    showModalBottomSheet(context: context, builder:(context){
      return SettingData();
    } );
  }
}
