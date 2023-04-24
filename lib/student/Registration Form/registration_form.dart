import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../API/Models/Student/get_registeration_forn.dart';
import '../../API/Models/Student/registeration_form_model.dart';
import '../../API/api_manager.dart';

class RegistrationForm extends StatefulWidget {
  static const String routeName = 'Rigester';
  String year = '1';
  bool visible = true;

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  File? imageFile;
  String status = '';
  String selected = '';
  var pickedFile;
  int? id;
  late String email;
  late String password;
  late String token;

  chooseImage(ImageSource source) async {
    pickedFile = await ImagePicker().pickImage(
      source: source,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    setState(() {
      widget.visible = true;
      imageFile = File(pickedFile!.path);
    });
  }


  void showImage() async {
    GetRegisterationFormModel data = await ApiManager.getRegisterationForm(id ?? 0);
    print('---------------------->${data.payload!.id!}');
    status =  'https://' + ApiManager.base + '/' + data.payload!.reImage!;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initPref();
  }
  initPref()async{
    final pref=await SharedPreferences.getInstance();
    token=pref.getString('token')??'0';
    email=pref.getString('email')!;
    password=pref.getString('password')!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(30.0),
        child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                  Center(child: Text(AppLocalizations.of(context)!.or)),
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
                  status.isEmpty
                      ? Center(child: Text(AppLocalizations.of(context)!.no_img))
                      : Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Image.network(status,width: MediaQuery.of(context).size.width,height: 310,),
                      InkWell(
                          onTap: (){
                            ApiManager.delRegiserationForm(id!);
                            setState(() {
                              selected='';
                              status='';
                            });
                          },
                          child: Icon(Icons.clear,color: Colors.red,))
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => StatefulBuilder(
                              builder: (context, StateSetter setState) {
                                return SimpleDialog(
                                  title: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(AppLocalizations.of(context)!
                                              .select_semester),
                                          InkWell(
                                              onTap: () {
                                                flutterYearPicker(context);
                                              },
                                              child: Text(
                                                'level: ${widget.year}',
                                              ))
                                        ],
                                      ),
                                      Divider(
                                        thickness: 1,
                                      )
                                    ],
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 20, top: 5),
                                  backgroundColor:
                                  Theme.of(context).secondaryHeaderColor,
                                  children: [
                                    InkWell(
                                        child: Row(
                                          children: [
                                            Text(AppLocalizations.of(context)!
                                                .semester1),
                                          ],
                                        ),
                                        onTap: () {
                                          setState(() {
                                            selected = widget.year + '1';
                                          });
                                          Navigator.of(context).pop();
                                        }),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    InkWell(
                                        child: Row(
                                          children: [
                                            Text(AppLocalizations.of(context)!
                                                .semester2),
                                          ],
                                        ),
                                        onTap: () {
                                          selected = widget.year + '2';
                                          setState(() {});
                                          Navigator.of(context).pop();
                                        }),
                                  ],
                                );
                              }));
                      setState(() {});
                    },
                    child: Text(AppLocalizations.of(context)!.select_semester),
                  ),
                  selected.isNotEmpty
                      ? Center(child: Text('Semester is : $selected' ))
                      : Center(child: Text('Choose your semester')),
                  OutlinedButton(
                    onPressed: () {
                      validate();
                    },
                    child: Text(AppLocalizations.of(context)!.upload_img),
                  ),
                ])));
  }
  Future flutterYearPicker(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        final Size size = MediaQuery.of(context).size;
        return AlertDialog(
          title: Column(
            children: [
              Text(AppLocalizations.of(context)!.select_year),
              Divider(
                thickness: 1,
              )
            ],
          ),
          backgroundColor: Theme.of(context).secondaryHeaderColor,
          content: SizedBox(
            height: size.height * 0.08,
            child: GridView.count(
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 4,
              childAspectRatio: 1.5 / 1,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              children: [
                ...List.generate(4, (index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        widget.year = (1 + index).toString();
                        print('------------------------------>${widget.year}');
                        Navigator.pop(context, widget.year);
                      });
                    },
                    child: Chip(
                      backgroundColor: Theme.of(context).primaryColor,
                      label: Container(
                        child: Text(
                          (1 + index).toString(),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }

  void validate() async {
    RegisterationFormModel data=await ApiManager.storeRegisterationForm(imageFile!, selected);
    if (data.success == true) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('image is uploaded')));
      id = data.payload!.id;
      print('===============> ${data.message}');
      showImage();

    } else{
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('something error')));
      print('===============>errorData ${data.message}');
    }
//    print('--------------------------token: ${token}');

  }
}
