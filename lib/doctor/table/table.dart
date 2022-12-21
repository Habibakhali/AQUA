import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../student/personal setting/tables/Cell.dart';

import '../../student/personal setting/tables/Cell.dart';

class MyTable extends StatefulWidget {


  @override
  State<MyTable> createState() => _MyTableState();
  List rows=[Cell(Text(""))];
}

class _MyTableState extends State<MyTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(15),
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
                    child: Text(AppLocalizations.of(context)!.courses_title)),
                Container(
                    padding: EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width*.2,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                    ),
                    child: Text(AppLocalizations.of(context)!.day)),
                Container(
                    padding: EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width*.2,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12)
                        )
                    ),
                    child: Text(AppLocalizations.of(context)!.hour)),
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
