import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:project/icon.dart';
import 'package:project/selection_button.dart';
import 'package:project/type_of_textfeild/password_textfield.dart';
import 'package:project/type_of_textfeild/text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'Otp_form_email.dart';

class SignUpGraduated extends StatefulWidget {
  static const String routeName = 'signupGrd';

  @override
  State<SignUpGraduated> createState() => _SignUpGraduatedState();
}

class _SignUpGraduatedState extends State<SignUpGraduated> {
  GlobalKey<FormState>formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var p=TextEditingController();
    var c=TextEditingController();
    FilePickerResult? fileload;
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
                  MyTextField(
                      AppLocalizations.of(context)!.age_hint,
                      AppLocalizations.of(context)!.age,
                      TextInputType.number,
                      Icon(Icons.calendar_today,color: Theme.of(context).canvasColor,)),
                  MyTextField(
                      AppLocalizations.of(context)!.address_hint,
                      AppLocalizations.of(context)!.address_label,
                      TextInputType.text,
                    Icon(Icons.location_history,color: Theme.of(context).canvasColor,)),

                  MyTextField(
                      AppLocalizations.of(context)!.grad_baatch_hint,
                      AppLocalizations.of(context)!.grad_batch,
                      TextInputType.number,
                      Icon(MyFlutterApp.graduation_cap,color: Theme.of(context).canvasColor,)),
                  MyTextField(
                      AppLocalizations.of(context)!.scientific_degree_hint,
                      AppLocalizations.of(context)!.scientific_degree,
                      TextInputType.text,
                      Icon(Icons.grade,color: Theme.of(context).canvasColor,)),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child :InkWell(
                    onTap: ()async {
                      print("===========================>?${fileload}");
                       fileload=await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['pdf', 'doc'],
                      );
                    },
                    child: TextFormField(
                      validator:(_){
                        if(fileload==null)
                          return "please upload your cv";
                        return null;
                      },
                      decoration: InputDecoration(
                          enabled: false,
                        suffixIcon: fileload==null?Icon(Icons.add,color: Colors.transparent,):Icon(Icons.done),
                        errorStyle: TextStyle(color: Colors.red),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:Colors.red),
                        ),
                        labelText: AppLocalizations.of(context)!.cv,
                          labelStyle: Theme.of(context).textTheme.bodyMedium,
                          prefixIcon: Icon(Icons.upload_outlined),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color:Colors.grey,width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                      ),
                    ),
                  ),),
                  SizedBox(
                    height: 20,
                  ),
                  PasswordTextField(AppLocalizations.of(context)!.password_label,
                      AppLocalizations.of(context)!.password_hint,AppLocalizations.of(context)!.confirm_label,
                      AppLocalizations.of(context)!.confirm_hint),
                  SeleBtn(AppLocalizations.of(context)!.register, OtpFormEmailGraduated.routeName,formKey)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
