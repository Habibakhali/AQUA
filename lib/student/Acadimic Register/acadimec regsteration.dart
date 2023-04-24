import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project/API/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../API/Models/Student/academic_registry_api.dart';
import '../../API/Models/Student/post_acadimic_registration.dart';
import '../Registration Form/register_files.dart';

class AcadimecRegsteration extends StatefulWidget {
  static const String routeName = 'AcadimecRegsteration';
  String year = '1';
  bool visible = true;

  @override
  State<AcadimecRegsteration> createState() => _AcadimecRegsterationState();
}

class _AcadimecRegsterationState extends State<AcadimecRegsteration> {
  File? imageFile;
  List<String>lastfile=[];
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

  GetAcademicRegistryApi data = GetAcademicRegistryApi();

  void showImage() async {
    data = await ApiManager.getShowAcademicRegistry(id ?? 0);
    print('---------------------->${data.payload!.id!}');
    status =  'https://' + ApiManager.base + '/' + data.payload!.image!;
    if(!lastfile.contains(imageFile)){
      lastfile.insert(lastfile.length, status);
    }
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
              lastfile.isEmpty
                  ? Center(child: Text(AppLocalizations.of(context)!.no_img))
                  : Expanded(child: ListView.builder(
                scrollDirection: Axis.horizontal,itemCount: lastfile.length,
              itemBuilder: (_,index){
                    return Row(
                      children: [
                        RegisterFiles(lastfile[index],(index){
                          ApiManager.delAcadimicRegistery( index);
                          setState(() {
                            lastfile.removeAt(index);
                          });
                        },index),
                        SizedBox(width: 8,)
                      ],
                    );
              },
              )),
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
              SizedBox(
                height: 20.0,
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
    PostAcademicRegistryApi data =PostAcademicRegistryApi();
    if(imageFile!=null)
      data=await ApiManager.storeAcademicRegistry(imageFile!, selected);
    else ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('something error')));
    if (data.success == true) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('image is uploaded')));
      id = data.payload!.id;
      showImage();
    } else{
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('something error')));
    }
    print('--------------------------${token}');

  }
}
