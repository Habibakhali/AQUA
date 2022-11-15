import 'package:flutter/material.dart';
import 'package:project/type_of_textfeild/password_textfield.dart';

class PassWordReset extends StatefulWidget {
  //const PassWordReset({Key? key}) : super(key: key);
  static const String routeName = 'newPassWord';

  @override
  State<PassWordReset> createState() => _PassWordResetState();
}

class _PassWordResetState extends State<PassWordReset> {
  bool visubility = true;

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
              PasswordTextField('Password', '', 'Must be at least characters'),
              PasswordTextField('Conferm', '', 'Both passwords must match'),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {

                  },
                  child: Text(
                    'Reset password',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ))
            ],
          )),
    );
  }
}
