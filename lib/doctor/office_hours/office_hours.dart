import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../student/personal setting/tables/Cell.dart';
import '../table/two_cell.dart';


class OfficeHours extends StatefulWidget {
 static const String routeName='office';
 List rows=[TwoCell(Text(""))];

  @override
  State<OfficeHours> createState() => _OfficeHoursState();
}

class _OfficeHoursState extends State<OfficeHours> {

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
                    child: Text('Day',)),
                Container(
                    padding: EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width*.4,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12)
                        )
                    ),
                    child: Text('Official hour')),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: widget.rows.length,
                  itemBuilder: (context,index){
                    return TwoCell(widget.rows[index]);
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
                      widget.rows.add(TwoCell(Text("")));
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
