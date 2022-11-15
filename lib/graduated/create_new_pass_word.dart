import 'package:flutter/material.dart';
import 'package:project/selection_button.dart';
import 'package:project/type_of_textfeild/password_textfield.dart';


class PasswordResetGra extends StatelessWidget {
  //const PassWordReset({Key? key}) : super(key: key);
  static const String routeName = 'newPassWord';
  String backToligin;
  PasswordResetGra(this.backToligin);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Back',
          style: TextStyle(color: Colors.white),
        ),
        leadingWidth: 30,
      ),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: [
              SizedBox(
                height: 16,
              ),
              Text(
                "create new password",
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Your password must be different from previous used password.",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(height: 20,),
              PasswordTextField('Password', '', 'Must be at least characters'),
              SizedBox(height: 20,),
              PasswordTextField('Confirm', '', 'Both passwords must match'),
            SeleBtn('Reset password', backToligin),
            ],
          )),
    );
  }
}
