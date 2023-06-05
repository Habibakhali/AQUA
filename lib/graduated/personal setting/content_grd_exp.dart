import 'package:flutter/material.dart';
import 'package:project/API/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContentOfGrdEx extends StatefulWidget {
  @override
  State<ContentOfGrdEx> createState() => _ContentOfGrdExState();
}

class _ContentOfGrdExState extends State<ContentOfGrdEx> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initcompanyfun();
  }
  String dropdownValue = 'Company\'s name';
  List<String> campaniesName=[];

  List<String> companiesId=[];
  initcompanyfun()async{
   final pref=await SharedPreferences.getInstance();
   campaniesName=pref.getStringList('companiesNamew')??[];
   companiesId=pref.getStringList('companiesId')??[];
  }

  TextEditingController jobTitle=TextEditingController();

  TextEditingController startDate=TextEditingController();

  TextEditingController endDate=TextEditingController();

  TextEditingController companyId=TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(left: 16, top: 8, right: 16,bottom: 10),
      child:
      Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child:  Column(
                  children: [
                    Text('Your Experiance',style: TextStyle(fontSize: 20
                    ),),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "job_title"
                      ),
                      validator: (value) {
                        if(value == null || value.trim().isEmpty) {
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
                      decoration: InputDecoration(
                          hintText: "Start date"
                      ),
                      validator: (value) {
                        if(value == null || value.trim().isEmpty) {
                          return 'please enter Start date';
                        }
                        return null;
                      },
                      controller: startDate,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "End Date"
                      ),
                      validator: (value) {
                        return null;
                      },
                      controller: endDate,
                    ),
                  ]

              ),

            ),
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              child: DropdownButton(
                dropdownColor: Colors.white,
                value: dropdownValue,
                icon: Icon(Icons.arrow_drop_down),
                items: campaniesName.map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value,style: TextStyle(
                      color: Colors.grey.shade700
                    ),
                    ),
                  );
                }).toList(),
                // Step 5.
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
                      shape:
                      MaterialStateProperty.all<RoundedRectangleBorder>(
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

  grdExpr()async{
    int index=0;
    for(int i=0;i<campaniesName.length;i++){
      if(dropdownValue==campaniesName[i])
        index=i;
    }
  var data=await ApiManager.storeGraduateEperience(jobTitle.text,startDate.text,endDate.text,companiesId[index]);
  if(dropdownValue=='Company\'s name')
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Select Company')));
  if(data.statusCode==200){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Your experiances is added')));
  Navigator.pop(context);
  }
else {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Some thing went wrong, try again')));
Navigator.pop(context);
}
  }
}
