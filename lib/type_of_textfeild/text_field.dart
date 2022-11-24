import 'package:flutter/material.dart';

class TextFeilf extends StatelessWidget {
  TextInputType keyboard_type;
  String hint;
  String label;
  Icon icon;


  TextFeilf(this.hint, this.label, this.keyboard_type,this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20,left: 20,right: 20),
        child: TextField(
          keyboardType: keyboard_type,
          decoration: InputDecoration(
            prefixIcon: icon,
              label: Text(label),
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              hintText: hint,
              hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )),
        ));
  }
}
