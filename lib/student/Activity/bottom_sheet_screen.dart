import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class BottomSheetScreen extends StatelessWidget {
String title;
String url1;
String url2;
//String url='@scienceseascouts';
BottomSheetScreen(this.title,this.url1,this.url2);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*.80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title,textAlign: TextAlign.center,style: Theme.of(context).textTheme.headlineSmall,),
          SizedBox(height: 10,),
          Expanded(
            child: Image.asset(url1
            ),
          ),
          SizedBox(height: 10,),
          Image.asset(url2,width: MediaQuery.of(context).size.width*.8
            ,height: MediaQuery.of(context).size.height*.30,
          ),
          TextButton(onPressed: ()async {
          const url = 'https://www.facebook.com/scienceseascouts/';
          if (await canLaunch(url)) {
          await launch(url);
          } else {
          throw 'Could not launch $url';
          }
          }, child: Text('@scienceseascouts'))
        ],
      ),
    );
  }
}
