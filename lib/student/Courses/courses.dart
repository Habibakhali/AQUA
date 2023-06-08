import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project/API/api_manager.dart';
import 'package:project/student/Courses/course_selected.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../API/Models/Student/store_course_re.dart';
import '../../providers/setting_provider.dart';

class Courses extends StatefulWidget {
  static const String routeName = 'Courses';
  List<String> sele = [];

  bool visited = false;

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  String selected = '1';
  String year = '1';
  List<bool> Selected = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  TextEditingController? _searchTextController;
  final FocusNode _node = FocusNode();
  late String token;
  late String email;
  late String password;
  List<String> courseName = [];

  void initState() {
    super.initState();
    _readCourses();
    _searchTextController = TextEditingController();
    _searchTextController?.addListener(() {
      setState(() {});
    });
  }


  _readCourses() async {
    final pref = await SharedPreferences.getInstance();
    var data = await ApiManager.getCourse();
    for (int i = 0; i < data.length; i++) {
      courseName.insert(i, data[i].cName! + '/' + data[i].cCode!);
    }
   if(pref.getInt('loginState')==1){
     pref.setInt('loginState', 0);
     Navigator.pop(context);
   }
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
    var pro = Provider.of<SettingProvider>(context);
    pro.ConnectionState();
    return !pro.result
        ? AlertDialog(
            title: Center(child: Text('No Internet')),
            content: Image.asset('assets/images/wi-fi-disconnected.png'),
          )
        : Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.welcome,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        Image.asset(
                          'assets/images/52355.jpg',
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
                            blurRadius: 20,
                            color: Colors.grey.withOpacity(0.5)),
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
                            hintText:
                                AppLocalizations.of(context)!.find_your_course,
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
                  _searchTextController!.text.isNotEmpty &&
                          itemsListSearch!.isEmpty
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
                      :  courseName.isEmpty?Center(child: CircularProgressIndicator(),):Expanded(
                              child: GridView.builder(
                                  itemCount:
                                      _searchTextController!.text.isNotEmpty
                                          ? itemsListSearch!.length
                                          : courseName.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8,
                                    crossAxisCount: 2,
                                  ),
                                  itemBuilder: (context, index) {
                                    return Selected[index]
                                        ? isSelected(
                                            _searchTextController!
                                                    .text.isNotEmpty
                                                ? itemsListSearch![index]
                                                : courseName[index],
                                            'assets/images/ocourse.png',
                                            index)
                                        : unSelected(
                                            _searchTextController!
                                                    .text.isNotEmpty
                                                ? itemsListSearch![index]
                                                : courseName[index],
                                            'assets/images/ocourse.png',
                                            index);
                                  }),),
                  Center(
                    child: _searchTextController!.text.isNotEmpty
                        ? Text("")
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {});
                                    showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) => StatefulBuilder(
                                                builder: (context,
                                                    StateSetter setState) {
                                              return SimpleDialog(
                                                title: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(AppLocalizations
                                                                .of(context)!
                                                            .select_semester),
                                                        InkWell(
                                                            onTap: () {
                                                              flutterYearPicker(
                                                                  context);
                                                            },
                                                            child: Text(
                                                              'level: ${year}',
                                                            ))
                                                      ],
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
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .secondaryHeaderColor,
                                                children: [
                                                  InkWell(
                                                      child: Row(
                                                        children: [
                                                          Text(AppLocalizations
                                                                  .of(context)!
                                                              .semester1),
                                                        ],
                                                      ),
                                                      onTap: () {
                                                        setState(() {
                                                          selected = '1';
                                                        });
                                                        Navigator.of(context)
                                                            .pop();
                                                      }),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  InkWell(
                                                      child: Row(
                                                        children: [
                                                          Text(AppLocalizations
                                                                  .of(context)!
                                                              .semester2),
                                                        ],
                                                      ),
                                                      onTap: () {
                                                        selected = '2';
                                                        setState(() {});
                                                        Navigator.of(context)
                                                            .pop();
                                                      }),
                                                ],
                                              );
                                            },),);
                                    setState(() {});
                                  },
                                  child: Text(
                                      'Select semester: ${year + selected}'),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      print('===========>${data!.body}');
                                      Navigator.pushReplacementNamed(
                                        context,
                                        CourseSelected.routeName,
                                      );
                                    },
                                    child: Text(
                                        AppLocalizations.of(context)!.select)),
                              ]),
                  ),
                ],
              ),
            ),
          );
  }
  int? id;
  Widget isSelected(String x, String y, int index) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        ElevatedButton(
          onPressed: () {
            Selected[index]=!Selected[index];
            ApiManager
                .delCourseReservation(id!);
            setState(() {

            });
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

  http.Response? data;

  Widget unSelected(String x, String y, int index) {
    return ElevatedButton(
      onPressed: () async {
        Selected[index]=!Selected[index];
        print(Selected[index]);
        if (courseName.contains(x)) {
          print('iam here ');
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) =>
                  StatefulBuilder(builder:
                      (context, StateSetter setState) {
                    return SimpleDialog(
                        title: Container(
                            padding: EdgeInsets.all(10),
                            child: Center(
                              child:
                              CircularProgressIndicator(),
                            )));
                  }));
          data = await ApiManager.storeCourseReservation(
              x.split('/').last, (year+selected).toString());
        var json=jsonDecode(data!.body);
        print(data!.statusCode);
        print(data!.body);
        if(data!.statusCode==200){
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Subject has been registered successfully")));}
        else{
          Navigator.pop(context);
          Selected[index]=!Selected[index];
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Something went wrong,try again')));
        }
        var res=StoreCourseReservation.fromJson(json);
        if(res.payload!=null){
        id=(res.payload!.id);
        print(id);
        }}
        setState(() {

        });
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
                       year = (1 + index).toString();
                        print('------------------------------>${year}');
                        Navigator.pop(context, year);
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
