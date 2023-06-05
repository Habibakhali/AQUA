import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project/API/api_manager.dart';
import 'package:project/graduated/companies/company_item.dart';
import 'package:project/graduated/personal%20setting/graduate_exper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../API/Models/graduated/companies_data.dart';
import '../../student/Registration Form/register_files.dart';
import 'content_companies.dart';

class GraduationCertificate extends StatefulWidget {
  static const String routeName = 'AcadimecRegsterationgrd';

  @override
  State<GraduationCertificate> createState() => _GraduationCertificateState();
}

class _GraduationCertificateState extends State<GraduationCertificate> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initfn();
  }
  int len=0;
  int curLen=0;
  List<String>companiesNamew=[];
  List<String>ids=[];
  initfn()async{
    final pref=await SharedPreferences.getInstance();
    var data = await ApiManager.getCompanies();
    companiesNamew.insert(0, 'Company\'s name');
    ids.insert(0, '0');
    for(int i=0;i<data.payload!.length;i++){
      String id=(data.payload![i].id!).toString();
      companiesNamew.insert(companiesNamew.length, data.payload![i].name!);
      ids.insert(ids.length, id);
    }
    pref.setStringList('companiesNamew', companiesNamew);
    pref.setStringList('companiesId', ids);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            ShowBottonModal();
          },
          child: Icon(Icons.add),
        ),
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: FutureBuilder<getCompaniesDate>(
            future: ApiManager.getCompanies(),
            builder: (context, snapShot) {
              if (snapShot.connectionState == ConnectionState.waiting)
                return Center(child: CircularProgressIndicator());
              if (snapShot.hasError)
                return Center(
                    child: Text(
                  'Some thing went wrong',
                  style: TextStyle(color: Colors.red),
                ));
              else {
                var data = snapShot.data;
                if (data!.payload!.isNotEmpty) {
                  Future.delayed(Duration(seconds: 6),(){
                    setState(() {});
                  });
                  return ListView.builder(
                    itemCount: snapShot.data!.payload!.length!,
                      itemBuilder:(context,index){
                      return CompanyItem(
                          data.payload![index]!.name!,
                          data.payload![index]!.email!,
                          data.payload![index]!.address!,
                          data.payload![index]!.type!,
                          data.payload![index]!.id!,
                          data.payload!.length
                      );
                });

                }
                else {
                  return Center(
                    child: Text(
                      'No Companies Found 😕',
                      style: TextStyle(color: Colors.blue),
                    ),
                  );
                }
              }
            },
          ),
        ),
      ],
    ));
  }
  void ShowBottonModal(){
    showModalBottomSheet(
        isScrollControlled: true,context: context, builder:(context) {
      return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: ContentOfCompanies());
    });
  }
  fn()async{
    final pref=await SharedPreferences.getInstance();
    len= pref.getInt('lenCompanies')!;
      setState(() {

      });
  }
}
