import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AcadimecRegsteration extends StatefulWidget {
  static const String routeName = 'AcadimecRegsteration';

  @override
  State<AcadimecRegsteration> createState() => _AcadimecRegsterationState();
}

class _AcadimecRegsterationState extends State<AcadimecRegsteration> {
  File? imageFile;
  String status='';
  startUpload(){}
  chooseImage(ImageSource source) async{
    XFile? pickedFile= await ImagePicker().pickImage(source: source,
      maxHeight: 1080,maxWidth: 1080,);
    setState(() {
      imageFile=File(pickedFile!.path);
    });

  }


  Widget showImage(){
    return Flexible(
        child:
        imageFile !=null ?
        Container(
          child: Image.file(imageFile!),
        ) : Text('No image selected',textAlign: TextAlign.center,)
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Upload acadimec regsteration"),
      ),
      body:Container(
        padding: EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             /* OutlinedButton(onPressed: (){chooseImage(ImageSource.camera);}, child: Text('Choose Image'),),
              SizedBox(height: 20.0,),*/
              ElevatedButton.icon(
                onPressed: (){chooseImage(ImageSource.camera);},
                icon: Icon( // <-- Icon
                  Icons.camera_alt_outlined,
                  size: 24.0,
                ),
                label: Text('choose image from camera'), // <-- Text
              ),
              Text('OR'),
        ElevatedButton.icon(
          onPressed: (){chooseImage(ImageSource.gallery);},
          icon: Icon( // <-- Icon
            Icons.image,
            size: 24.0,
          ),
          label: Text('choose image from galary'),),


              showImage(),
              SizedBox(height: 20.0,),
              OutlinedButton(onPressed: startUpload, child: Text('upload Image'),),
              SizedBox(height: 20.0,),
              Text(status,textAlign: TextAlign.center,
                style: TextStyle(color:Colors.green,
                    fontSize: 20.0,fontWeight: FontWeight.w500)
                ,),




            ],
          ),
        ),
      ) ,
    );
  }
}
