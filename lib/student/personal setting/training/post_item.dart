import 'package:flutter/material.dart';
import 'package:project/API/api_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:project/student/personal%20setting/training/update_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostItem extends StatefulWidget {
  String name;
  String title;
  String description;
  String? img;
  int id;
  bool vv;

  PostItem(this.name,this.title, this.description, this.img, this.id,this.vv);

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                color: Colors.grey.withOpacity(0.5)),
          ],),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(child: Text(widget.name,style: TextStyle(color: Colors.blue),)),
                Visibility(
                  visible: widget.vv,
                  child: Row(
                  children: [InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              print(widget.id);
                              return UpdateBottomSheet(widget.id);
                            });
                      },
                      child: Icon(
                        Icons.edit,
                        color: Colors.blue,
                      )),
                  InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return AlertDialog(
                                title: Center(child: Text('Delete')),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Are you sure?'),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        OutlinedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Row(
                                              children: [
                                                Icon(Icons.cancel,
                                                    color: Colors.grey),
                                                Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                )
                                              ],
                                            )),
                                        OutlinedButton(
                                            style: OutlinedButton.styleFrom(
                                                backgroundColor: Colors.red),
                                            onPressed: () async {
                                              bool? del =
                                                  await ApiManager.delActivity(
                                                      widget.id);
                                              if (del == true)
                                                Navigator.pop(context);
                                            },
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.delete,
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                  "Delete",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )
                                              ],
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                              );
                            });
                      },
                      child: Icon(
                        Icons.cancel_outlined,
                        color: Colors.red,
                      ))]),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                )),
                CachedNetworkImage(
                  imageUrl: 'https://' + ApiManager.base + '/' + widget.img!,
                  width: 50,
                  height: 100,
                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ],
            ),
            SizedBox(height: 5,),
            Text(
              widget.description,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.end,
            )
          ],
        ));
  }
}
