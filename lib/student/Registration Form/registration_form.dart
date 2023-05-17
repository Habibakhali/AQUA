import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../API/Models/Student/get_registeration_forn.dart';
import '../../API/Models/Student/registeration_form_model.dart';
import '../../API/api_manager.dart';
import '../../providers/setting_provider.dart';

class RegistrationForm extends StatefulWidget {
  static const String routeName = 'Rigester';

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  File? imageFile;
  String status='';
  String imageAS='';
  File? imageAddSub;
  String year = '1';
  int? SY;
  String selected = '1';
  var pickedFile;
  int? id;
  int check = 0;
  late String email;
  late String password;
  late String token;

  chooseImage(ImageSource source) async {
    pickedFile = await ImagePicker().pickImage(
      source: source,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    setState(() {
      if (check == 1)
        imageAddSub = File(pickedFile!.path);
      else {
        imageFile = File(pickedFile!.path);
        print(imageFile);
      }
    });
  }

  void showImage() async {
    final pref = await SharedPreferences.getInstance();
    GetRegisterationFormModel data =
        await ApiManager.getRegisterationForm(id ?? 0);
    print('---------------------->${data.payload!.id!}');
    setState(() {});
    status=pref.getString('status'+email)??"";
    imageAS=pref.getString('imageAS'+email)??"";
  }

  @override
  void initState() {
    super.initState();
    initPref();
  }

  initPref() async {
    final pref = await SharedPreferences.getInstance();
    token = pref.getString('token') ?? '0';
    email = pref.getString('email')!;
    password = pref.getString('password')!;
    SY = pref.getInt('semester' + email)??11;
    status = pref.getString('status' + email)??'';
    print(status);
    id=pref.getInt('id'+email)??0;
    imageAS = pref.getString('imageAS' + email)??"";
  }

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<SettingProvider>(context);
    pro.ConnectionState();
    return !pro.result
        ? AlertDialog(
            title: Center(child: Text('No Internet')),
            content: Image.asset('assets/images/wi-fi-disconnected.png'),
          )
        : Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Deletion and addition"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Divider(),
                            ElevatedButton.icon(
                              onPressed: () {
                                check = 1;
                                chooseImage(ImageSource.camera);
                                setState(() {});
                              },
                              icon: Icon(
                                // <-- Icon
                                Icons.camera_alt_outlined,
                                size: 24.0,
                              ),
                              label: Text('From Camera'), // <-- Text
                            ),
                            Center(
                                child: Text(AppLocalizations.of(context)!.or)),
                            ElevatedButton.icon(
                              onPressed: () {
                                check = 1;
                                setState(() {
                                  chooseImage(ImageSource.gallery);
                                });
                              },
                              icon: Icon(
                                // <-- Icon
                                Icons.image,
                                size: 24.0,
                              ),
                              label: Text('From Gallery'),
                            ),
                            imageAddSub == null
                                ? Center(
                                    child: Text(
                                        AppLocalizations.of(context)!.no_img))
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Show image:"),
                                      Icon(Icons.check_circle,
                                          color: Colors.green),
                                    ],
                                  ),
                            OutlinedButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (context) =>
                                          StatefulBuilder(builder:
                                              (context, StateSetter setState) {
                                            return SimpleDialog(
                                                title: Container(
                                                    padding: EdgeInsets.all(10),
                                                    child: Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    )));
                                          }));
                                  vaildateAdd_Sub();
                                },
                                child: Text(
                                    AppLocalizations.of(context)!.upload_img))
                          ],
                        ),
                      );
                    });
              },
              child: Icon(Icons.add),
            ),
            body: Container(
                padding: EdgeInsets.all(30.0),
                child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          check = 0;
                          chooseImage(ImageSource.camera);
                        },
                        icon: Icon(
                          // <-- Icon
                          Icons.camera_alt_outlined,
                          size: 24.0,
                        ),
                        label: Text(AppLocalizations.of(context)!
                            .capture_img), // <-- Text
                      ),
                      Center(child: Text(AppLocalizations.of(context)!.or)),
                      ElevatedButton.icon(
                        onPressed: () {
                          check = 0;
                          chooseImage(ImageSource.gallery);
                        },
                        icon: Icon(
                          // <-- Icon
                          Icons.image,
                          size: 24.0,
                        ),
                        label: Text(AppLocalizations.of(context)!.gallery_img),
                      ),
                          status==''&&imageFile==null&&imageAS==''&&imageAddSub==null
                              ? Center(
                              child: Text(AppLocalizations.of(context)!.no_img))
                              :imageFile!=null&&status==''&&imageAS==''&&imageAddSub==null?
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Selected image :'),
                              Icon(Icons.check_circle,color: Colors.green,)
                            ],
                          )
                      :status.isNotEmpty&&imageAS==''
                              ? Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: status!,
                                      width: MediaQuery.of(context).size.width,
                                      height: 310,
                                      placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                    InkWell(
                                        onTap: ()async {
                                          final pref=await SharedPreferences.getInstance();
                                          var dd=await ApiManager.delRegiserationFormre(id!);
                                          if(dd.statusCode==200){
                                            status='';
                                            imageFile=null;
                                            pref.setString('status'+email, '');
                                          setState(() {
                                          });}
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          color: Colors.red,
                                        ))
                                  ],
                                )
                              : Row(
                                  children: [
                                    Expanded(
                                      child: Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: status!,
                                            height: 310,
                                            placeholder: (context, url) => Center(
                                                child:
                                                    CircularProgressIndicator()),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                          ),
                                          InkWell(
                                              onTap: () async{
                                                final pref=await SharedPreferences.getInstance();
                                               var s=await ApiManager.delRegiserationFormre(id!
                                               );
                                               if(s.statusCode==200){
                                                 imageFile=null;
                                                 status='';
                                                 pref.setString('status'+email, '');
                                                 pref.setString('imageAS'+email, '');
                                                setState(() {

                                                });}
                                              },
                                              child: Icon(
                                                Icons.clear,
                                                color: Colors.red,
                                              ))
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: imageAS!,
                                            height: 310,
                                            placeholder: (context, url) => Center(
                                                child:
                                                    CircularProgressIndicator()),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                          ),
                                          InkWell(
                                              onTap: () async{
                                                final pref=await SharedPreferences.getInstance();
                                                var s=await ApiManager.delRegiserationFormda(id!);
                                                print(s.statusCode);
                                                if(s.statusCode==200){
                                                  pref.setString('status'+email, '');
                                                  pref.setString('imageAS'+email, '');
                                                  setState(() {
                                                    imageAddSub=null;
                                                    imageAS='';
                                                  });}
                                              },
                                              child: Icon(
                                                Icons.clear,
                                                color: Colors.red,
                                              ))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                      SizedBox(
                        height: 10.0,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {});
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => StatefulBuilder(
                                      builder: (context, StateSetter setState) {
                                    return SimpleDialog(
                                      title: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(AppLocalizations.of(context)!
                                                  .select_semester),
                                              InkWell(
                                                  onTap: () {
                                                    flutterYearPicker(context);
                                                  },
                                                  child: Text(
                                                    'level: ${year}',
                                                  ))
                                            ],
                                          ),
                                          Divider(
                                            thickness: 1,
                                          )
                                        ],
                                      ),
                                      contentPadding: EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          bottom: 20,
                                          top: 5),
                                      backgroundColor: Theme.of(context)
                                          .secondaryHeaderColor,
                                      children: [
                                        InkWell(
                                            child: Row(
                                              children: [
                                                Text(AppLocalizations.of(
                                                        context)!
                                                    .semester1),
                                              ],
                                            ),
                                            onTap: () async{
                                              final pref =
                                              await SharedPreferences
                                                  .getInstance();
                                              pref.setInt('semester' + email,
                                                  int.parse(year + '1'));
                                              SY=pref.getInt('semester' + email);
                                              selected = '1';
                                              setState(()  {

                                              });
                                              Navigator.pop(context);
                                            }),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        InkWell(
                                            child: Row(
                                              children: [
                                                Text(AppLocalizations.of(
                                                        context)!
                                                    .semester2),
                                              ],
                                            ),
                                            onTap: () async {
                                              final pref =
                                                  await SharedPreferences
                                                      .getInstance();
                                              pref.setInt('semester' + email,
                                                  int.parse(year + '2'));
                                              SY=pref.getInt('semester' + email);
                                              selected = '2';
                                              setState(() {});
                                              Navigator.pop(context);
                                            }),
                                      ],
                                    );
                                  }));
                          setState(() {});
                        },
                        child: Center(
                            child: Text(
                                'Semester is : ${SY != null ? SY.toString() : year + selected}')),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => StatefulBuilder(
                                      builder: (context, StateSetter setState) {
                                    return SimpleDialog(
                                        title: Container(
                                            padding: EdgeInsets.all(10),
                                            child: Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )));
                                  }));
                          validate();
                        },
                        child: Text(AppLocalizations.of(context)!.upload_img),
                      ),
                    ]))),
          );
  }

  Future flutterYearPicker(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        final Size size = MediaQuery.of(context).size;
        return AlertDialog(
          title: Column(
            children: [
              Text(AppLocalizations.of(context)!.select_year),
              Divider(
                thickness: 1,
              )
            ],
          ),
          backgroundColor: Theme.of(context).secondaryHeaderColor,
          content: SizedBox(
            height: size.height * 0.08,
            child: GridView.count(
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 4,
              childAspectRatio: 1.5 / 1,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              children: [
                ...List.generate(4, (index) {
                  return InkWell(
                    onTap: () async {
                      final pref = await SharedPreferences.getInstance();
                      setState(() {
                        year = (1 + index).toString();
                        pref.setInt(
                            'semester' + email, int.parse(year + selected));
                        SY=pref.getInt('semester' + email);
                        Navigator.pop(context, year);
                      });
                    },
                    child: Chip(
                      backgroundColor: Theme.of(context).primaryColor,
                      label: Container(
                        child: Text(
                          (1 + index).toString(),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }

  void vaildateAdd_Sub() async {
    if (imageAddSub == null) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('No image exist')));
    } else {
      RegisterationFormModel data = await ApiManager.storeRegisterationFormda(
          imageAddSub!, year + selected);
      if (data.success == true) {
        Navigator.pop(context);
        Navigator.pop(context);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('image is uploaded')));
        id = data.payload!.id;
        print('===============>data send ${data.payload!.id}');
        showImage();
        setState(() {});
      } else {
        Navigator.pop(context);
        Navigator.pop(context);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('something error')));
        print('===============>errorData ${data.message}');
      }
    }
  }

  void validate() async {
    if (imageFile == null) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('No image exist')));
    } else {
      RegisterationFormModel data = await ApiManager.storeRegisterationFormre(
          imageFile!, year + selected);
      if (data.success == true) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('image is uploaded')));
        id = data.payload!.id;
        print('===============>data send ${data.payload!.id}');
        showImage();
        setState(() {});
      } else {
        Navigator.pop(context);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('something error')));
        print('===============>errorData ${data.message}');
      }
    }
  }
}
