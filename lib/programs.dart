import 'package:flutter/material.dart';
import 'package:project/partement.dart';
import 'package:project/select.dart';

class Programs extends StatefulWidget {
  static const String routeName = 'select_programs';

  @override
  State<Programs> createState() => _ProgramsState();
}

class _ProgramsState extends State<Programs> {
  List<String> programName = [
    'Computer Science',
    'Pure Math',
    'Statistic',
    'Statistic&Math',
    'Statistic&Computuer Science',
    'Math&Computer Science'
  ];
  List<String> programImage = [
    'assets/images/computer-science.png',
    'assets/images/math.png',
    'assets/images/static.png',
    'assets/images/static&math.png',
    'assets/images/static&cs.png',
    'assets/images/math&cs.png'
  ];
  List<String> routeNames = [
    SelectionPart.routename,
    Programs.routeName,
    Programs.routeName,
    Programs.routeName,
    Programs.routeName,
    Programs.routeName,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Image.asset('assets/images/img.png'),
          Expanded(
            child: GridView.builder(
                itemCount: programName.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  crossAxisCount: 2,
                ),
                itemBuilder: (_, index) {
                  return
                    Partment(programName[index], routeNames[index], programImage[index]);
                }),
          ),
          Text(
            'Quality assurance Unit\nAin Shams University',
            style: TextStyle(
              color: Color.fromRGBO(0, 22, 65, 0.7019607843137254),
            ),
            textAlign: TextAlign.center,
          ),
        ]),
      ),
    ));
  }
}
