import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  String hint;
  String label;
  PasswordTextField(this.label,this.hint);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool visubility=true;

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(20),
      child: TextField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: visubility,
        decoration: InputDecoration(
            suffixIcon: IconButton(onPressed: (){
              visubility =!visubility;
              setState((){});

            },
                icon: Icon(visubility?Icons.visibility:Icons.visibility_off)
            ),
            label: Text(widget.label),
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            hintText: widget.hint,
            hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}
