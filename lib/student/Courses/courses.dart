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
                child: TextField(
                  decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.find_your_course,
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search,color: Theme.of(context).canvasColor,)),

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
            Expanded(child:
            GridView.builder(
                itemCount: courseName.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  crossAxisCount: 2,
                  childAspectRatio: 1/1.15
                ),
                itemBuilder: (context, index) {
                  return widget.Selected[index]?
                  isSelected(courseName[index], 'assets/images/ocourse.png',index):
                  unSelected(courseName[index], 'assets/images/ocourse.png',index);
                   // Partment(courseName[index],coursesRoutes[index],'assets/images/ocourse.png');
                }),),
            Center(
              child: ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, CourseSelected.routeName,
              arguments: CourseArg(widget.sele)
              );}
              , child: Text('Select')),
            )
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
