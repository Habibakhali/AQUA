import 'package:flutter/material.dart';
import 'package:project/API/Models/Student/GetActivity.dart';
import 'package:project/API/api_manager.dart';
import 'package:project/student/personal%20setting/training/post_item.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../providers/setting_provider.dart';
import 'content_bottom_sheet.dart';
import 'data_activity_bottomSheet.dart';

class Training extends StatefulWidget {
  static const String routName = "training";

  @override
  State<Training> createState() => _TrainingState();
}

class _TrainingState extends State<Training> {

  var userNAme;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getName();
  }
  List<PayloadActivity>? dataInit;
  getName()async{
    final oref=await SharedPreferences.getInstance();
    userNAme  =oref.getString('usernameStu');
   dataInit =await ApiManager.getActivity();
  }
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<SettingProvider>(context);
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
                      else if (snap.hasError) {
                        return Center(
                          child: Text(
                            "Something went wrong",
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      } else {
                        var data = snap.data;
                        if (data!.isEmpty){
                          return Center(
                            child: Text(
                              'No Activity 😕',
                              style: TextStyle(color: Colors.blue),
                            ),
                          );
                        }
                       else {
                           return ListView.builder(
                               itemCount: data.length,
                               itemBuilder: (context, index) {
                                 return InkWell(
                                     onTap: (){
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
                                         data[index].name!,
                                         data[index].title!,
                                         data[index].createdAt!,
                                         data[index].des!,
                                         data[index].image!,
                                         data[index].id!, data[index].name==userNAme?true:false));
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
        isScrollControlled: true,
        builder: (context) {
          return Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: ContentBottomSheet());
        });
  }
}
