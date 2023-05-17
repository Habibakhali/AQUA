import 'package:flutter/material.dart';
import 'package:project/API/Models/Student/GetActivity.dart';
import 'package:project/API/api_manager.dart';
import 'package:project/student/personal%20setting/training/post_item.dart';
import 'content_bottom_sheet.dart';
import 'data_activity_bottomSheet.dart';

class Training extends StatefulWidget {
  static const String routName = "training";

  @override
  State<Training> createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            BottomSheetInsertion();
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder<List<PayloadActivity>?>(
                  future: ApiManager.getActivity(),
                  builder: (context, snap) {
                    if (snap.connectionState == ConnectionState.waiting)
                      return Center(child: CircularProgressIndicator());
                    if (snap.hasError) {
                      print(snap.error);
                      return Center(
                        child: Text(
                          "Something went wrong",
                          style: TextStyle(color: Colors.red),
                        ),
                      );
                    } else {
                      var data = snap.data;
                      if (data == null)
                        return Center(
                          child: Text(
                            'No Activity 😕',
                            style: TextStyle(color: Colors.blue),
                          ),
                        );
                      else {
                        Future.delayed(Duration(seconds: 20),(){
                          setState(() {

                          });
                        }) ;
                        return ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () async {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return DataOfActivityBottomSheet(
                                              data[index].title!,
                                              data[index].des!,
                                              data[index].image!);
                                        });
                                  },
                                  child: PostItem(
                                      data[index].title!,
                                      data[index].des!,
                                      data[index].image!,
                                      data[index].id!));
                            });
                      }
                    }
                  }))
        ],
      ),
    );
  }

  void BottomSheetInsertion() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ContentBottomSheet();
        });
  }
}
