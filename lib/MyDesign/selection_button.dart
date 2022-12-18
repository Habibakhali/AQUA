import 'package:flutter/material.dart';
import 'package:project/graduated/login&signup/graduated_login.dart';

class SeleBtn extends StatelessWidget {
  String text;

  String routeName;

  GlobalKey<FormState> formKey ;

  SeleBtn(this.text, this.routeName,this.formKey);

  @override
  Widget build(BuildContext context) {
    return
        Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width*.5,
            child: ElevatedButton(
                onPressed: () {
                if(formKey.currentState?.validate()==true){
                  Navigator.pushReplacementNamed(context, routeName);
                }
                },
                child: Text(text,style: TextStyle(fontSize: 18),)));
  }
}
