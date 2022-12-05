import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PasswordTextField extends StatefulWidget {
  String hint;
  String label;
  String help;
  PasswordTextField(this.label, this.hint, this.help);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool visubility = true;
  var password = TextEditingController();
  var confirm = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20, left: 20),
      child: TextFormField(
        controller: widget.label == AppLocalizations.of(context)!.password_label
            ?password
            : confirm,
        validator: (text) {
          if (text == null || text.trim().isEmpty) {
            return 'please enter ${widget.label}';
          }
          else if (widget.label == AppLocalizations.of(context)!.password_label) {
            if (!(text.length >= 8) && !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                    .hasMatch(text)) {
              return 'invalid password';
            }
          } else if (widget.label == AppLocalizations.of(context)!.confirm_label) {
            if (text.trim() != (password.text.trim())){
              print("$text==================<>${password.text}");
              return 'password must be mached';
            }
          }
          return null;
        },
        keyboardType: TextInputType.visiblePassword,
        obscureText: visubility,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock_outline,
              color: Theme.of(context).canvasColor,
            ),
            suffixIcon: IconButton(
                onPressed: () {
                  visubility = !visubility;
                  setState(() {});
                },
                icon: Icon(
                  visubility ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).canvasColor,
                )),
            label: Text(widget.label),
            labelStyle: Theme.of(context).textTheme.bodyMedium,
            hintText: widget.hint,
            helperText: widget.help,
            hintStyle: Theme.of(context).textTheme.bodySmall,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).canvasColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).canvasColor),
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}
