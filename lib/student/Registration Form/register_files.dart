import 'package:flutter/material.dart';
import'dart:io';

import 'package:project/mytheme.dart';

class RegisterFiles extends StatefulWidget {
File? fileName;
RegisterFiles(this.fileName);

  @override
  State<RegisterFiles> createState() => _RegisterFilesState();
}

class _RegisterFilesState extends State<RegisterFiles> {
  bool visible =true;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Stack(
        alignment: Alignment.topRight,
        children: [Image.file(widget.fileName!),
        InkWell(
            onTap:() {
              visible=false;
             setState(() {

             });
            },
            child: Icon(Icons.clear,color: Colors.red,))
        ]
      ),
    );
  }
}
