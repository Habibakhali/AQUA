import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PasswordTextField extends StatefulWidget {
  String hintPassword;
  String labelPassword;
  String hintConfirm;
  String labelConfrim;

  PasswordTextField(this.labelPassword, this.hintPassword,this.labelConfrim,this.hintConfirm);
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}class _PasswordTextFieldState extends State<PasswordTextField> {
  bool visubility = true;
  bool visubility1 = true;
 var password=TextEditingController();
 var confirm=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:  20),
      child: Column(
        children: [
          TextFormField(
            controller: password,
            validator: (text) {
              if (text == null || text.trim().isEmpty) {
                return '${AppLocalizations.of(context)!.please_enter} ${widget.labelPassword}';
              }
              else if (!(text.length >= 8) && !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                        .hasMatch(text)) {
                  return AppLocalizations.of(context)!.invalid;

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
                label: Text(widget.labelPassword),
                labelStyle: Theme.of(context).textTheme.bodyMedium,
                hintText: widget.hintPassword,
                hintStyle: Theme.of(context).textTheme.bodySmall,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).canvasColor),
                ),
                enabledBorder:
                OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).canvasColor),
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
          SizedBox(height:20 ,),
          TextFormField(
            controller: confirm,
            validator: (text) {
              if (text == null || text.trim().isEmpty) {
                return '${AppLocalizations.of(context)!.please_enter} ${widget.labelConfrim}';
              }
              else if (text!=password.text) {
                return AppLocalizations.of(context)!.password_lettertwo;

              }
              return null;
            },
            keyboardType: TextInputType.visiblePassword,
            obscureText: visubility1,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: Theme.of(context).canvasColor,
                ),
                suffixIcon: IconButton(
                    onPressed: () {
                      visubility1 = !visubility1;
                      setState(() {});
                    },
                    icon: Icon(
                      visubility1 ? Icons.visibility : Icons.visibility_off,
                      color: Theme.of(context).canvasColor,
                    )),
                label: Text(widget.labelConfrim),
                labelStyle: Theme.of(context).textTheme.bodyMedium,
                hintText: widget.hintConfirm,
                hintStyle: Theme.of(context).textTheme.bodySmall,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).canvasColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).canvasColor),
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
        ],
      ),
    );
  }
}
