import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class otpForm extends StatelessWidget {
  //const otpForm({Key? key}) : super(key: key);
  static const String routeName = 'otpForm';

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        children: [
          SizedBox(height: 68,width: 64,child: TextField(
            style: Theme.of(context).textTheme.headline6,
            keyboardType: TextInputType.number,

          ),)
        ],
      )
    );
  }
}
