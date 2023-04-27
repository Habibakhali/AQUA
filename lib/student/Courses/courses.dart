import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project/API/Models/get_curses.dart';
import 'package:project/API/api_manager.dart';
import 'package:project/student/Courses/course_selected.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class Courses extends StatefulWidget {
  static const String routeName = 'Courses';
  List<String> sele = [];
  String year = '1';
  List<bool> Selected = [
    false, false, false, false, false, false, false, false,
    false,false, false, false, false, false, false,
    false,
    false, false,
    false, false,
    false,
  ];
  bool visited = false;

  @override
  State<Courses> createState() => _CoursesState();
}
class _CoursesState extends State<Courses>{
  String selected = '1';
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
  int x=0;
  _readCourses()async{
    final pref=await SharedPreferences.getInstance();
   // ApiManager.storeCourses(cCode, cName, cHour, cPrereq, semester);
    var data=await ApiManager.getCourse();
  List<Payloadd> name=GetCourses.fromJson(jsonDecode(data.body)).payload!;
  for(int i=0;i<name.length;i++){
    courseName.insert(i, name[i].cName!+'/'+name[i].cCode!);
  }
  data.isRedirect?x=0:x=1;
  setState(() {});
  print('++++++++++++++++++++++> $courseName');
  print('++++++++++++++++++++++> ${courseName.length}');
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
                : x==0?Center(child: CircularProgressIndicator()):Expanded(
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
                          return  widget.Selected[index]?
                          isSelected(
                              _searchTextController!.text.isNotEmpty
                                  ? itemsListSearch![index]
                                  : courseName[index],
                              'assets/images/ocourse.png',
                              index)
                              :
                          unSelected(
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
                  : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:[
                      InkWell(
                          onTap: (){
setState(() {

});                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => StatefulBuilder(
                                    builder: (context, StateSetter setState) {
                                      return SimpleDialog(
                                        title: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(AppLocalizations.of(context)!
                                                    .select_semester),
                                                InkWell(
                                                    onTap: () {
                                                      flutterYearPicker(context);
                                                    },
                                                    child: Text(
                                                      'level: ${widget.year}',
                                                    ))
                                              ],
                                            ),
                                            Divider(
                                              thickness: 1,
                                            )
                                          ],
                                        ),
                                        contentPadding: EdgeInsets.only(
                                            left: 20, right: 20, bottom: 20, top: 5),
                                        backgroundColor:
                                        Theme.of(context).secondaryHeaderColor,
                                        children: [
                                          InkWell(
                                              child: Row(
                                                children: [
                                                  Text(AppLocalizations.of(context)!
                                                      .semester1),
                                                ],
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  selected = '1';
                                                });
                                                Navigator.of(context).pop();
                                              }),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          InkWell(
                                              child: Row(
                                                children: [
                                                  Text(AppLocalizations.of(context)!
                                                      .semester2),
                                                ],
                                              ),
                                              onTap: () {
                                                selected = '2';
                                                setState(() {});
                                                Navigator.of(context).pop();
                                              }),
                                        ],
                                      );
                                    }));
                            setState(() {});
                          },
                          child:                       Text('Select semester: ${widget.year+selected}'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print('===========>${data!.body}');
                       Navigator.pushReplacementNamed(
                              context, CourseSelected.routeName,
                           );
//                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("something went wrong")));

                        },
                        child: Text(AppLocalizations.of(context)!.select)),

                    ]
                  ),
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
            //if (widget.sele.contains(x)) widget.sele.remove(x);
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
  }http.Response? data;
  Widget unSelected(String x, String y, int index) {
    return ElevatedButton(
      onPressed: () async{
        widget.Selected[index] = !widget.Selected[index];
        if (!widget.sele.contains(x)){
          data=await ApiManager.storeCourseReservation(x.split('/').last, widget.year+selected);
        }
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
  Future flutterYearPicker(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        final Size size = MediaQuery.of(context).size;
        return AlertDialog(
          title: Column(
            children: [
              Text(AppLocalizations.of(context)!.select_year),
              Divider(
                thickness: 1,
              )
            ],
          ),
          backgroundColor: Theme.of(context).secondaryHeaderColor,
          content: SizedBox(
            height: size.height * 0.08,
            child: GridView.count(
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 4,
              childAspectRatio: 1.5 / 1,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              children: [
                ...List.generate(4, (index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        widget.year = (1 + index).toString();
                        print('------------------------------>${widget.year}');
                        Navigator.pop(context, widget.year);
                      });
                    },
                    child: Chip(
                      backgroundColor: Theme.of(context).primaryColor,
                      label: Container(
                        child: Text(
                          (1 + index).toString(),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}



