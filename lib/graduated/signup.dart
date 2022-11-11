import 'package:flutter/material.dart';
import 'package:project/graduated/graduated_login.dart';
import 'package:project/type_of_textfeild/password_textfield.dart';
import 'package:project/type_of_textfeild/text_field.dart';

class SignUp extends StatefulWidget {
  static const String routeName = 'signup';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  List<String> items = ['1', '2', '3', '4'];
  String? selectedItem = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.account_box_outlined, color: Colors.white),
              label: Text(
                'About Us',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.call, color: Colors.white),
              label: Text(
                'Contaxt Us',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                TextFeilf('Enter Your Email', 'User name', TextInputType.name),
                TextFeilf('Enter Your Email', 'University Email',
                    TextInputType.emailAddress),
                TextFeilf('Enter Your Phone Number', 'Phone Number',
                    TextInputType.number),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(0, 0, 0, 0.5)))),
                    value: selectedItem,
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(fontSize: 20),
                            )))
                        .toList(),
                    onChanged: (item) => setState(() => selectedItem = item),
                  ),
                ),
                PasswordTextField('Password', 'Enter your password'),
                PasswordTextField(
                    'Confirm Password', 'Enter your the same password'),
                Container(
                  width: 250,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, GraduatedLogIn.routeName);
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 20),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
