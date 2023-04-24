import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project/API/api_manager.dart';
import '../../API/Models/Student/forget_pass_student.dart';
import 'OtpStudent.dart';

class ForgetMyPasswordStudent extends StatefulWidget {
static String routeName='ForgetPasswordStudent';

  @override
  State<ForgetMyPasswordStudent> createState() => _ForgetMyPasswordStudentState();
}

class _ForgetMyPasswordStudentState extends State<ForgetMyPasswordStudent> {
TextEditingController email=TextEditingController();

GlobalKey<FormState> foemkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
        body: Container(
          padding: EdgeInsets.only(left: 20,right: 20,top: MediaQuery.of(context).size.height*0.12),
          child:SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Find your account",style: TextStyle(
                fontSize: 25
              ),),
              SizedBox(
                height: 5,
              ),
              Text('Enter your university email',style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300
              ),),
              SizedBox(height: 20,),
              Form(
                key: foemkey,
                child: TextFormField(
                  validator: (text){
                    if(text!.trim().isEmpty ||text==null||!text.contains('@sci.asu.edu.eg') ){
                      return 'please enter your university email';
                    }
                  },
                  controller: email,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    label: Text(AppLocalizations.of(context)!.email_label),
                    border: OutlineInputBorder(
                    )
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.07,
                  child: ElevatedButton(onPressed: (){
                    validation();
                  }, child: Text('Find account',style: TextStyle(
                    fontSize: 18
                  ),)))
            ],
        ),
          ),
      ),
    );
  }
Future<dynamic> validation()async{
  FocusManager.instance.primaryFocus?.unfocus();
  if(foemkey.currentState!.validate()){
    ForgetPassStudent data=await ApiManager.RequestCodeToForgetPassStudent(email.text);
    if(data.errors!=null){
      return showDialog(context: context, builder: (context) =>
          AlertDialog(
              title: Text("Error"),
              // To display the title it is optional
              content: Text(data.message!)),);
    }
    else{
      Navigator.pushReplacementNamed(context, OtpStudent.routeName,arguments: email.text);
      return showDialog(context: context, builder: (context) =>
          AlertDialog(
              title: Text("hi👋🏻,${email.text}"),
              // To display the title it is optional
              content: Text(data.message!)),);
    }
  }
}
}
