import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'ItemActivity.dart';

class StudentActivity extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<String>title=[
      AppLocalizations.of(context)!.ranger,
      AppLocalizations.of(context)!.stage,
      AppLocalizations.of(context)!.sports,
      AppLocalizations.of(context)!.singing,
      AppLocalizations.of(context)!.drawing
    ];
    List<String>image=[
      'assets/images/ranger.png',
      'assets/images/stage.png',
      'assets/images/running.png',
      'assets/images/choir.png',
      'assets/images/drawing.png',
    ];
    List<String>descriptin=[
      AppLocalizations.of(context)!.ranger_description,
      AppLocalizations.of(context)!.stage_description,
      AppLocalizations.of(context)!.sport_description,
      AppLocalizations.of(context)!.singe_description,
      AppLocalizations.of(context)!.drawing_description
    ];
    List<String>url1=[
      'assets/images/ranger1.jpg',
      'assets/images/satge1.jpg',
      'assets/images/sport2.png',
      'assets/images/choral1.jpg',
      'assets/images/drawing1.jpg',
    ];
    List<String>url2=[
      'assets/images/ranger24.jpg',
      'assets/images/stage2.jpg',
      'assets/images/sport1.jpg',
      'assets/images/chotal2.jpg',
      'assets/images/drawing2.jpg',
    ];
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children:[
      Expanded(
        child: ListView.builder(itemBuilder: (context,index){
          return ItemActivity(title[index],descriptin[index],image[index],url1[index],url2[index]);
        },
        itemCount: 5,),
      ),]
      )
    );
  }
}
