import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:project/doctor/exams/userDialig.dart';
import 'package:open_file/open_file.dart';
import 'package:project/student/Courses/exam_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../student/Courses/pdf_viewer_final.dart';
import 'ExamDoc.dart';
class ExamDoc extends StatefulWidget {
static const String routeName="docname";
  @override
  State <ExamDoc> createState() => _ExamDocState();
}
class _ExamDocState extends State<ExamDoc> {
  List<User> userList = [];
  bool ispressed=false;
  @override
  Widget build(BuildContext context) {
    void addUserData(User user) {
      setState(() {
        userList.add(user);
      });
    }
    void showUserDialog() {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            content: AddUserDialog(addUserData),
          );

        },
      );
      ispressed=true;
    }
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed:() {showUserDialog()
    ;

          },
        child: Icon(Icons.add),
      ),
      body: ispressed==false?
            Center(child: Text(AppLocalizations.of(context)!.additem))
        :
              Container(
              height: 400,
              child:  ListView.builder(
          itemBuilder: (ctx, index) {
            return InkWell(
              child:
              ExamItemDoc(userList[index].coursName,userList[index].coursName,FinalPdfViewer.routeName,
                  userList[index].pdf
                      ),
            );
          },
          itemCount: userList.length,
        ),
      ),
    );
  }
}
class User{
  final String coursName;
  final String year;
  FilePickerResult? pdf;
  User(this.coursName, this.year,this.pdf);
}