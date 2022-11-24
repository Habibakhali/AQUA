import 'package:flutter/material.dart';
import 'package:project/select.dart';

class Partment extends StatelessWidget {
String value;
String routeName;
String image;
Partment(this.value,this.routeName,this.image);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(
              context, routeName);
        },
        child: Column(
          children: [
            SizedBox(height: 22,),
            Image.asset(image,),
            SizedBox(height: 22,),
            Text(value,textAlign: TextAlign.center,),
            SizedBox(height: 22,),
          ],
        ));
  }
}
