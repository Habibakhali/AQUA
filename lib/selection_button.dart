import 'package:flutter/material.dart';
import 'package:project/graduated/graduated_login.dart';

class SeleBtn extends StatelessWidget {
  String text;
  String text0;
  String routeName;
  String routeName0;

  SeleBtn(this.text, this.text0, this.routeName, this.routeName0);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.all(20),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, GraduatedLogIn.routeName);
                },
                child: Text(text))),
        Container(
            margin: EdgeInsets.all(20),
            child: ElevatedButton(onPressed: () {}, child: Text(text0))),
      ],
    );
  }
}
