import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:project/Styling/icon.dart';
import 'package:project/MyDesign/selection_button.dart';
import 'package:project/MyDesign/password_textfield.dart';
import 'package:project/MyDesign/text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'Otp_form_email.dart';

class SignUpGraduated extends StatefulWidget {
  static const String routeName = 'signupGrd';
  FilePickerResult? fileload;
  var icon = Icon(Icons.add);
  bool visible = false;


  @override
  State<SignUpGraduated> createState() => _SignUpGraduatedState();
}

class _SignUpGraduatedState extends State<SignUpGraduated> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
     var cv=AppLocalizations.of(context)!.cv;
    var p = TextEditingController();
    var c = TextEditingController();

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
                      Icon(
                        Icons.perm_identity_outlined,
                        color: Theme.of(context).canvasColor,
                      )),
                  MyTextField(
                      AppLocalizations.of(context)!.email_hint,
                      AppLocalizations.of(context)!.university_email,
                      TextInputType.emailAddress,
                      Icon(
                        Icons.email_outlined,
                        color: Theme.of(context).canvasColor,
                      )),
                  MyTextField(
                      AppLocalizations.of(context)!.phone_hint,
                      AppLocalizations.of(context)!.phone,
                      TextInputType.number,
                      Icon(
                        Icons.phone,
                        color: Theme.of(context).canvasColor,
                      )),
                  MyTextField(
                      AppLocalizations.of(context)!.age_hint,
                      AppLocalizations.of(context)!.age,
                      TextInputType.number,
                      Icon(
                        Icons.calendar_today,
                        color: Theme.of(context).canvasColor,
                      )),
                  MyTextField(
                      AppLocalizations.of(context)!.address_hint,
                      AppLocalizations.of(context)!.address_label,
                      TextInputType.text,
                      Icon(
                        Icons.location_history,
                        color: Theme.of(context).canvasColor,
                      )),
                  MyTextField(
                      AppLocalizations.of(context)!.grad_baatch_hint,
                      AppLocalizations.of(context)!.grad_batch,
                      TextInputType.number,
                      Icon(
                        MyFlutterApp.graduation_cap,
                        color: Theme.of(context).canvasColor,
                      )),
                  MyTextField(
                      AppLocalizations.of(context)!.scientific_degree_hint,
                      AppLocalizations.of(context)!.scientific_degree,
                      TextInputType.text,
                      Icon(
                        Icons.grade,
                        color: Theme.of(context).canvasColor,
                      )),
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
                          labelText: cv,
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
                  PasswordTextField(
                      AppLocalizations.of(context)!.password_label,
                      AppLocalizations.of(context)!.password_hint,
                      AppLocalizations.of(context)!.confirm_label,
                      AppLocalizations.of(context)!.confirm_hint),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(AppLocalizations.of(context)!.worked),
                      InkWell(
                        onTap: () {
                          widget.visible = !widget.visible;
                          setState(() {});
                        },
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: widget.visible ? Icon(Icons.done) : Text(""),
                        ),
                      )
                    ],
                  ),
                  widget.visible
                      ? Column(
                          children: [
                            MyTextField(
                                AppLocalizations.of(context)!.hint_current_job,
                                AppLocalizations.of(context)!.current_job,
                                TextInputType.text,
                                Icon(Icons.work)),
                            MyTextField(
                                AppLocalizations.of(context)!.hint_employer,
                                AppLocalizations.of(context)!.employer,
                                TextInputType.text,
                                Icon(Icons.perm_contact_cal_rounded)),
                            MyTextField(
                                AppLocalizations.of(context)!.hint_last_job,
                                AppLocalizations.of(context)!.last_job,
                                TextInputType.text,
                                Icon(Icons.work_history)),
                          ],
                        )
                      : Text(""),
                  SeleBtn(AppLocalizations.of(context)!.register,
                      OtpFormEmailGraduated.routeName, formKey),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
