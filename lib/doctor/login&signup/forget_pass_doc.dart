import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project/API/api_manager.dart';
import 'package:project/graduated/login&signup/Otp_form.dart';
import '../../API/Models/Student/forget_pass_student.dart';

class ForgetMyPasswordDr extends StatefulWidget {
  static String routeName='ForgetPasswordDr';

  @override
  State<ForgetMyPasswordDr> createState() => _ForgetMyPasswordDrState();
}

class _ForgetMyPasswordDrState extends State<ForgetMyPasswordDr> {
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
                    if(text!.trim().isEmpty ||text==null ){
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
                    //validation();
                  }, child: Text('Find account',style: TextStyle(
                      fontSize: 18
                  ),)))
            ],
          ),
        ),
      ),
    );
  }
 /* Future<dynamic> validation()async{
    FocusManager.instance.primaryFocus?.unfocus();
    if(foemkey.currentState!.validate()){

      }
      else{

      }
    }
 */
}
