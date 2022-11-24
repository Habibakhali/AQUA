import 'package:flutter/material.dart';
import 'package:project/partement.dart';
import 'package:project/select.dart';

class Programs extends StatefulWidget {
  static const String routeName = 'select_programs';
  @override
  State<Programs> createState() => _ProgramsState();
}

class _ProgramsState extends State<Programs> {
  List<String> values = [
    'Computer Sciences ',
    'Pure Math',
    'Statistic',
    'Statistic and Math',
    'Statistic and Computer Sciences',
    'Math and Computer Science',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 10,),
                  Image.asset('assets/images/logo_blue.png'),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Expanded(
                        child: Partment('Computer Science', SelectionPart.routename,
                            'assets/images/computer-science.png'),
                      ),
                      SizedBox(width: 8,),
                      Expanded(
                        child: Partment('Pure Math', '',
                            'assets/images/math.png'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Partment('Statistic', '',
                            'assets/images/static.png'),
                      ),
                      SizedBox(width: 8,),
                      Expanded(
                        child: Partment('Statistic&Math', '',
                            'assets/images/static&math.png'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Partment('''Statistic &
Computer Science''', '',
                            'assets/images/static&cs.png'),
                      ),
                      SizedBox(width: 8,),
                      Expanded(
                        child: Partment('''Math &
 Computer Science''', '',
                            'assets/images/math&cs.png'),
                      ),

                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Quality assurance Unit',style: TextStyle(color: Color.fromRGBO(
                          0, 22, 65, 0.7019607843137254)),),
                    ],
                  ),Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Ain Shams University',style: TextStyle(color: Color.fromRGBO(
                          0, 22, 65, 0.7019607843137254)),),
                    ],
                  ),        ]),

        ));
  }
}
