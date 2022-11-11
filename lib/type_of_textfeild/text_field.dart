import 'package:flutter/material.dart';

class TextFeilf extends StatelessWidget {
  TextInputType keyboard_type;
  String hint;
  String label;

  TextFeilf(this.hint, this.label, this.keyboard_type);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        child: TextField(
          keyboardType: keyboard_type,
          decoration: InputDecoration(
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
