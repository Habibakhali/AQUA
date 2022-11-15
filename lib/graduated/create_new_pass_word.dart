import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PassWordReset extends StatefulWidget {
  //const PassWordReset({Key? key}) : super(key: key);
  static const String routeName = 'newPassWord';

  @override
  State<PassWordReset> createState() => _PassWordResetState();
}

class _PassWordResetState extends State<PassWordReset> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Back',
          style: TextStyle(color: Colors.black),
        ),
        leadingWidth: 30,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: [
              SizedBox(
                height: 16,
              ),
              Text(
                "create new pass word",
                style: Theme
                    .of(context)
                    .textTheme
                    .headline4,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Your pass word must be different from previous used password.",
                style: Theme
                    .of(context)
                    .textTheme
                    .subtitle1,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "password",
                style: Theme
                    .of(context)
                    .textTheme
                    .subtitle1,
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  helperText: "Must be at least 8 characters",
                  helperStyle: TextStyle(
                    fontSize: 14,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.visibility_off),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Confirm pass word",
                style: Theme
                    .of(context)
                    .textTheme
                    .subtitle1,
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  helperText: "Both passwords must match",
                  helperStyle: TextStyle(
                    fontSize: 14,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.visibility_off),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(onPressed:(){},
                  child: Text('Reset password',style: TextStyle(
                    fontSize: 20,

                  ),))
            ],
          )),
    );
  }
}
