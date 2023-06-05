import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project/graduated/personal%20setting/graduate_exper.dart';

import '../../student/Registration Form/register_files.dart';


class GraduationCertificate extends StatefulWidget {
  static const String routeName = 'AcadimecRegsterationgrd';
  @override
  State<GraduationCertificate> createState() => _GraduationCertificateState();
}

class _GraduationCertificateState extends State<GraduationCertificate> {
  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController address=TextEditingController();
  TextEditingController type=TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child:
        Form(
          key: formKey,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child:  Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Name"
                    ),
                    validator: (value) {
                      if(value == null || value.trim().isEmpty) {
                        return 'please enter name';
                      }
                      return null;
                    },
                    controller: name,

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Email"
                    ),
                    validator: (value) {
                      if(value == null || value.trim().isEmpty) {
                        return 'please enter email';
                      }
                      return null;
                    },
                    controller: email,

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Address"
                    ),
    validator: (value) {
    if(value == null || value.trim().isEmpty) {
    return 'please enter email';
    }
                    return null;},

                    controller: address,

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Type of company"
                    ),
                    validator: (value) {
                      if(value == null || value.trim().isEmpty) {
                        return 'please enter type of company';
                      }
                      return null;},
                    controller: type,

                  ),
                  SizedBox(
                    height: 20,
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
                            Navigator.pushReplacementNamed(context, GraduateExperience.routeName);
                          },
                          child: Text("save",
                              style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 2.2,
                                  color: Colors.white))),
                    ],
                  ),]

            ),

          ),

        ),
        ));
  }
  void storeData()async{

  }
  }

