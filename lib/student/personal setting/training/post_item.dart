import 'dart:io';

import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
String title;
String description;
File? img;
PostItem(this.title, this.description, this.img);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color:Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(
                12),
            boxShadow: [BoxShadow(
                blurRadius: 5,color: Colors.grey.withOpacity(0.5)
            )]
        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Text(title,style: Theme.of(context).textTheme.headlineSmall,)),
                img==null?Icon(Icons.image):Image.file(img!),
              ],
            ),
            Text(description,style: Theme.of(context).textTheme.bodySmall,)
          ],)
    );
  }
}
