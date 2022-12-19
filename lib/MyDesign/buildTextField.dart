import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildTextField extends StatefulWidget {
  String labelText;
  String placeholder;
  bool isPasswordTextField;
  bool readOnly;
  TextInputType type;
  BuildTextField( this.labelText, this.placeholder, this.isPasswordTextField,
   this.readOnly, this.type);


  @override
  State<BuildTextField> createState() => _BuildTextFieldState();
}

class _BuildTextFieldState extends State<BuildTextField> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 35.0),
      child: TextField(
        keyboardType: widget.type,
        readOnly: widget.readOnly,
        obscureText: widget.isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: widget.isPasswordTextField
                ? IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(
               Icons.remove_red_eye,
                color: Colors.grey,
              ),
            )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: widget.labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: widget.placeholder,
            hintStyle: Theme.of(context).textTheme.headlineMedium),
      ),
    );

  }
}
