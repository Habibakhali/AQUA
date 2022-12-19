import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../personal setting/prof.dart';

class AcadimecRegsteration extends StatefulWidget {
  static const String routeName = 'AcadimecRegsteration';
  String year = DateTime.now().year.toString();

  @override
  State<AcadimecRegsteration> createState() => _AcadimecRegsterationState();
}

class _AcadimecRegsterationState extends State<AcadimecRegsteration> {
  File? imageFile;
  String status = '';
  bool visible = true;
  chooseImage(ImageSource source) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: source,
      maxHeight: 1080,
      maxWidth: 1080,

    );
    setState(() {
      visible=!visible;
      imageFile = File(pickedFile!.path);
    });
  }



  Widget showImage() {
    return Flexible(
        child: imageFile != null
            ? Visibility(
                visible: visible,
                child: Stack(alignment: Alignment.topRight, children: [
                  Image.file(imageFile!),
                  InkWell(
                      onTap: () {
                        visible = false;
                        setState(() {});
                      },
                      child: Icon(
                        Icons.clear,
                        color: Colors.red,
                      ))
                ]),
              )
            : Text(
                AppLocalizations.of(context)!.no_img,
                textAlign: TextAlign.center,
              ));
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: Center(
        child: Column(
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
                                          setState(() {
                                          });
                                        },
                                        child: Text(
                                          widget.year,
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
                                    Navigator.of(context).pop();
                                  }),
                            ],
                          );
                        }));
              },
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
            height: size.height / 7,
            child: GridView.count(
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 3,
              childAspectRatio: 1.5 / 1,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              children: [
                ...List.generate(8, (index) {
                  return InkWell(
                    onTap: () {

                      widget.year = (DateTime.now().year - index).toString();
                      Navigator.pop(context,widget.year);
                    },
                    child: Chip(
                      backgroundColor: Theme.of(context).primaryColor,
                      label: Container(
                        child: Text(
                          (DateTime.now().year - index).toString(),
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
}
