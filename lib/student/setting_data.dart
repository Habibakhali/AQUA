import 'package:flutter/material.dart';
import 'package:project/mytheme.dart';
import 'package:project/providers/setting_provider.dart';
import 'package:provider/provider.dart';

class SettingData extends StatelessWidget {

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
              child: pro.currentLang=='en'?selectedIte('English'):unselectedIte('English')
          ),
         SizedBox(height: 12,),
          InkWell(
              onTap: (){
                pro.changeLAnguage('ar');
              },
              child: pro.currentLang=='ar'?selectedIte('العربية'):unselectedIte('العربية')
          ),
        ],
      ),
    );
  }
  Widget selectedIte(String text){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: TextStyle(color: MyTheme.colorBlue),),
        Icon(Icons.check,color: MyTheme.colorBlue,)
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
