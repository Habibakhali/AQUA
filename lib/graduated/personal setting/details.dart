import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project/API/Models/graduated/details.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../API/api_manager.dart';


class ProfileGrd extends StatefulWidget {
  static const String routeName = 'profgrd';

  bool visible = true;

  @override
  State<ProfileGrd> createState() => _ProfileGrdState();
}

class _ProfileGrdState extends State<ProfileGrd> {
  TextEditingController dob = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController gradBatch = TextEditingController();
  TextEditingController department = TextEditingController();
  TextEditingController specialzation = TextEditingController();
  TextEditingController scientificDegree = TextEditingController();
  TextEditingController academicCer = TextEditingController();
  TextEditingController academicRec = TextEditingController();
  TextEditingController gpa = TextEditingController();
  TextEditingController fildCourses = TextEditingController();
  TextEditingController fildAward = TextEditingController();
  TextEditingController cv = TextEditingController();
  TextEditingController courses = TextEditingController();
  TextEditingController awards = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Image x = Image.asset('assets/images/qa.png');
  bool showPassword = false;
  int id = 0;
  final txtController = TextEditingController();
  File? _image;
  var pickedFile;
  String status = '';
  File? CV;
  File? Academic;
  File? Record;
  File? Certificate;
  int i = 0;

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
    setState(() {
      widget.visible = true;
      if (i == 1)
        Academic = File(pickedFile!.path);
      else if (i == 2)
        Certificate = File(pickedFile!.path);
      else if (i == 3)
        Record = File(pickedFile!.path);
      else if (i == 4) CV = File(pickedFile!.path);
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
                                return SimpleDialog(
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
            Form(
                key: formKey,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(children: [
                    TextFormField(
                        validator: (text) {
                          if (text == null || text.trim().isEmpty)
                            return 'please enter your birth date';
                          return null;
                        },
                        controller: dob,
                        //editing controller of this TextField
                        decoration: const InputDecoration(
                          //icon of text field
                          labelText: "Birth date",
                          hintText: 'Enter your Birth date',
                          //label text of field,
                        ),
                        readOnly: true,
                        // when true user cannot edit text
                        onTap: () async {
                          _selDatePicker();
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    buildTextField(
                        "phone",
                        "Enter your phone number",
                        TextInputType.phone,
                        phone,
                        "please enter your phone number"),
                    buildTextField(
                        "address",
                        "Enter your address",
                        TextInputType.text,
                        address,
                        "please enter your phone address"),
                    buildTextField(
                        "graduation batch",
                        "Enter your graduation batch",
                        TextInputType.number,
                        gradBatch,
                        "please enter your graduation batch"),
                    buildTextField(
                        "department",
                        "Enter your department",
                        TextInputType.text,
                        department,
                        "please enter your department"),
                    buildTextField(
                        "specialization",
                        "Enter your specialization",
                        TextInputType.text,
                        specialzation,
                        "please enter your specialization"),
                    buildTextField(
                        "scientific degree",
                        "Enter scientific degree",
                        TextInputType.text,
                        scientificDegree,
                        "please enter scientific degree"),
                    buildTextField("gpa", "Enter your gpa",
                        TextInputType.number, gpa, "please enter your gpa"),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Enter field";
                              }
                              return null;
                            },
                            controller: fildCourses,
                            decoration: InputDecoration(
                              labelText: 'field',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Enter your courses";
                              }
                              return null;
                            },
                            controller: courses,
                            decoration: InputDecoration(
                              labelText: 'Courses',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Enter field";
                              }
                              return null;
                            },
                            controller: fildAward,
                            decoration: InputDecoration(
                              labelText: 'field',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Enter your awards";
                              }
                              return null;
                            },
                            controller: awards,
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
                              return SimpleDialog(
                                title: const Text('Choose Image'),
                                children: <Widget>[
                                  SimpleDialogOption(
                                    onPressed: () {
                                      setState(() {});
                                      i = 1;
                                      chooseImage(ImageSource.gallery);
                                      Navigator.pop(context);
                                    },
                                    child: const Text('From gallery'),
                                  ),
                                  SimpleDialogOption(
                                    onPressed: () async {
                                      i = 1;
                                      chooseImage(ImageSource.camera);
                                      setState(() {});
                                      Navigator.pop(context);
                                    },
                                    child: const Text('From camera'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: TextFormField(
                          validator: (_) {
                            if (Academic == null) {
                              return "Enter your Academic certificates";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            enabled: false,
                            errorStyle: TextStyle(color: Colors.red),
                            labelText: 'Academic certificates',
                            labelStyle: Theme.of(context).textTheme.bodyMedium,
                            prefixIcon: Icon(Icons.upload_outlined),
                            suffixIcon: Academic == null
                                ? Icon(
                                    Icons.add,
                                  )
                                : Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  ),
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
                              return SimpleDialog(
                                title: const Text('Choose Image'),
                                children: <Widget>[
                                  SimpleDialogOption(
                                    onPressed: () {
                                      i = 2;
                                      chooseImage(ImageSource.gallery);
                                      Navigator.pop(context);
                                    },
                                    child: const Text('From gallery'),
                                  ),
                                  SimpleDialogOption(
                                    onPressed: () {
                                      i = 2;
                                      chooseImage(ImageSource.camera);
                                      Navigator.pop(context);
                                    },
                                    child: const Text('From camera'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: TextFormField(
                          validator: (_) {
                            if (Certificate == null) {
                              return "Enter your Graduation certificate";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            enabled: false,
                            errorStyle: TextStyle(color: Colors.red),
                            labelText: 'Graduation certificate',
                            labelStyle: Theme.of(context).textTheme.bodyMedium,
                            suffixIcon: Certificate == null
                                ? Icon(
                                    Icons.add,
                                  )
                                : Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  ),
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
                              return SimpleDialog(
                                title: const Text('Choose Image'),
                                children: <Widget>[
                                  SimpleDialogOption(
                                    onPressed: () {
                                      i = 3;
                                      chooseImage(ImageSource.gallery);
                                      Navigator.pop(context);
                                    },
                                    child: const Text('From gallery'),
                                  ),
                                  SimpleDialogOption(
                                    onPressed: () {
                                      i = 3;
                                      chooseImage(ImageSource.camera);
                                      Navigator.pop(context);
                                    },
                                    child: const Text('From camera'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: TextFormField(
                          validator: (value) {
                            if (Record == null) {
                              return "Enter your Academic Record";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            enabled: false,
                            errorStyle: TextStyle(color: Colors.red),
                            labelText: 'Academic Record',
                            labelStyle: Theme.of(context).textTheme.bodyMedium,
                            suffixIcon: Record == null
                                ? Icon(
                                    Icons.add,
                                  )
                                : Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  ),
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
                              return SimpleDialog(
                                title: const Text('Choose Image'),
                                children: <Widget>[
                                  SimpleDialogOption(
                                    onPressed: () {
                                      i = 4;
                                      chooseImage(ImageSource.gallery);
                                      Navigator.pop(context);
                                    },
                                    child: const Text('From gallery'),
                                  ),
                                  SimpleDialogOption(
                                    onPressed: () {
                                      i = 4;
                                      chooseImage(ImageSource.camera);
                                      Navigator.pop(context);
                                    },
                                    child: const Text('From camera'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: TextFormField(
                          validator: (_) {
                            if (CV == null) {
                              return "Enter your CV";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            enabled: false,
                            errorStyle: TextStyle(color: Colors.red),
                            labelText: 'CV',
                            labelStyle: Theme.of(context).textTheme.bodyMedium,
                            prefixIcon: Icon(Icons.upload_outlined),
                            suffixIcon: CV == null
                                ? Icon(
                                    Icons.add,
                                  )
                                : Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                )),
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
                  onPressed: () async {
                    print(id);
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title:
                                  Center(child: CircularProgressIndicator()));
                        });
                    var delete = await ApiManager.delGrdDetailes(id);
                    if (delete.statusCode== 200) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Deletion is Success')));
                      clearAll();
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Some thing went wrong')));
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Delete',
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
                      storeData();
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

  void _selDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        //get today's date
        firstDate: DateTime(1980),
        //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));
    if (pickedDate != null) {
      print(
          pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
      String formattedDate = DateFormat('yyyy-MM-dd').format(
          pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
      print(
          formattedDate); //formatted date output using intl package =>  2022-07-04
      //You can format date as per your need

      setState(() {
        dob.text = formattedDate; //set foratted date to TextField value.
      });
    } else {
      print("Date is not selected");
    }
  }

  void storeData() async {
    print(phone.text);
    Details data = Details();
    if (formKey.currentState!.validate()) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Center(child: CircularProgressIndicator()));
          });
      data = await ApiManager.storeGrddDetailes(
          dob.text,
          phone.text,
          address.text,
          _image,
          gradBatch.text,
          scientificDegree.text,
          Academic!,
          Certificate!,
          Record!,
          gpa.text,
          CV!,
          fildCourses.text,
          courses.text,
          fildAward.text,
          awards.text);
      if (data.success ?? false) {
        Navigator.pop(context);
        id = data.payload!.id ?? 0;
        print(data.payload!.id);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(AppLocalizations.of(context)!.dialog_sucesse),
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
      } else {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error occured"),
              content: Column(
                children: [
                  Text('some thing went wrong'),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                  'ok',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            );
          },
        );
      }
    }
  }

  void clearAll() {
    dob.clear();
    phone.clear();
    address.clear();
    _image = null;
    gradBatch.clear();
    department.clear();
    specialzation.clear();
    scientificDegree.clear();
    Academic = null;
    Certificate = null;
    Record = null;
    gpa.clear();
    CV = null;
    courses.clear();
    fildAward.clear();
    fildCourses.clear();
    awards.clear();
  }

  Widget buildTextField(String labelText, String placeholder,
      TextInputType type, TextEditingController cont, String x) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
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
