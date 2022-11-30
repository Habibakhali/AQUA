import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AcadimecRegsteration extends StatefulWidget {
  static const String routeName = 'AcadimecRegsteration';

  @override
  State<AcadimecRegsteration> createState() => _AcadimecRegsterationState();
}

class _AcadimecRegsterationState extends State<AcadimecRegsteration> {
  File? imageFile;
  String status = '';

  startUpload() {}

  chooseImage(ImageSource source) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: source,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    setState(() {
      imageFile = File(pickedFile!.path);
    });
  }

  Widget showImage() {
    return Flexible(
        child: imageFile != null
            ? Container(
                child: Image.file(imageFile!),
              )
            : Text(
                AppLocalizations.of(context)!.no_img,
                textAlign: TextAlign.center,
              ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          children: [
            /* OutlinedButton(onPressed: (){chooseImage(ImageSource.camera);}, child: Text('Choose Image'),),
              SizedBox(height: 20.0,),*/
            ElevatedButton.icon(
              onPressed: () {
                chooseImage(ImageSource.camera);
              },
              icon: Icon(
                // <-- Icon
                Icons.camera_alt_outlined,
                size: 24.0,
              ),
              label:
                  Text(AppLocalizations.of(context)!.capture_img), // <-- Text
            ),
            Text(AppLocalizations.of(context)!.or),
            ElevatedButton.icon(
              onPressed: () {
                chooseImage(ImageSource.gallery);
              },
              icon: Icon(
                // <-- Icon
                Icons.image,
                size: 24.0,
              ),
              label: Text(AppLocalizations.of(context)!.gallery_img),
            ),
            showImage(),
            SizedBox(
              height: 20.0,
            ),
            OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: startUpload,
              child: Text(AppLocalizations.of(context)!.upload_img),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              status,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
