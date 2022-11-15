import 'package:flutter/material.dart';
import 'package:project/graduated/graduated_login.dart';

class SeleBtn extends StatelessWidget {
  String text;

  String routeName;
  String signUpRouting;


  SeleBtn(this.text, this.routeName,this.signUpRouting);

  @override
  Widget build(BuildContext context) {
    return
        Container(
            margin: EdgeInsets.all(20),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, routeName);
                },
                child: Text(text)));
  }
}
