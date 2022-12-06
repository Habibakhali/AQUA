import 'package:flutter/material.dart';
import 'Layout/select.dart';

class Partment extends StatelessWidget {
String text;
String routeName;
String image;
Partment(this.text,this.routeName,this.image);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(
              context, routeName);
        },
        child: Column(
          children: [

            Expanded(flex:2,child: Image.asset(image,)),
            Expanded(child: Text(text,textAlign: TextAlign.center
              ,)),
          ],
        ));
  }
}
