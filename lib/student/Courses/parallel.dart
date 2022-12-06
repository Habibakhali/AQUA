
import 'package:flutter/material.dart';
import 'package:project/exam_item.dart';

class Parallel extends StatelessWidget {

  static const String routeName = 'parallel';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SafeArea(
            child:
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Exams",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          )),
                      SizedBox(width: 50,),
                      Image.asset(
                        'assets/images/exam.png',
                        height: 50,
                        width: 50,
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  /*Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      boxShadow: [BoxShadow(
                          blurRadius: 20,color: Colors.grey.withOpacity(0.5)
                      ),],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15,left: 15),
                      child: TextField(
                        decoration: InputDecoration(hintText: "Find your course..",
                            border: InputBorder.none,
                            suffixIcon: Icon(Icons.search)),

                      ),
                    ),
                  ),*/
                  Text(
                    "Recent Exams",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign:TextAlign.start ,
                  ),
                  SizedBox(height: 30.0),
           ExamItem('Final parallel','2020'),
                  SizedBox(height: 10,),
                  ExamItem('MidTerm parallel','2021'),
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
              ExamItem('Answer of final exam','2020'),
                  SizedBox(height: 10,),
                  ExamItem('Answer of mid term','2021'),
                  SizedBox(height: 10,),

                  Center(
                    child: Text(
                      "View all",
                      style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 15.0),
                    ),)

                ]
                ,
              )
              ,

            )
        ));
  }
}