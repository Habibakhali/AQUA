import 'package:flutter/material.dart';

import '../partement.dart';

class Courses extends StatelessWidget {
  static const String routeName = 'Courses';
  List<String> courseName = [
    'parallel',
    'image processing',
    'Artificial intelligence',
    'Project A',
    'Cyber Security',
    'Geometric',
  ];
  List<String> coursesRoutes = [
    Courses.routeName,
    Courses.routeName,
    Courses.routeName,
    Courses.routeName,
    Courses.routeName,
    Courses.routeName,


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Hi,",
                            style: TextStyle(
                              color: Color(0xffFD6D8D),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            )),
                        TextSpan(
                            text: "Sara",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            )),
                      ]),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.handshake,
                      color: Colors.amber,
                    ),]),
          Image.asset(
            'assets/images/boyy.png',
            height: 100,
            width: 100,
          ),

            ]),
            Text(
              "Welcome",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
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
            ),
            SizedBox(height: 20,),
            Text("choose your course",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 27),),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 60,
              height: 2,
              color: Color(0xffFD6D8D),
            ),
            SizedBox(
              height:20 ,
            ),
            Expanded(child:
            GridView.builder(
                itemCount: courseName.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return
                    Partment(courseName[index],coursesRoutes[index],'assets/images/ocourse.png');
                }),),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


              ],
            )
          ],
            )

        ));
  }
}
