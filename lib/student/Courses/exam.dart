
import 'package:flutter/material.dart';
import 'package:project/student/Courses/exam_item.dart';

import 'pdf_viewer_final.dart';

class Exam extends StatelessWidget {

  static const String routeName = 'parallel';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SafeArea(
            child:
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
           ExamItem('Final parallel','2020',FinalPdfViewer.routeName,""),
                    SizedBox(height: 10,),
                    ExamItem('MidTerm parallel','2021',FinalPdfViewer.routeName,""),
                    SizedBox(height: 10,),
                    Center(
                      child: Text(
                        "View all",
                        style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 15.0),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      "Recent Answers",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30.0),
                ExamItem('Answer of final exam','2020',FinalPdfViewer.routeName,""),
                    SizedBox(height: 10,),
                    ExamItem('Answer of mid term','2021',FinalPdfViewer.routeName,""),
                    SizedBox(height: 10,),

                    Center(
                      child: Text(
                        "View all",
                        style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 15.0),
                      ),)

                  ]
                  ,
                ),
              )
              ,

            )
        ));
  }
}