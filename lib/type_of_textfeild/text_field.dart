import 'package:flutter/material.dart';
import 'package:project/mytheme.dart';

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
        child: Form(
          child: TextFormField(

            keyboardType: keyboard_type,
            decoration: InputDecoration(
              prefixIcon: icon,
                label: Text(label),
                labelStyle: Theme.of(context).textTheme.bodyMedium,
                hintText: hint,
                hintStyle: Theme.of(context).textTheme.bodySmall,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).canvasColor
                  ),
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
        ));
  }
}
