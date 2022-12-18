import 'package:flutter/material.dart';
import 'package:project/student/Courses/course_selected.dart';
import 'package:project/student/Courses/parallel.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Layout/partement.dart';


class Courses extends StatefulWidget {
  static const String routeName = 'Courses';
  List<String>sele=[];
  List<bool> Selected=[
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  TextEditingController ?_searchTextController;
  final FocusNode _node=FocusNode();
  void initState(){
    super.initState();
    _searchTextController=TextEditingController();
    _searchTextController?.addListener(() { setState(() {

    });});
  }
  List<String>?itemsListSearch;
  @override
  void dispose(){
    super.dispose();
    _node.dispose();
    _searchTextController?.dispose();
  }




  @override
  Widget build(BuildContext context) {
    List<String> courseName = [
      AppLocalizations.of(context)!.parallel,
      AppLocalizations.of(context)!.ai,
      AppLocalizations.of(context)!.project_a,
      AppLocalizations.of(context)!.image_process,
      AppLocalizations.of(context)!.security,
      AppLocalizations.of(context)!.geomety,
    ];


    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text:AppLocalizations.of(context)!.hi,
                            style: TextStyle(
                              color: Color(0xffFD6D8D),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            )),
                        TextSpan(
                            text: "Sara",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ]),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.handshake,
                      color: Colors.amber,
                    ),]),
          Image.asset(
            'assets/images/boyy.png',
            height: 100,
            width: 100,
          ),

            ]),
            Text(
              AppLocalizations.of(context)!.welcome,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                  blurRadius: 20,color: Colors.grey.withOpacity(0.5)
                ),],
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 15,left: 15),
                /*child: TextField(
                  decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.find_your_course,
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search,color: Theme.of(context).canvasColor,)),

                ),*/
                child: TextField(
                  onChanged: (value){
                    setState(() {
                      itemsListSearch=courseName.where((element) => element.toLowerCase().
                      contains(value.toLowerCase()))
                          .toList();
                      if(_searchTextController!.text.isNotEmpty&&itemsListSearch!.isEmpty){
                        print('itemsListSearch legnth${itemsListSearch!.length}');
                      }
                    });
                  },
                  controller:_searchTextController ,
                  focusNode: _node,
                  decoration: InputDecoration(
                      hintText:
                      AppLocalizations.of(context)!.find_your_course,
                      filled: true,
                      //fillColor: Theme.of(context).canvasColor,
                      hintStyle: Theme.of(context).textTheme.bodySmall,
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Theme.of(context).canvasColor,
                      ),
                      suffixIcon: IconButton(
                        onPressed:
                          _searchTextController!.text.isEmpty? null:(){
                          _searchTextController?.clear();
                          _node.unfocus();
                        },
                        icon: Icon(
                          Icons.cancel,color: _searchTextController!.text.isNotEmpty?Colors.red:Colors.grey,),
                      )),
                ),
              ),
            ),

            SizedBox(height: 20,),
            Text(AppLocalizations.of(context)!.choose_course,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 27),),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 60,
              height: 2,
              color: Color(0xffFD6D8D),
            ),
            SizedBox(
              height:20 ,
            ),
            _searchTextController!.text.isNotEmpty&&itemsListSearch!.isEmpty?
                Expanded(
                  child: Center(
                    /*child: Padding(
                      padding: EdgeInsets.all(5),*/
                      child: Column(
                        children: [
                          /*Padding(padding: EdgeInsets.all(5),*/
                          //child:
                          Icon(
                            Icons.search_off,
                            size: 100,
                          ),
                //  ),
                         // Padding(padding: EdgeInsets.all(5),
                            //child:
                            Text("No result found, \nplease try different keyword",
                            style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),


                        ],
                      ),
                    ),

                  )

                :

            Expanded(child:
            GridView.builder(
                itemCount: _searchTextController!.text.isNotEmpty?itemsListSearch!.length:
                    courseName.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  crossAxisCount: 2,
                  childAspectRatio: 1/1.15
                ),
                itemBuilder: (context, index) {
                  return widget.Selected[index]?
                  isSelected(
                    _searchTextController!.text.isNotEmpty?itemsListSearch![index]
                      :courseName[index], 'assets/images/ocourse.png',index):
                  unSelected(
                      _searchTextController!.text.isNotEmpty?itemsListSearch![index]
                      :courseName[index], 'assets/images/ocourse.png',index);
                   // Partment(courseName[index],coursesRoutes[index],'assets/images/ocourse.png');
                }),),
            Center(
              child: ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, CourseSelected.routeName,
              arguments: CourseArg(widget.sele)
              );}
              , child: Text('Select')),
            ),
          ],
            )

        ));
  }
  Widget isSelected(String x,String y,int index){
      return Stack(
            alignment: Alignment.topRight,
            children: [
              ElevatedButton(onPressed: (){
                widget.Selected[index]=!widget.Selected[index];
                if(widget.sele.contains(x))
                widget.sele.remove(x);
                setState(() {
                });
              }, child: Column(
                  children: [
                    Expanded(flex:2,child: Image.asset(y,)),
                    Expanded(child: Text(x,textAlign: TextAlign.center,style: TextStyle(color:Colors.white)
                      ,)),
                  ],
                ),
              ),
              Icon(Icons.done_outline,color: Colors.white,)
            ],
        );
    }
  Widget unSelected(String x,String y,int index) {

    return
      ElevatedButton(onPressed: () {
        widget.Selected[index] = !widget.Selected[index];
        if(!widget.sele.contains(x))
        widget.sele.add(x);
        setState(() {});
      }, child: Column(
        children: [
          Expanded(flex: 2, child: Image.asset(y,)),
          Expanded(child: Text(x, textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white)
            ,)),
        ],
      ),
      );
  }

}
class CourseArg{
  List<String>s=[];
  CourseArg(this.s);
}
