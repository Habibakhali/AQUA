import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../API/api_manager.dart';
import '../../providers/setting_provider.dart';

class ContentOfedit extends StatefulWidget {
String namea;
String emaila;
String addressa;
String typea;
int ida;

ContentOfedit(this.namea, this.emaila, this.addressa, this.typea, this.ida);

  @override
  State<ContentOfedit> createState() => _ContentOfeditState();
}

class _ContentOfeditState extends State<ContentOfedit> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

TextEditingController name = TextEditingController();

TextEditingController email = TextEditingController();

TextEditingController address = TextEditingController();

TextEditingController type = TextEditingController();

late SettingProvider pro;

@override
Widget build(BuildContext context) {
  name.text=widget.namea;
  email.text=widget.emaila;
  address.text=widget.addressa;
  type.text=widget.typea;
  pro=Provider.of<SettingProvider>(context);
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
                    var data = await ApiManager.updateCompanies(name.text, email.text, address.text, type.text,widget.ida);
                    if (data.statusCode == 200) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Store companies data is success')));
                      pro.UpdateCompaniesState();
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

