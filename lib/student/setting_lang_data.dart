import 'package:flutter/material.dart';
import 'package:project/mytheme.dart';
import 'package:project/providers/setting_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class LangData extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<SettingProvider>(context);
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          InkWell(
              onTap: (){
                pro.changeLAnguage('en');
              },
              child: pro.currentLang=='en'?selectedIte(AppLocalizations.of(context)!.englishLang):unselectedIte(AppLocalizations.of(context)!.englishLang)
          ),
         SizedBox(height: 12,),
          InkWell(
              onTap: (){
                pro.changeLAnguage('ar');
              },
              child: pro.currentLang=='ar'?selectedIte(AppLocalizations.of(context)!.arabicLang):unselectedIte(AppLocalizations.of(context)!.arabicLang)
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
        Text(text)
      ],
    );
  }
}
