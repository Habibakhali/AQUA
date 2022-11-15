import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  String hint;
  String label;
  String help;
  PasswordTextField(this.label,this.hint,this.help);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool visubility=true;

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(right: 20,left: 20),
      child: TextField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: visubility,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock_outline),
            suffixIcon: IconButton(onPressed: (){
              visubility =!visubility;
              setState((){});

            },
                icon: Icon(visubility?Icons.visibility:Icons.visibility_off)
            ),
            label: Text(widget.label),
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            hintText: widget.hint,
            helperText: widget.help,
            hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}
