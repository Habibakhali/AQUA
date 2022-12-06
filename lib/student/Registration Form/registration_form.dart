import 'dart:io';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/student/Registration%20Form/register_files.dart';

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
    ):Text(AppLocalizations.of(context)!.no_img,textAlign: TextAlign.center,);
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
              label: Text(AppLocalizations.of(context)!.capture_img), // <-- Text
            ),
            Text(AppLocalizations.of(context)!.or),
            ElevatedButton.icon(
              onPressed: () {
                chooseImage(ImageSource.gallery);
              },
              icon: Icon( // <-- Icon
                Icons.image,
                size: 24.0,
              ),
              label: Text(AppLocalizations.of(context)!.gallery_img),),


            showImage(),
          ],
        ),
      ),
    );
  }
}