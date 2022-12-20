import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../student/personal setting/Cell.dart';

class Table extends StatefulWidget {


  @override
  State<Table> createState() => _TableState();
  List rows=[Cell(Text(""))];
}

class _TableState extends State<Table> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(30),
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
                    child: Text('course name')),
                Container(
                    padding: EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width*.3,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12)
                        )
                    ),
                    child: Text('day')),
                Container(
                    padding: EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width*.3,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12)
                        )
                    ),
                    child: Text('time')),
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
