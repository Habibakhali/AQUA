
import 'package:flutter/material.dart';
import 'package:project/student/Courses/exam_item.dart';

import 'pdf_viewer_final.dart';

class Exam extends StatelessWidget {

  static const String routeName = 'parallel';
  @override
  Widget build(BuildContext context) {
    var arg=ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
        body:SafeArea(child:
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "Exams",
                            style:Theme.of(context).textTheme.headlineLarge ),
                        SizedBox(width: 50,),
                        Image.asset(
                          'assets/images/exam.png',
                          height: 50,
                          width: 50,
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Text(
                      "Recent Exams",
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign:TextAlign.start ,
                    ),
                    SizedBox(height: 30.0),
                    ExamItem('Final ${arg.toString()}','2020',FinalPdfViewer.routeName,""),
                    SizedBox(height: 10,),
                    ExamItem('MidTerm ${arg.toString()}','2021',FinalPdfViewer.routeName,""),
                    SizedBox(height: 10,),
                  ]
                  ,
                ),
              )
              ,

            )
        ));
  }
}