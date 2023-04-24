import 'package:flutter/material.dart';
import'dart:io';

class RegisterFiles extends StatelessWidget {
String fileName;
 Function callBack;
 int index;
RegisterFiles(this.fileName,this.callBack,this.index);

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.topRight,
        children: [
          Image.network(fileName,),
        InkWell(
            onTap:() {
            callBack(index);
            },
            child: Icon(Icons.clear,color: Colors.red,)),
        ]
    );
  }
}
