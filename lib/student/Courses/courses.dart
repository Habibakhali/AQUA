import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project/API/Models/get_curses.dart';
import 'package:project/API/api_manager.dart';
import 'package:project/student/Courses/course_selected.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Courses extends StatefulWidget {
  static const String routeName = 'Courses';
  List<String> sele = [];

  List<bool> Selected = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  bool visited = false;

  @override
  State<Courses> createState() => _CoursesState();
}
class _CoursesState extends State<Courses> {
  TextEditingController? _searchTextController;
  final FocusNode _node = FocusNode();
  late String token;
  late String email;
  late String password;
  List<String>courseName=[];
  void initState() {
    super.initState();
   _readCourses();
    _searchTextController = TextEditingController();
    _searchTextController?.addListener(() {
      setState(() {});
    });
  }
  _readCourses()async{
    final pref=await SharedPreferences.getInstance();
    token=pref.getString('token')!;
    email=pref.getString('email')!;
    password=pref.getString('password')!;
  var data=await ApiManager.getCourse(email,password , token);
  List<Payloadd> name=GetCourses.fromJson(jsonDecode(data.body)).payload!;
  for(int i=0;i<name.length;i++){
    courseName.insert(i, name[i].cName!);
  }
  setState(() {

  });
  print('++++++++++++++++++++++> $courseName');
}
  List<String>? itemsListSearch;

  @override
  void dispose() {
    super.dispose();
    _node.dispose();
    _searchTextController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /*List<String> courseName = [
      AppLocalizations.of(context)!.parallel,
      AppLocalizations.of(context)!.ai,
      AppLocalizations.of(context)!.project_a,
      AppLocalizations.of(context)!.image_process,
      AppLocalizations.of(context)!.security,
      AppLocalizations.of(context)!.geomety,
    ];*/
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                AppLocalizations.of(context)!.welcome,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Image.asset(
                'assets/images/boyy.png',
                height: 100,
                width: 100,
              ),
            ]),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 20, color: Colors.grey.withOpacity(0.5)),
                ],
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      itemsListSearch = courseName
                          .where((element) => element
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                      if (_searchTextController!.text.isNotEmpty &&
                          itemsListSearch!.isEmpty) {
                        print(
                            'itemsListSearch legnth${itemsListSearch!.length}');
                      }
                    });
                  },
                  controller: _searchTextController,
                  focusNode: _node,
                  decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.find_your_course,
                      //filled: true,
                      //fillColor: Theme.of(context).canvasColor,
                      hintStyle: Theme.of(context).textTheme.bodySmall,
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Theme.of(context).canvasColor,
                      ),
                      suffixIcon: IconButton(
                        onPressed: _searchTextController!.text.isEmpty
                            ? null
                            : () {
                                _searchTextController?.clear();
                                _node.unfocus();
                              },
                        icon: Icon(
                          Icons.cancel,
                          color: _searchTextController!.text.isNotEmpty
                              ? Colors.red
                              : Colors.transparent,
                        ),
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              AppLocalizations.of(context)!.choose_course,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 60,
              height: 2,
              color: const Color(0xffFD6D8D),
            ),
            const SizedBox(
              height: 20,
            ),
            _searchTextController!.text.isNotEmpty && itemsListSearch!.isEmpty
                ? Expanded(
                    child: SingleChildScrollView(
                      child: Center(
                        child: Column(
                          children: const [
                            //child:
                            Icon(Icons.search_off, size: 130),
                            Text(
                              "No result found, \nplease try different keyword",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: GridView.builder(
                        itemCount: _searchTextController!.text.isNotEmpty
                            ? itemsListSearch!.length
                            : courseName.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          return widget.Selected[index]
                              ? isSelected(
                                  _searchTextController!.text.isNotEmpty
                                      ? itemsListSearch![index]
                                      : courseName[index],
                                  'assets/images/ocourse.png',
                                  index)
                              : unSelected(
                                  _searchTextController!.text.isNotEmpty
                                      ? itemsListSearch![index]
                                      : courseName[index],
                                  'assets/images/ocourse.png',
                                  index);
                        }),
                  ),
            Center(
              child: _searchTextController!.text.isNotEmpty
                  ? Text("")
                  : ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, CourseSelected.routeName,
                            arguments: CourseArg(widget.sele));
                      },
                      child: Text(AppLocalizations.of(context)!.select)),
            ),
          ],
        ),
      ),
    );
  }

  Widget isSelected(String x, String y, int index) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        ElevatedButton(
          onPressed: () {
            widget.Selected[index] = !widget.Selected[index];
            if (widget.sele.contains(x)) widget.sele.remove(x);
            setState(() {});
          },
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Center(
                      child: Image.asset(
                    y,
                  ))),
              Expanded(
                  child: Text(
                x,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              )),
            ],
          ),
        ),
        Icon(
          Icons.done_outline,
          color: Colors.white,
        )
      ],
    );
  }

  Widget unSelected(String x, String y, int index) {
    return ElevatedButton(
      onPressed: () {
        widget.Selected[index] = !widget.Selected[index];
        if (!widget.sele.contains(x)) widget.sele.add(x);
        setState(() {});
      },
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Image.asset(
                y,
              )),
          Expanded(
              child: Text(
            x,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          )),
        ],
      ),
    );
  }
}

class CourseArg {
  List<String> s = [];

  CourseArg(this.s);
}
