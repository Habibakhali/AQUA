import 'package:flutter/material.dart';
import 'package:project/API/api_manager.dart';
import 'package:project/providers/state_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContentOfCompanies extends StatefulWidget {
  @override
  State<ContentOfCompanies> createState() => _ContentOfCompaniesState();
}

class _ContentOfCompaniesState extends State<ContentOfCompanies> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController address = TextEditingController();

  TextEditingController type = TextEditingController();

  late StateProvider pro;
  @override
  Widget build(BuildContext context) {
    pro=Provider.of<StateProvider>(context);
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Form(
        key: formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(
              'Companies Data',
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Name"),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'please enter name';
                }
                return null;
              },
              controller: name,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Email"),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'please enter email';
                }
                return null;
              },
              controller: email,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Address"),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'please enter email';
                }
                return null;
              },
              controller: address,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Type of company"),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'please enter type of company';
                }
                return null;
              },
              controller: type,
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      elevation: MaterialStateProperty.all(1),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                  onPressed: ()  async {
                    if(formKey.currentState!.validate()){
                      var data = await ApiManager.storeCompanies(name.text, email.text, address.text, type.text);
                      if (data.statusCode == 200) {
                        pro.UpdateCompaniesState();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Store companies data is success')));
                        Navigator.pop(context);
                      }
                      else {
                        Navigator.pop(context);
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                              title: Text("Error"),
                              // To display the title it is optional
                              content: Text('Some thing went wrong')),
                        );
                      }
                    }
                  },
                  child: Text("Save",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white))),
            ),
          ]),
        ),
      ),
    );
  }
}
