import 'package:flutter/material.dart';

import '../../../API/api_manager.dart';

class DataOfActivityBottomSheet extends StatelessWidget {
String image;
String title;

DataOfActivityBottomSheet(this.title,this.des,this.image);

  String des;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(child: Text(title,style: TextStyle(fontWeight: FontWeight.w800),),),
          Image.network('https://' + ApiManager.base + '/' + image,width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*0.27,),
          SizedBox(height: 5,),
          Text(des)
        ],
      ),
    );
  }
}
