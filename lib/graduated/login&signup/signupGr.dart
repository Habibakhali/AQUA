import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:project/API/Models/Student/register.dart';
import 'package:project/API/api_manager.dart';
import 'package:project/Styling/icon.dart';
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
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  var password = TextEditingController();
  var confirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cv = AppLocalizations.of(context)!.cv;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: TextFormField(
                        validator: (text) {
                          if (text == null || text.trim().isEmpty)
                            return '${AppLocalizations.of(context)!.please_enter} ${AppLocalizations.of(context)!.user_name}';
                          return null;
                        },
                        controller: userName,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Theme.of(context).canvasColor,
                            ),
                            label:
                                Text(AppLocalizations.of(context)!.user_name),
                            labelStyle: Theme.of(context).textTheme.bodyMedium,
                            hintText:
                                AppLocalizations.of(context)!.user_name_hint,
                            hintStyle: Theme.of(context).textTheme.bodySmall,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).canvasColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).canvasColor),
                              borderRadius: BorderRadius.circular(10),
                            ))),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: TextFormField(
                        validator: (text) {
                          if (text == null || text.trim().isEmpty)
                            return '${AppLocalizations.of(context)!.please_enter} ${AppLocalizations.of(context)!.id}';
                          if(text.length!=14)
                            return '${AppLocalizations.of(context)!
                                .id} ${AppLocalizations.of(context)!
                                .validation_id}';
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.perm_identity_outlined,
                              color: Theme.of(context).canvasColor,
                            ),
                            label: Text(AppLocalizations.of(context)!.id),
                            labelStyle: Theme.of(context).textTheme.bodyMedium,
                            hintText: AppLocalizations.of(context)!.id_hint,
                            hintStyle: Theme.of(context).textTheme.bodySmall,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).canvasColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).canvasColor),
                              borderRadius: BorderRadius.circular(10),
                            ))),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: TextFormField(
                        validator: (text) {
                          if (text == null || text.trim().isEmpty)
                            return '${AppLocalizations.of(context)!.please_enter} ${AppLocalizations.of(context)!.email_label}';
                          if(!text.contains('@sci.asu.edu.eg'))
                            return '${AppLocalizations.of(context)!
                                .please_enter} ${AppLocalizations.of(context)!
                                .university_email}';
                          return null;
                        },
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Theme.of(context).canvasColor,
                            ),
                            label: Text(AppLocalizations.of(context)!.university_email,),
                            labelStyle: Theme.of(context).textTheme.bodyMedium,
                            hintText: AppLocalizations.of(context)!.email_hint,
                            hintStyle: Theme.of(context).textTheme.bodySmall,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).canvasColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).canvasColor),
                              borderRadius: BorderRadius.circular(10),
                            ))),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: TextFormField(
                        validator: (text) {
                          if (text == null || text.trim().isEmpty)
                            return '${AppLocalizations.of(context)!.please_enter} ${AppLocalizations.of(context)!.phone}';
                          if(text.length!=11)
                            return AppLocalizations.of(context)!
                                .validation_phone;
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Theme.of(context).canvasColor,
                            ),
                            label: Text(AppLocalizations.of(context)!.phone,),
                            labelStyle: Theme.of(context).textTheme.bodyMedium,
                            hintText: AppLocalizations.of(context)!.phone_hint,
                            hintStyle: Theme.of(context).textTheme.bodySmall,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).canvasColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).canvasColor),
                              borderRadius: BorderRadius.circular(10),
                            ))),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: TextFormField(
                        validator: (text) {
                          if (text == null || text.trim().isEmpty)
                            return '${AppLocalizations.of(context)!.please_enter} ${AppLocalizations.of(context)!.age}';
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.calendar_today,
                              color: Theme.of(context).canvasColor,
                            ),
                            label: Text(AppLocalizations.of(context)!.age,),
                            labelStyle: Theme.of(context).textTheme.bodyMedium,
                            hintText: AppLocalizations.of(context)!.age_hint,
                            hintStyle: Theme.of(context).textTheme.bodySmall,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).canvasColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).canvasColor),
                              borderRadius: BorderRadius.circular(10),
                            ))),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: TextFormField(
                        validator: (text) {
                          if (text == null || text.trim().isEmpty)
                            return '${AppLocalizations.of(context)!.please_enter} ${AppLocalizations.of(context)!.address_label}';
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.location_history,
                              color: Theme.of(context).canvasColor,
                            ),
                            label: Text(AppLocalizations.of(context)!.address_label,),
                            labelStyle: Theme.of(context).textTheme.bodyMedium,
                            hintText: AppLocalizations.of(context)!.address_hint,
                            hintStyle: Theme.of(context).textTheme.bodySmall,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).canvasColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).canvasColor),
                              borderRadius: BorderRadius.circular(10),
                            ))),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: TextFormField(
                        validator: (text) {
                          if (text == null || text.trim().isEmpty)
                            return '${AppLocalizations.of(context)!.please_enter} ${AppLocalizations.of(context)!.grad_batch}';
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            prefixIcon:  Icon(
                              MyFlutterApp.graduation_cap,
                              color: Theme.of(context).canvasColor,
                            ),
                            label: Text(AppLocalizations.of(context)!.grad_batch,),
                            labelStyle: Theme.of(context).textTheme.bodyMedium,
                            hintText: AppLocalizations.of(context)!.grad_baatch_hint,
                            hintStyle: Theme.of(context).textTheme.bodySmall,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).canvasColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).canvasColor),
                              borderRadius: BorderRadius.circular(10),
                            ))),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: TextFormField(
                        validator: (text) {
                          if (text == null || text.trim().isEmpty)
                            return '${AppLocalizations.of(context)!.please_enter} ${AppLocalizations.of(context)!.scientific_degree}';
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            prefixIcon:  Icon(
                             Icons.grade,
                              color: Theme.of(context).canvasColor,
                            ),
                            label: Text(AppLocalizations.of(context)!.scientific_degree,),
                            labelStyle: Theme.of(context).textTheme.bodyMedium,
                            hintText: AppLocalizations.of(context)!.scientific_degree_hint,
                            hintStyle: Theme.of(context).textTheme.bodySmall,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).canvasColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).canvasColor),
                              borderRadius: BorderRadius.circular(10),
                            ))),
                  ),
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
                  widget.fileload != null
                      ? Text(
                          widget.fileload?.names.first! ?? "",
                          textAlign: TextAlign.start,
                        )
                      : Text(""),
                  SizedBox(
                    height: 20,
                  ),
                  PasswordTextField(
                      AppLocalizations.of(context)!.password_label,
                      AppLocalizations.of(context)!.password_hint,
                      AppLocalizations.of(context)!.confirm_label,
                      AppLocalizations.of(context)!.confirm_hint,
                      password,
                      confirm),
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
                  Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width * .5,
                      child: ElevatedButton(
                          onPressed: () {
                            validation();
                          },
                          child: Text(
                            AppLocalizations.of(context)!.register,
                            style: TextStyle(fontSize: 18),
                          ))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void validation() async{
    if (formKey.currentState!.validate()) {
      Register data=await ApiManager.postRegisterGrd(userName.text, email.text, password.text, confirm.text);
      if (data.errors==null) {
        Navigator.pushReplacementNamed(context, OtpFormEmailGraduated.routeName,
            arguments: email.text);
        return showDialog(context: context, builder: (context) =>
            AlertDialog(
                title: Text("completed🥳"),
                // To display the title it is optional
                content: Text('procced to verify your email')),
        );
      }
      else {
        return showDialog(context: context, builder: (context) =>
            AlertDialog(
                title: Text("Error"),
                // To display the title it is optional
                content: Text(data.message!)));
      }
    }
  }
}