import 'package:flutter/material.dart';
import 'package:project/graduated/graduated_login.dart';

class SeleBtn extends StatelessWidget {
  String text;

  String routeName;



  SeleBtn(this.text, this.routeName);

  @override
  Widget build(BuildContext context) {
    return
        Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(5),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ))
              ),
                onPressed: () {
                  Navigator.pushNamed(context, routeName);
                },
                child: Text(text,style: TextStyle(fontSize: 18),)));
  }
}
