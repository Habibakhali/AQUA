import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../MyDesign/buildTextField.dart';
import '../../graduated/personal setting/profileGrd.dart';

class PersonalSetting extends StatefulWidget {
  static const String routeName = 'profgrd';

  @override
  State<PersonalSetting> createState() => _PersonalSettingState();
}

class _PersonalSettingState extends State<PersonalSetting> {
  Image x = Image.asset('assets/images/qa.png');

  bool showPassword = false;

  final txtController = TextEditingController();

  File? _image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) {
        return;
      }
      File? imageTemporary = File(image.path);
      _image = await _cropImage(imageFile: imageTemporary);

      setState(() => _image = imageTemporary);
    } on Exception catch (e) {
      print('failed to pick image');
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
    await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  @override
  Widget build(BuildContext context) {
    FilePickerResult? fileload;
    return  Container(
      padding: EdgeInsets.only(left: 16, top: 25, right: 16),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          children: [
            /*Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),*/
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 10))
                      ],
                      shape: BoxShape.circle,
                      /*image: DecorationImage(
                              fit: BoxFit.cover,
             image: Image.asset('assets/images/boy.png'),
                    ),*/
                    ),
                    child: _image != null
                        ? CircleAvatar(
                        backgroundImage: FileImage(File(_image!.path)))
                        : Image.asset('assets/images/qa.png'),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: Colors.blue,
                        ),
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Expanded(
                                  child: SimpleDialog(
                                    title: const Text('Choose Image'),
                                    children: <Widget>[
                                      SimpleDialogOption(
                                        onPressed: () {
                                          pickImage(ImageSource.gallery);
                                          Navigator.pop(context);
                                        },
                                        child: const Text('From gallery'),
                                      ),
                                      SimpleDialogOption(
                                        onPressed: () {
                                          pickImage(ImageSource.camera);
                                          Navigator.pop(context);
                                        },
                                        child: const Text('From camera'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.edit),
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            BuildTextField(
                AppLocalizations.of(context)!.prof_name,
                AppLocalizations.of(context)!.hint_prof_name,
                false,
                false,
                TextInputType.text),
            BuildTextField(
                AppLocalizations.of(context)!.email_label,
                "30010548@sci.asu.edu.eg",
                false,
                true,
                TextInputType.emailAddress),
            BuildTextField(AppLocalizations.of(context)!.password_label,
                "**********", false, true, TextInputType.visiblePassword),
            BuildTextField(AppLocalizations.of(context)!.phone, "0100057256",
                false, false, TextInputType.number),
            BuildTextField(
                AppLocalizations.of(context)!.location,
                AppLocalizations.of(context)!.address,
                false,
                false,
                TextInputType.streetAddress),
            TextField(
              decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.birth_date),
              onTap: _selDatePicker,
              controller: txtController,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child :InkWell(
                onTap: ()async {
                  fileload=await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['pdf', 'doc'],
                  );
                },
                child: TextFormField(
                  decoration: InputDecoration(
                    enabled: false,
                    errorStyle: TextStyle(color: Colors.red),
                    labelText: AppLocalizations.of(context)!.cv,
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    prefixIcon: Icon(Icons.upload_outlined),

                  ),
                ),
              ),),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    elevation: MaterialStateProperty.all(1),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(AppLocalizations.of(context)!.cancel,
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.blue)),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.blue),
                        elevation: MaterialStateProperty.all(1),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text(
                                AppLocalizations.of(context)!.dialog_sucesse),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);

                                },
                                child: Text(
                                  AppLocalizations.of(context)!.ok,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text(AppLocalizations.of(context)!.save,
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.white))),
              ],
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  void _selDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        txtController.text = DateFormat.yMd().format(pickedDate);
      });
    });
  }

  Widget buildTextField(String labelText, String placeholder,
      bool isPasswordTextField, bool read, TextInputType type) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        keyboardType: type,
        readOnly: read,
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.grey,
              ),
            )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              color: Colors.black,
            )),
      ),
    );
  }}
