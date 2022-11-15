import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/selection_button.dart';

import 'create_new_pass_word.dart';

class OtpFormGraduated extends StatefulWidget {
  //const otpForm({Key? key}) : super(key: key);
  static const String routeName = 'otpForm';
  String resetpassword;
  OtpFormGraduated(this.resetpassword);

  @override
  State<OtpFormGraduated> createState() => _OtpFormGraduatedState();
}

class _OtpFormGraduatedState extends State<OtpFormGraduated> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7f6fb),
      resizeToAvoidBottomInset: false,
      body: Container(
          padding: EdgeInsets.all(28),
          /*decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text( 'Verification code' , 
                  textAlign: TextAlign.right,
                  style:TextStyle( fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
              SizedBox(height: 20,),
              Text( 'We have send the code verification to' ,
                  textAlign: TextAlign.right,
                  style:TextStyle( fontSize: 12,
                  color: Colors.black38)),

              Text( '*******@sci.eg.edu.com' , style:TextStyle( fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
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
            child:SeleBtn('Verify' , widget.resetpassword),
            ) ],
             ),

              Text(
                "Didn't you recieve any code?",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "Resend new code",
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
