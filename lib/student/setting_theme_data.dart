import 'package:flutter/material.dart';
import 'package:project/mytheme.dart';
import 'package:project/providers/setting_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ThemData extends StatefulWidget {

  @override
  State<ThemData> createState() => _ThemDataState();
}

class _ThemDataState extends State<ThemData> {
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<SettingProvider>(context);
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          InkWell(
              onTap: (){
                pro.changeTheme(ThemeMode.light);
              },
              child: pro.currTheme==ThemeMode.light?selectedIte(AppLocalizations.of(context)!.lightMode):unselectedIte(AppLocalizations.of(context)!.lightMode)
          ),
         SizedBox(height: 12,),
          InkWell(
              onTap: (){
                pro.changeTheme(ThemeMode.dark);
              },
              child: pro.currTheme==ThemeMode.dark?selectedIte(AppLocalizations.of(context)!.dartMode):unselectedIte(AppLocalizations.of(context)!.dartMode)
          ),
        ],
      ),
    );
  }

  Widget selectedIte(String text){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: TextStyle(color: MyTheme.light_primaryColor),),
        Icon(Icons.check,color: MyTheme.light_primaryColor,)
      ],
    );
  }

  Widget unselectedIte(String text){
    return Row(
      children: [
        Text(text,style:Theme.of(context).textTheme.bodyMedium)
      ],
    );
  }
}
