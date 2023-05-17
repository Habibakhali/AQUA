import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RegisterFiles extends StatelessWidget {
String fileName;
 Function callBack;
 int index;
RegisterFiles(this.fileName,this.callBack,this.index);

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.topRight,
        children: [
          CachedNetworkImage(
            imageUrl: fileName,
            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        InkWell(
            onTap:() {
            callBack(index);
            },
            child: Icon(Icons.clear,color: Colors.red,)),
        ]
    );
  }
}
