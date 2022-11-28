import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/student/register_files.dart';

import '../selection_button.dart';

class RegistrationForm extends StatefulWidget {
  static const String routeName = 'Rigester';

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  File? imageFile;
  List<File?>lastfile=[];

  chooseImage(ImageSource source) async {
    XFile? pickedFile = await ImagePicker().pickImage(source: source,
      maxHeight: MediaQuery.of(context).size.height , maxWidth: MediaQuery.of(context).size.width,
    );
    setState(() {
      imageFile = File(pickedFile!.path);
      lastfile.insert(lastfile.length, imageFile);
    });
  }

  Widget showImage() {
    return lastfile.isNotEmpty?
      Container(
      child: Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: lastfile.length,
              itemBuilder: (_,index){
                return
                Row(
                  children: [
                    RegisterFiles(lastfile[index]),
                    SizedBox(width: 10,)
                  ],
                );
              },
          )
      )
    ):Text('No image selected',textAlign: TextAlign.center,);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      child: Center(
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: () {
                chooseImage(ImageSource.camera);
              },
              icon: Icon( // <-- Icon
                Icons.camera_alt_outlined,
                size: 24.0,
              ),
              label: Text('Choose Image From Camera'), // <-- Text
            ),
            Text('OR'),
            ElevatedButton.icon(
              onPressed: () {
                chooseImage(ImageSource.gallery);
              },
              icon: Icon( // <-- Icon
                Icons.image,
                size: 24.0,
              ),
              label: Text('Choose Image From Gallery'),),


            showImage(),
          ],
        ),
      ),
    );
  }
}
