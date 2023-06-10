import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/API/api_manager.dart';
import 'package:project/providers/setting_provider.dart';
import 'package:project/providers/state_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContentOfGrdEx extends StatefulWidget {
  @override
  State<ContentOfGrdEx> createState() => _ContentOfGrdExState();
}

class _ContentOfGrdExState extends State<ContentOfGrdEx> {
  int i = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initcompanyfun();
  }

  List<String> campaniesName = [];
  String dropdownValue = '';
  List<String> companiesId = [];

  initcompanyfun() async {
    final pref = await SharedPreferences.getInstance();
    campaniesName = pref.getStringList('companiesNamew') ?? [];
    dropdownValue = campaniesName.first;
    companiesId = pref.getStringList('companiesId') ?? [];
    setState(() {
      print(dropdownValue);
      print(campaniesName);
    });
  }

  TextEditingController jobTitle = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController companyId = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late SettingProvider pro;

  @override
  Widget build(BuildContext context) {
    pro = Provider.of<SettingProvider>(context);
    return Container(
      padding: EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 10),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(children: [
                Text(
                  'Your Experiance',
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "job_title"),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'please enter job title';
                    }
                    return null;
                  },
                  controller: jobTitle,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Start date"),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'please enter Start date';
                    }
                    return null;
                  },
                  controller: startDate,
                  onTap: () {
                    i = 1;
                    _selDatePicker();
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "End Date"),
                  validator: (value) {
                    return null;
                  },
                  controller: endDate,
                  onTap: () {
                    i = 2;
                    _selDatePicker();
                  },
                ),
              ]),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              child: DropdownButton(
                isExpanded: true,
                value: dropdownValue,
                icon: Icon(Icons.arrow_drop_down),
                dropdownColor: Colors.white,
                items: campaniesName.map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
              ),
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
                  onPressed: () {
                    grdExpr();
                  },
                  child: Text("save",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white))),
            ),
          ],
        ),
      ),
    );
  }

  grdExpr() async {
    int index = 0;
    for (int i = 0; i < campaniesName.length; i++) {
      if (dropdownValue == campaniesName[i]) index = i;
    }
    var data = await ApiManager.storeGraduateEperience(
        jobTitle.text, startDate.text, endDate.text, companiesId[index]);
    if (data.statusCode == 200) {
      pro.UpdateCompaniesState();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Your experiances is added')));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Some thing went wrong, try again')));
      Navigator.pop(context);
    }
  }

  void _selDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        //get today's date
        firstDate: DateTime(1980),
        //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));
    if (pickedDate != null) {
      print(
          pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
      String formattedDate = DateFormat('yyyy-MM-dd').format(
          pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
      print(
          formattedDate); //formatted date output using intl package =>  2022-07-04
      //You can format date as per your need

      setState(() {
        if (i == 2)
          endDate.text = formattedDate;
        else if (i == 1)
          startDate.text =
              formattedDate; //set foratted date to TextField value.
      });
    }
  }
}
