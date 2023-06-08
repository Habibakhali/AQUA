import 'package:flutter/material.dart';
import 'package:project/API/api_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/setting_provider.dart';
import 'companies.dart';
import 'content_companies.dart';

class CompanyItem extends StatefulWidget {
  String name;
  String address;
  String email;
  String type;
  int id;
  CompanyItem(this.name, this.email, this.address, this.type, this.id);

  @override
  State<CompanyItem> createState() => _CompanyItemState();
}

class _CompanyItemState extends State<CompanyItem> {

  late SettingProvider pro;
  @override
  Widget build(BuildContext context) {
    pro=Provider.of<SettingProvider>(context);
    return Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(blurRadius: 5, color: Colors.grey.withOpacity(0.5)),
          ],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Expanded(
                  child: Text(widget.name,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 20))),
              InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return AlertDialog(
                            title: Center(child: Text('Delete')),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Are you sure?'),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceAround,
                                  children: [
                                    OutlinedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Row(
                                          children: [
                                            Icon(Icons.cancel,
                                                color:
                                                Colors.grey),
                                            Text(
                                              'Cancel',
                                              style: TextStyle(
                                                  color: Colors
                                                      .grey),
                                            )
                                          ],
                                        )),
                                    OutlinedButton(
                                        style: OutlinedButton
                                            .styleFrom(
                                            backgroundColor:
                                            Colors.red),
                                        onPressed: () async {
                                          final pref=await SharedPreferences.getInstance();
                                         var data=await ApiManager.delCompany(widget.id);
                                         if(data.statusCode==200){
                                           pro.checkCompaniesState('del');
                                           ScaffoldMessenger.of(
                                               context)
                                               .showSnackBar(SnackBar(
                                               content: Text(
                                                   'Deletion is success')));
                                           Navigator.pop(context);
                                          } else {
                                            ScaffoldMessenger.of(
                                                context)
                                                .showSnackBar(SnackBar(
                                                content: Text(
                                                    'Sorry,try again to delete')));
                                            Navigator.pop(
                                                context);
                                          }
                                        },
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.delete,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              "Delete",
                                              style: TextStyle(
                                                  color: Colors
                                                      .white),
                                            )
                                          ],
                                        ))
                                  ],
                                )
                              ],
                            ),
                          );
                        });
                  },
                  child: Icon(
                    Icons.clear,
                    color: Colors.red,
                  )),
            ],
          ),
          Text('Email: ${widget.email}'),
          Text('Address: ${widget.address}'),
          Text('Type: ${widget.type}')
        ]));
  }

  void ShowBottonModal() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: ContentOfCompanies());
        });
  }
}
