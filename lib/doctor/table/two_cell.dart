
import 'package:flutter/material.dart';

class TwoCell extends StatelessWidget {
Widget s;

TwoCell(this.s);

  @override
  Widget build(BuildContext context) {
    return Row(
    children: [
      Container(
      width: MediaQuery.of(context).size.width*.5,
      child: TextField(
        decoration: InputDecoration(
          border:OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.zero)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.black
              ),
              borderRadius: BorderRadius.all(Radius.zero)
          ),


        ),
      ),
    ),
    Container(
    width: MediaQuery.of(context).size.width*.4,
    child: TextField(
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
    border:OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.zero)
    ),
    focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
    color: Colors.black
    ),
    borderRadius: BorderRadius.all(Radius.zero)
    ),



    ),
    ),
    ),]);
  }
}
