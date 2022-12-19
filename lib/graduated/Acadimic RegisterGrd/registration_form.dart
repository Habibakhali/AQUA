import 'dart:io';
import 'dart:math';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/student/Registration%20Form/register_files.dart';

class RegistrationFormGrd extends StatefulWidget {
  static const String routeName = 'Rigestergrd';

  @override
  State<RegistrationFormGrd> createState() => _RegistrationFormGrdState();
}

class _RegistrationFormGrdState extends State<RegistrationFormGrd> {
  File? imageFile;
  List<File?>lastfile=[];

  chooseImage(ImageSource source) async {
    XFile? pickedFile = await ImagePicker().pickImage(source: source,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    setState(() {
      imageFile = File(pickedFile!.path);
      if(!lastfile.contains(imageFile)){
        lastfile.insert(lastfile.length, imageFile);
      }
       else _showToast(context);
    });
  }
  Widget showImage() {
    return  lastfile.isEmpty?Text(AppLocalizations.of(context)!.no_img,
      textAlign: TextAlign.center,):Container(
        child: Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: lastfile.length,
              itemBuilder: (_,index){
                return
                  Row(
                    children: [
                      RegisterFiles(lastfile[index],
                              (index){
                      lastfile.removeAt(index);
                      setState(() {
                      });},index),
                      SizedBox(width: 10,)
                    ],
                  );
              },
            )
        )
    );
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
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        backgroundColor: Colors.grey,
        content: const Text('your already uploaded this image')),
    );
  }
}
