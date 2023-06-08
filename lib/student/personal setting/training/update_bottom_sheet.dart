import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../API/api_manager.dart';
import '../../../providers/setting_provider.dart';

class UpdateBottomSheet extends StatefulWidget {
  bool visible = false;
  String title;
  String description;
  String? img;
  int id;

  UpdateBottomSheet(this.title, this.description, this.img, this.id);

  @override
  State<UpdateBottomSheet> createState() => _UpdateBottomSheetState();
}

class _UpdateBottomSheetState extends State<UpdateBottomSheet> {
  var titleController = TextEditingController();
  File? imageFile;

  var descriptionController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late SettingProvider pro;
  Widget build(BuildContext context) {
    titleController.text=widget.title;
    descriptionController.text=widget.description;
    pro=Provider.of<SettingProvider>(context);
    return Container(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: TextFormField(
                        validator: (text) {
                          if (text == null || text.trim().isEmpty)
                            return '${AppLocalizations.of(context)!.please_enter} ${AppLocalizations.of(context)!.title}';
                          return null;
                        },
                        controller: titleController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.edit),
                            label: Text(
                              AppLocalizations.of(context)!.title,
                            ),
                            labelStyle: Theme.of(context).textTheme.bodyMedium,
                            hintText: AppLocalizations.of(context)!.enter_title,
                            hintStyle: Theme.of(context).textTheme.bodySmall,
                            border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Theme.of(context).canvasColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Theme.of(context).canvasColor),
                              borderRadius: BorderRadius.circular(10),
                            )))),
                Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: TextFormField(
                        validator: (text) {
                          if (text == null || text.trim().isEmpty)
                            return '${AppLocalizations.of(context)!.please_enter} ${AppLocalizations.of(context)!.description}';
                          return null;
                        },
                        controller: descriptionController,
                        maxLines: 3,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.dehaze_sharp),
                            label: Text(
                              AppLocalizations.of(context)!.description,
                            ),
                            labelStyle: Theme.of(context).textTheme.bodyMedium,
                            hintText:
                            AppLocalizations.of(context)!.enter_description,
                            hintStyle: Theme.of(context).textTheme.bodySmall,
                            border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Theme.of(context).canvasColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Theme.of(context).canvasColor),
                              borderRadius: BorderRadius.circular(10),
                            )))),
                Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: InkWell(
                        onTap: (){ setState(() {});
                        print(imageFile);
                        chooseImage();},
                        child:TextFormField(
                          validator: (_){
                            if(imageFile==null)
                              return 'please upload image';
                            return null;
                          },
                          enabled: false,                  decoration: InputDecoration(
                          errorStyle: TextStyle(color: Colors.red),
                          label: Text('Image'),
                          suffixIcon: imageFile==null?Icon(Icons.add,):Icon(Icons.check_circle,color: Colors.green,),
                          prefixIcon: Icon(Icons.image,color: Colors.grey,)
                          ,labelStyle: Theme.of(context).textTheme.bodyMedium,
                          hintStyle: Theme.of(context).textTheme.bodySmall,
                          border: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Theme.of(context).canvasColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Theme.of(context).canvasColor),
                            borderRadius: BorderRadius.circular(10),),
                        ),
                        ))),
                SizedBox(
                  height: 30,
                ),
                Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.all(15),
                    child: ElevatedButton(
                        onPressed: () {
                          validate();
                        },
                        child: Text('Update')))
              ],
            ),
          ),
        ));
  }
  validate()async{
    if (formKey.currentState?.validate() == true) {
      bool? data=await ApiManager.updateActivity(widget.id,titleController.text, descriptionController.text, imageFile);
      if(data==true){
        pro.checkUpdateActivity('up');
        Navigator.pop(context);}
      else{
        return showDialog(context: context, builder: (context) =>
            AlertDialog(
                title: Text("Error"),
                // To display the title it is optional
                content: Text('Something went wrong')));
      }
    }
  }
  chooseImage() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 100,
      maxWidth: 100,
    );
    imageFile = File(pickedFile!.path);
    setState(() {});
  }
}

class PostArg {
  String title;

  String description;

  File? img;

  PostArg(this.title, this.description, this.img);
}
