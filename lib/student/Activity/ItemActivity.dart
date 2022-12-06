import 'package:flutter/material.dart';
import 'bottom_sheet_screen.dart';

class ItemActivity extends StatefulWidget {
String title;
String description;
String icon;
String url1;
String url2;
ItemActivity(this.title,this.description,this.icon,this.url1,this.url2);
  @override
  State<ItemActivity> createState() => _ItemActivityState();
}

class _ItemActivityState extends State<ItemActivity> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){ShowBottomShett();},
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color:Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(
                12),
          boxShadow: [BoxShadow(
              blurRadius: 20,color: Colors.grey.withOpacity(0.5)
          )]
        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: Text(widget.title,style: Theme.of(context).textTheme.headlineSmall,)),
            Image.asset(widget.icon),
          ],
        ),
        Text(widget.description,style: Theme.of(context).textTheme.bodySmall,)
      ],)
           ),
    );
  }

  void ShowBottomShett(){
    showModalBottomSheet(context: context,
        isScrollControlled: true,
         builder: (context){
      return BottomSheetScreen(widget.title,widget.url1,widget.url2);
    });
  }
}
