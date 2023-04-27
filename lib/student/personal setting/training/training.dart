import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project/student/personal%20setting/training/post_item.dart';

import 'content_bottom_sheet.dart';

class Training extends StatefulWidget {
  static const String routName = "training";

  @override
  State<Training> createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  List<PostArg>arg=[];

  void caal(PostArg p){
    setState(() {
      arg.add(p);
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            BottomSheetInsertion();
          });

        },
        child: Icon(Icons.add),
      ),
body: Column(
  children: [
    Expanded(child:
    ListView.builder(
        itemCount: arg.length,
        itemBuilder: (context,index){
      return PostItem(arg[index].title,arg[index].description,arg[index].img);
    })
    )
  ],
),
    );
  }

  void  BottomSheetInsertion(){
    showModalBottomSheet(context: context, builder: (context){
      return ContentBottomSheet(caal);
    });
  }
}
