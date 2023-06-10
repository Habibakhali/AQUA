import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../API/api_manager.dart';

class DataOfActivityBottomSheet extends StatelessWidget {
  String image;
  String title;

  DataOfActivityBottomSheet(this.title, this.des, this.image);

  String des;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
          Expanded(
              child: CachedNetworkImage(
            imageUrl: 'https://' + ApiManager.base + '/' + image,
            fit: BoxFit.cover,
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          )),
          SizedBox(
            height: 5,
          ),
          Center(child: Text(des))
        ],
      ),
    );
  }
}
