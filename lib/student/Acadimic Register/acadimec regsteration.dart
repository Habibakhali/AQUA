import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project/API/api_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../API/Models/Student/academic_registry_api.dart';
import '../../API/Models/Student/post_acadimic_registration.dart';
import '../../providers/setting_provider.dart';
import '../Registration Form/register_files.dart';

class AcadimecRegsteration extends StatefulWidget {
  static const String routeName = 'AcadimecRegsteration';

  bool visible = true;

  @override
  State<AcadimecRegsteration> createState() => _AcadimecRegsterationState();
}

class _AcadimecRegsterationState extends State<AcadimecRegsteration> {
  String selected = '1';
  String year = '1';
  File? imageFile;
  List<String> lastfile =[];
  List<int> idss =[];
  String status = '';
  var pickedFile;
  int? id;
  late String email;
  late String password;
  late String token;

  chooseImage(ImageSource source) async {
    pickedFile = await ImagePicker().pickImage(
      source: source,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    print('statius: $status');
    setState(() {
      widget.visible = true;
      imageFile = File(pickedFile!.path);
    });
  }

  GetAcademicRegistryApi data = GetAcademicRegistryApi();

  void showImage() async {
    final pref= await SharedPreferences.getInstance();
    data = await ApiManager.getShowAcademicRegistry(id ?? 0);
    print('---------------------->${data.payload!.id!}');
    status = pref.getString('acadimic'+email)??'';
    lastfile=pref.getStringList('imagelist'+ pref.getString('email')!)??[];
    setState(() {});
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
    lastfile=pref.getStringList('imagelist'+ pref.getString('email')!)??[];
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
      body: Container(
          padding: EdgeInsets.all(30.0),
          child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        chooseImage(ImageSource.camera);
                      },
                      icon: Icon(
                        // <-- Icon
                        Icons.camera_alt_outlined,
                        size: 24.0,
                      ),
                      label:
                      Text(AppLocalizations.of(context)!.capture_img), // <-- Text
                    ),
                    Center(child: Text(AppLocalizations.of(context)!.or)),
                    ElevatedButton.icon(
                      onPressed: () {
                        chooseImage(ImageSource.gallery);
                      },
                      icon: Icon(
                        // <-- Icon
                        Icons.image,
                        size: 24.0,
                      ),
                      label: Text(AppLocalizations.of(context)!.gallery_img),
                    ),
                    imageFile==null&&status==''&&lastfile.isEmpty
                        ? Center(child: Text(AppLocalizations.of(context)!.no_img))
                        : status==''&&lastfile.isEmpty
                        ?
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Seleted image :'),
                        Icon(Icons.check_circle,color: Colors.green,)
                      ],
                    ):
                    Expanded(child: ListView.builder(
                      scrollDirection: Axis.horizontal,itemCount: lastfile.length,
                      itemBuilder: (_,index){
                        return Row(
                          children: [
                            RegisterFiles(lastfile[index].split('#')[0],(c)async{
                              final pref=await SharedPreferences.getInstance();
                              print('data===============>{}');
                              print(lastfile[index]);
                             var ddddd=await ApiManager.delAcadimicRegistery( int.parse(lastfile[index].split('#')[1]));
                             if(ddddd==200){
                               print('dele    ${ApiManager.imagesAc[index].split('#')[1]}');
                             setState(() {
                                lastfile.removeAt(index);
                                ApiManager.imagesAc.removeAt(index);
                                if(lastfile.length==0){
                              imageFile=null;
                              status='';
                                }
                                pref.setStringList('imagelist', lastfile);
                              });
                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Deletion success')));
                             }
                             else {
                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error when deletion')));
                             }
                            },index),
                            SizedBox(width: 8,)
                          ],
                        );
                      },
                    )),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {});
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => StatefulBuilder(
                                  builder: (context,
                                      StateSetter setState) {
                                    return SimpleDialog(
                                      title: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Text(AppLocalizations
                                                  .of(context)!
                                                  .select_semester),
                                              InkWell(
                                                  onTap: () {
                                                    flutterYearPicker(
                                                        context);
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
                                      backgroundColor:
                                      Theme.of(context)
                                          .secondaryHeaderColor,
                                      children: [
                                        InkWell(
                                            child: Text(AppLocalizations
                                                .of(context)!
                                                .semester1),
                                            onTap: () {
                                              setState(() {
                                                selected = '1';
                                                Navigator.pop(context,selected);
                                              });

                                            }),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        InkWell(
                                            child: Text(AppLocalizations
                                                .of(context)!
                                                .semester2),
                                            onTap: () {
                                              setState(() {
                                                selected = '2';
                                                Navigator.pop(context,selected);
                                              });

                                            }),
                                      ],
                                    );
                                  },),);
                              setState(() {});
                            },
                            child: Text(
                                'Select semester: ${year + selected}'),
                          ),
                        ]),
                    OutlinedButton(
                      onPressed: () {
                        showDialog(context: context, barrierDismissible: false,
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
                    SizedBox(
                      height: 20.0,
                    ),
                  ])
          )),
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
                    onTap: () {
                      setState(() {
                        year = (1 + index).toString();
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
  void validate() async {
    PostAcademicRegistryApi data = PostAcademicRegistryApi();
    if (imageFile != null)
      data = await ApiManager.storeAcademicRegistry(imageFile!, year+selected);
    else
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Image not exist')));
    if (data.success == true) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('image is uploaded')));
      id = data.payload!.id;
      showImage();
    } else {
      Navigator.pop(context);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('something error')));
    }
    print('--------------------------${token}');
  }
}