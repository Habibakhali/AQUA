import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/selection_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class OtpFormEmailGraduated extends StatefulWidget {
  static const String routeName = 'otpFormEmail';
  String backtologin;
  OtpFormEmailGraduated(this.backtologin);

  @override
  State<OtpFormEmailGraduated> createState() => _OtpFormEmailGraduatedState();
}

class _OtpFormEmailGraduatedState extends State<OtpFormEmailGraduated> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          padding: EdgeInsets.all(28),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text(AppLocalizations.of(context)!.verification_code,
                  textAlign: TextAlign.right,
                  style:Theme.of(context).textTheme.subtitle1),
              SizedBox(height: 20,),
              Text( AppLocalizations.of(context)!.sending_to_email ,
                  textAlign: TextAlign.right,
                  style:Theme.of(context).textTheme.bodySmall),

              Text( '*******@sci.eg.edu.com' , style:Theme.of(context).textTheme.subtitle1),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 68,
                    width: 64,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme.of(context).textTheme.headline6,
                      autofocus: true,
                      showCursor: false,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        counter: Offstage(),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.black12),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.blue),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 68,
                    width: 64,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme.of(context).textTheme.headline6,
                      autofocus: true,
                      showCursor: false,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        counter: Offstage(),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.black12),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.blue),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 68,
                    width: 64,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme.of(context).textTheme.headline6,
                      autofocus: true,
                      showCursor: false,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        counter: Offstage(),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.black12),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.blue),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 68,
                    width: 64,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme.of(context).textTheme.headline6,
                      autofocus: true,
                      showCursor: false,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        counter: Offstage(),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.black12),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.blue),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  )
                ],
              ),

        Row(mainAxisAlignment: MainAxisAlignment.center,
                 children: [
            Container(width: 200,
            child:SeleBtn(AppLocalizations.of(context)!.verify, widget.backtologin),
            ) ],
             ),

              Text(
               AppLocalizations.of(context)!.didnt_recirve,
                style: Theme.of(context).textTheme.subtitle1
              ),
              SizedBox(
                height: 18,
              ),
              Text(AppLocalizations.of(context)!.resend_code,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              )
            ],
          )),
    );
  }
}
