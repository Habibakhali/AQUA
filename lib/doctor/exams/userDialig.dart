import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'doc_exam.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class AddUserDialog extends StatefulWidget {
  final Function(User) addUser;
  AddUserDialog(this.addUser);
  @override
  _AddUserDialogState createState() => _AddUserDialogState();
  var icon = Icon(Icons.add);
}
class _AddUserDialogState extends State<AddUserDialog> {
  FilePickerResult? result;
  String? fileName;
  PlatformFile? pickedFile;
  bool isLoading = false;
  File? fileToDisplay;
  FilePickerResult? fileload;
  GlobalKey<FormState> formkey=GlobalKey<FormState>();

  var courseNameController = TextEditingController();
  var YearController = TextEditingController();
  var pdfController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Widget buildTextField(String hint, TextEditingController controller) {
      return Container(
        margin: EdgeInsets.all(4),
        child: TextFormField(
          validator: (value){
            if(value==null ||value.trim().isEmpty)
              return "${AppLocalizations.of(context)!.please_enter} $hint";
          },
          decoration: InputDecoration(
            labelText: hint,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black38,
              ),
            ),
          ),
          controller: controller,
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(8),
      height: 350,
      width: 400,
      child: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Text(
                'Add Exam',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.blueGrey,
                ),
              ),
              buildTextField(AppLocalizations.of(context)!.courses_title, courseNameController),
              buildTextField(AppLocalizations.of(context)!.year, YearController),
              Container(
                margin: EdgeInsets.only(top: 20),
                child :InkWell(
                  onTap: ()async {
                    print("===========================>?${fileload}");
                    fileload=await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['pdf', 'doc'],
                    );
                    if (fileload != null) {
                      widget.icon = Icon(Icons.check_circle_outline_sharp);
                      setState(() {

                      });
                    }
                  },
                  child: TextFormField(
                    controller: pdfController,
                    decoration: InputDecoration(
                      enabled: false,
                      errorStyle: TextStyle(color: Colors.red),
                      labelText: (AppLocalizations.of(context)!.upload_exam),
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                      prefixIcon: Icon(Icons.upload_outlined),
                      suffixIcon: widget.icon

                    ),
                  ),

                ),),
              fileload!=null?Text(fileload?.names.first!??"",textAlign: TextAlign.start,):Text(""),
              ElevatedButton(
                onPressed: () {
if(formkey.currentState!.validate()==true)
action();
                },
                child: Text(AppLocalizations.of(context)!.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
void action(){
  final user = User(courseNameController.text,YearController.text,fileload);
  widget.addUser(user);
  Navigator.of(context).pop();
}
}