import 'package:flutter/material.dart';
import 'package:project/select.dart';

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
            SizedBox(height: 20,),
            Image.asset(image,),
            SizedBox(height: 20,),
            Text(text,textAlign: TextAlign.center,),
            SizedBox(height: 20,),
          ],
        ));
  }
}
