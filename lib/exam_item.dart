import 'package:flutter/material.dart';

class ExamItem extends StatelessWidget {
String exam, date;
String routeName;
ExamItem(this.exam, this.date, this.routeName);


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(
              context, routeName);
        },
        child: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12),

        boxShadow: [BoxShadow(
        blurRadius: 20,color: Colors.grey.withOpacity(0.5)
        ),],),
          child: Row(
            children: [
              Container(
                width: 3,
                height: 80,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                      exam,
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Row(
                        children: [
                          Icon(Icons.access_time_filled_outlined,color: Theme.of(context).primaryColor,),
                          SizedBox(width: 10,),
                          Text('$date',style: TextStyle(color: Color(0xFF6C7174),fontSize: 15),),
                        ],
                      )
                    ],
                  )),

            ],
          ),
        ),
      ),
    );
  }
}