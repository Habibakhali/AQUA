import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../MyDesign/buildTextField.dart';

class ProfileGrd extends StatefulWidget {
  static const String routeName = 'profgrd';

  bool visible = true;
  @override
  State<ProfileGrd> createState() => _ProfileGrdState();
}

class _ProfileGrdState extends State<ProfileGrd> {
  TextEditingController dob=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController address=TextEditingController();
  TextEditingController gradBatch=TextEditingController();
  TextEditingController department=TextEditingController();
  TextEditingController specialzation=TextEditingController();
  TextEditingController scientificDegree=TextEditingController();
  TextEditingController academicCer=TextEditingController();
  TextEditingController academicRec=TextEditingController();
  TextEditingController gpa=TextEditingController();
  TextEditingController cv=TextEditingController();
  TextEditingController courses=TextEditingController();
  TextEditingController awards=TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Image x = Image.asset('assets/images/qa.png');

  bool showPassword = false;

  final txtController = TextEditingController();

  File? _image;
  File? imageFile;
  var pickedFile;
  String status = '';

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
  chooseImage(ImageSource source) async {
    pickedFile = await ImagePicker().pickImage(
      source: source,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    print('statius: $status');
    setState(() {
      widget.visible = true;
      imageFile = File(pickedFile!.path);
    });
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
    return Container(
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
        Form(child: Container(
    margin: EdgeInsets.symmetric(horizontal: 20),
    child:  Column(
    children: [
            TextFormField(
              decoration: InputDecoration(
    labelStyle: TextStyle(color: Colors.grey),
                  labelText: AppLocalizations.of(context)!.birth_date),
              onTap: _selDatePicker,
              controller: dob,
            ),
            SizedBox(height: 10,),

      buildTextField("phone","Enter your phone number",TextInputType.phone,phone,"please enter your phone number"),
      buildTextField("address","Enter your address",TextInputType.text,address,"please enter your phone address"),
      buildTextField("graduation batch", "Enter your graduation batch",
              TextInputType.text,gradBatch,"please enter your graduation batch"),
            buildTextField("department", "Enter your department",
                TextInputType.text,department,"please enter your department"),
            buildTextField("specialization", "Enter your specialization", TextInputType.text,specialzation
            ,"please enter your specialization"),
            buildTextField("scientific degree", "Enter scientific degree",
                TextInputType.number,scientificDegree,"please enter scientific degree"),
            buildTextField(
                "gpa", "Enter your gpa",TextInputType.number,gpa,"please enter your gpa"),
Row(
  children: [
    Expanded(
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'field',
          border: OutlineInputBorder(),
        ),
      ),
    ),
    SizedBox(width:5),
    Expanded(
      child: TextFormField(
        controller: courses,
        decoration: InputDecoration(
          labelText: 'Courses',
          border: OutlineInputBorder(),
        ),
      ),
    ),


  ],
),
      SizedBox(height: 10,),
      Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'field',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(width: 5,),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'awards',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: InkWell(
    onTap: () {
    showDialog(
    context: context,
    builder: (BuildContext context) {
    return Expanded(
    child: SimpleDialog(
    title: const Text('Choose Image'),
    children: <Widget>[
    SimpleDialogOption(
    onPressed: () {
    chooseImage(ImageSource.gallery);
    Navigator.pop(context);
    },
    child: const Text('From gallery'),
    ),
    SimpleDialogOption(
    onPressed: () {
      chooseImage(ImageSource.camera);
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
                child: TextFormField(
                  decoration: InputDecoration(
                    enabled: false,
                    errorStyle: TextStyle(color: Colors.red),
                    labelText: 'Academic certificates',
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    prefixIcon: Icon(Icons.upload_outlined),
                  ),
                ),
              ),
            ),
      Container(
        margin: EdgeInsets.only(top: 20),
        child: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Expanded(
                  child: SimpleDialog(
                    title: const Text('Choose Image'),
                    children: <Widget>[
                      SimpleDialogOption(
                        onPressed: () {
                          chooseImage(ImageSource.gallery);
                          Navigator.pop(context);
                        },
                        child: const Text('From gallery'),
                      ),
                      SimpleDialogOption(
                        onPressed: () {
                          chooseImage(ImageSource.camera);
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
          child: TextFormField(
            decoration: InputDecoration(
              enabled: false,
              errorStyle: TextStyle(color: Colors.red),
              labelText: 'Graduation certificate',
              labelStyle: Theme.of(context).textTheme.bodyMedium,
              prefixIcon: Icon(Icons.upload_outlined),
            ),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20),
        child: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Expanded(
                  child: SimpleDialog(
                    title: const Text('Choose Image'),
                    children: <Widget>[
                      SimpleDialogOption(
                        onPressed: () {
                          chooseImage(ImageSource.gallery);
                          Navigator.pop(context);
                        },
                        child: const Text('From gallery'),
                      ),
                      SimpleDialogOption(
                        onPressed: () {
                          chooseImage(ImageSource.camera);
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
          child: TextFormField(
            decoration: InputDecoration(
              enabled: false,
              errorStyle: TextStyle(color: Colors.red),
              labelText: 'Academic Record',
              labelStyle: Theme.of(context).textTheme.bodyMedium,
              prefixIcon: Icon(Icons.upload_outlined),
            ),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20),
        child: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Expanded(
                  child: SimpleDialog(
                    title: const Text('Choose Image'),
                    children: <Widget>[
                      SimpleDialogOption(
                        onPressed: () {
                          chooseImage(ImageSource.gallery);
                          Navigator.pop(context);
                        },
                        child: const Text('From gallery'),
                      ),
                      SimpleDialogOption(
                        onPressed: () {
                          chooseImage(ImageSource.camera);
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
          child: TextFormField(
            decoration: InputDecoration(
              enabled: false,
              errorStyle: TextStyle(color: Colors.red),
              labelText: 'CV',
              labelStyle: Theme.of(context).textTheme.bodyMedium,
              prefixIcon: Icon(Icons.upload_outlined),
            ),
          ),
        ),
      ),


  ]),)),
           /* SizedBox(
              height: 20,
            ),
            BuildTextField(
                AppLocalizations.of(context)!.job_title,
                AppLocalizations.of(context)!.job_title_hint,
                false,
                false,
                TextInputType.text),
            BuildTextField(
                AppLocalizations.of(context)!.start_date,
                AppLocalizations.of(context)!.start_date_hint,
                false,
                false,
                TextInputType.text),
            BuildTextField(
                AppLocalizations.of(context)!.end_date,
                AppLocalizations.of(context)!.end_date_hint,
                false,
                false,
                TextInputType.text),
            BuildTextField("company name", "company name", false, false,
                TextInputType.text),
            BuildTextField("company email", "company email", false, false,
                TextInputType.text),
            BuildTextField("company name", "company name", false, false,
                TextInputType.text),
            BuildTextField("company address", "company address", false, false,
                TextInputType.text),
            BuildTextField("company type", "company type", false, false,
                TextInputType.text),

            */
            TextButton(
              onPressed: () async {
                const url =
                    'https://docs.google.com/forms/d/e/1FAIpQLSc9AXGfkkO0AJzTdPPh5iQwpKEs0O51FW96BAHemQ8pcdg91A/viewform';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Text(
                AppLocalizations.of(context)!.qa,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
            ),
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
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
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
     TextInputType type,TextEditingController cont, String x) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextFormField(
        validator: (value) {
          if(value == null || value.trim().isEmpty) {
            return x;
          }
          return null;
        },
        controller: cont,
        keyboardType: type,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            )),
      ),
    );
  }
}