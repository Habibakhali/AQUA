import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';

import 'Cell.dart';

class TablesStudent extends StatefulWidget {
  static const String routeName="table_Student";
  List rows=[Cell(Text(""))];
  @override
  State<TablesStudent> createState() => _TablesStudentState();
}

class _TablesStudentState extends State<TablesStudent> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.table),
      ),
      body: Container(
        margin: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width*.5,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12)
                        )
                      ),
                      child: Text(AppLocalizations.of(context)!.subject,textAlign:TextAlign.center,)),
                  Container(
                      padding: EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width*.2,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,

                      ),
                      child: Text(AppLocalizations.of(context)!.day,textAlign:TextAlign.center,)),
                  Container(
                    padding: EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width*.2,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12)
                          )
                      ),
                      child: Text(AppLocalizations.of(context)!.hour,textAlign:TextAlign.center,)),
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: widget.rows.length,
                    itemBuilder: (context,index){
                  return Cell(widget.rows[index]);
                }),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                      child: Icon(Icons.add),
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.transparent
                        )
                      ),
                      onPressed: (){
                        widget.rows.add(Cell(Text("")));
                        setState(() {

                        });
                      }
                  ),
                ],
              ),
            ],
          ),
      ),
    );
  }
  
}