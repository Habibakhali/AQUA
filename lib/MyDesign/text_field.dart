import 'package:flutter/material.dart';
import 'package:project/Styling/mytheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyTextField extends StatelessWidget {
  TextInputType keyboard_type;
  String hint;
  String label;
  Icon icon;

  MyTextField(this.hint, this.label, this.keyboard_type, this.icon);
  String id='';

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: TextFormField(
          validator: (text) {

            if (text == null || text.trim().isEmpty)
              return '${AppLocalizations.of(context)!.please_enter} $label';
            else if (label == AppLocalizations.of(context)!.email_label || label==AppLocalizations.of(context)!.university_email) {
              if (!text.contains('@sci.asu.edu.eg')) {
                return '${AppLocalizations.of(context)!.please_enter} ${AppLocalizations.of(context)!.university_email}';
              }
            }

            else if(label==AppLocalizations.of(context)!.phone){
              if(!(isDigit(text)&&text.length==11)){
                return AppLocalizations.of(context)!.validation_phone;
              }
            } else if(label==AppLocalizations.of(context)!.id){
              id=text;
              if(!(isDigit(text)&&text.length==14)){
                return'${AppLocalizations.of(context)!.id} ${AppLocalizations.of(context)!.validation_id}';
              }
            }else if(label==AppLocalizations.of(context)!.level){
              if(!(text=='1'||text=='2'||text=='3'||text=='4')){
                return'${AppLocalizations.of(context)!.invalid}';
              }
            }

            return null;
          },
          keyboardType: keyboard_type,
          decoration: InputDecoration(
              prefixIcon: icon,
              label: Text(label),
              labelStyle: Theme.of(context).textTheme.bodyMedium,
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.bodySmall,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).canvasColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).canvasColor),
                borderRadius: BorderRadius.circular(10),
              )
          )
        ));
  }
  bool isDigit(String s) {
    if (s == null) {
      return false;
    }
    return int.tryParse(s) != null;
  }
 /* bool first14(String text){
    int count=0;
    for(int i=0;i<text.length-8;i++){
      if(id[i]==text[i])
        count++;
    }
    if(count==14)
      return true;
    return false;
  }*/
}
