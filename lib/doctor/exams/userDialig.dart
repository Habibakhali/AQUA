import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'doc_exam.dart';
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


  @override
  Widget build(BuildContext context) {
    Widget buildTextField(String hint, TextEditingController controller) {
      return Container(
        margin: EdgeInsets.all(4),
        child: TextField(
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
    var courseNameController = TextEditingController();
    var YearController = TextEditingController();
    var pdfController = TextEditingController();
    return Container(
      padding: EdgeInsets.all(8),
      height: 350,
      width: 400,
      child: SingleChildScrollView(
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
            buildTextField('course name', courseNameController),
            buildTextField('year', YearController),
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
                    setState(() {});
                  }
                },
                child: TextFormField(
                  decoration: InputDecoration(
                    enabled: false,
                    errorStyle: TextStyle(color: Colors.red),
                    labelText: ("upload exam"),
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    prefixIcon: Icon(Icons.upload_outlined),

                  ),
                ),

              ),),
            fileload!=null?Text(fileload?.names.first!??"",textAlign: TextAlign.start,):Text(""),
            ElevatedButton(
              onPressed: () {

                final user = User(courseNameController.text,YearController.text,fileload
                );
                widget.addUser(user);
                Navigator.of(context).pop();

              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

}