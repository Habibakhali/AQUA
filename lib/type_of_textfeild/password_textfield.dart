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
          prefixIcon: Icon(Icons.lock_outline,color: Theme.of(context).canvasColor,),
            suffixIcon: IconButton(onPressed: (){
              visubility =!visubility;
              setState((){});

            },
                icon: Icon(visubility?Icons.visibility:Icons.visibility_off,color: Theme.of(context).canvasColor,)
            ),
            label: Text(widget.label),
            labelStyle: Theme.of(context).textTheme.bodyMedium,
            hintText: widget.hint,
            helperText: widget.help,
            hintStyle: Theme.of(context).textTheme.bodySmall,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).canvasColor
              ),
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}
