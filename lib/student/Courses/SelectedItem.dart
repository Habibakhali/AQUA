import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project/API/api_manager.dart';
import 'package:project/student/Courses/questionnair_homeScreen.dart';
import 'package:project/student/Courses/questionner/Form_questionner.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../API/Models/Student/show_course_details.dart';
import '../../API/Models/get_course_reservation.dart';
import 'courses.dart';
import 'exam.dart';

class SeleCtedITemCoure extends StatefulWidget {
  static String routeName = "selction screenhome";

  @override
  State<SeleCtedITemCoure> createState() => _SeleCtedITemCoureState();
}

class _SeleCtedITemCoureState extends State<SeleCtedITemCoure> {
  @override
  void initState() {
    // TODO: implement initState
    _getSelectedCourses();
  }

  List<String> coursesSelectedCourses = [];
  List<int> idCourse = [];
  List<PayloadcourseReservation>? play;

  _getSelectedCourses() async {
    final pref = await SharedPreferences.getInstance();
    print(pref.getString('token'));
    play = await ApiManager.getCourseReservation();
    print(play!.length);
    for (int i = 0; i < play!.length; i++) {
      ShowCourseDetails data = await ApiManager.showCourses(play![i].cCode!);
      coursesSelectedCourses.insert(i, data.payload!.cName!);
      idCourse.insert(i, play![i].id!);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            AppLocalizations.of(context)!.subject,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
                itemCount: coursesSelectedCourses!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.15),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(6)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Center(child: Text('Delete')),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text('Are you sure?'),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              OutlinedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.cancel,
                                                          color: Colors.grey),
                                                      Text(
                                                        'Cancel',
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                      )
                                                    ],
                                                  )),
                                              OutlinedButton(
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.red),
                                                  onPressed: () async {

                                                    bool data = await ApiManager
                                                        .delCourseReservation(
                                                            idCourse[index]);
                                                    if (data) {
                                                      coursesSelectedCourses
                                                          .removeAt(index);
                                                      setState(() {});
                                                      Navigator.pop(context);
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(SnackBar(
                                                              content: Text(
                                                                  'Sorry,try again to delete')));
                                                      Navigator.pop(context);
                                                    }
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.delete,
                                                        color: Colors.white,
                                                      ),
                                                      Text(
                                                        "Delete",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )
                                                    ],
                                                  ))
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: Icon(
                              Icons.clear,
                              color: Colors.red,
                            )),
                        Expanded(
                            flex: 4,
                            child: InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => SimpleDialog(
                                            title: Column(
                                              children: [
                                                Text(
                                                  AppLocalizations.of(context)!
                                                      .select,
                                                ),
                                                Divider(
                                                  thickness: 1,
                                                )
                                              ],
                                            ),
                                            contentPadding: EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                bottom: 20,
                                                top: 5),
                                            backgroundColor: Theme.of(context)
                                                .secondaryHeaderColor,
                                            children: [
                                              InkWell(
                                                  child: Row(
                                                    children: [
                                                      Text(AppLocalizations.of(
                                                              context)!
                                                          .exam),
                                                    ],
                                                  ),
                                                  onTap: () {
                                                    Navigator
                                                        .pushReplacementNamed(
                                                      context,
                                                      Exam.routeName,
                                                    );
                                                  }),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              InkWell(
                                                  child: Row(
                                                    children: [
                                                      Text(AppLocalizations.of(
                                                              context)!
                                                          .questioner),
                                                    ],
                                                  ),
                                                  onTap: () {
                                                    Navigator
                                                        .pushReplacementNamed(
                                                      context,
                                                      QUestionHome.routeName,
                                                    );
                                                  }),
                                            ],
                                          ));
                                },
                                child: Image.asset(
                                  'assets/images/ocourse.png',
                                  width: 150,
                                  height: 150,
                                ))),
                        Expanded(
                            child: Center(
                          child: Text(
                            coursesSelectedCourses![index],
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
