import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project/doctor/login&signup/otp_email_doctor.dart';

import '../../MyDesign/password_textfield.dart';
import '../../MyDesign/selection_button.dart';
import '../../MyDesign/text_field.dart';
import '../../Styling/icon.dart';


class SignUpDoctor extends StatefulWidget {
  static const String routeName='signup-doctor';
bool visible=false;
bool visible2=false;
  FilePickerResult? fileload;
  var icon = Icon(Icons.add);  @override
  State<SignUpDoctor> createState() => _SignUpDoctorState();
}

class _SignUpDoctorState extends State<SignUpDoctor> {
  GlobalKey<FormState>formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var password=TextEditingController();
    var confirm=TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  MyTextField(
                      AppLocalizations.of(context)!.user_name_hint,
                      AppLocalizations.of(context)!.user_name,
                      TextInputType.name,
                      Icon(
                        Icons.person,
                        color: Theme.of(context).canvasColor,
                      )),
                  MyTextField(
                      AppLocalizations.of(context)!.id_hint,
                      AppLocalizations.of(context)!.id,
                      TextInputType.number,
                      Icon(Icons.perm_identity_outlined,color: Theme.of(context).canvasColor,)),
                  MyTextField(
                      AppLocalizations.of(context)!.email_hint,
                      AppLocalizations.of(context)!.university_email,
                      TextInputType.emailAddress,
                      Icon(Icons.email_outlined,color: Theme.of(context).canvasColor,)),
                  MyTextField(
                      AppLocalizations.of(context)!.phone_hint,
                      AppLocalizations.of(context)!.phone,
                      TextInputType.number,
                      Icon(Icons.phone,color: Theme.of(context).canvasColor,)),

                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: InkWell(
                      onTap: () async {
                        widget.fileload = await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['pdf', 'doc'],
                        );
                        if (widget.fileload != null) {
                          widget.icon = Icon(Icons.check_circle_outline_sharp);
                          setState(() {});
                        }
                      },
                      child: TextFormField(
                        validator: (_) {
                          if (widget.fileload == null)
                            return AppLocalizations.of(context)!.validation_cv;
                          return null;
                        },
                        decoration: InputDecoration(
                          enabled: false,
                          suffixIcon: widget.icon,
                          errorStyle: TextStyle(color: Colors.red),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          labelText: AppLocalizations.of(context)!.cv,
                          labelStyle: Theme.of(context).textTheme.bodyMedium,
                          prefixIcon: Icon(Icons.upload_outlined),
                          border: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),

                  widget.fileload!=null?Text(widget.fileload?.names.first!??"",textAlign: TextAlign.start,):Text(""),
                  SizedBox(
                    height: 20,
                  ),
                  PasswordTextField(AppLocalizations.of(context)!.password_label,
                      AppLocalizations.of(context)!.password_hint,AppLocalizations.of(context)!.confirm_label,
                      AppLocalizations.of(context)!.confirm_hint,password,confirm),

                  SeleBtn(AppLocalizations.of(context)!.register, OtpDoctorEmail.routeName,formKey)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}