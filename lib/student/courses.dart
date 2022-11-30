import 'package:flutter/material.dart';

import '../partement.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Courses extends StatelessWidget {
  static const String routeName = 'Courses';

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
    List<String> coursesRoutes = [
      Courses.routeName,
      Courses.routeName,
      Courses.routeName,
      Courses.routeName,
      Courses.routeName,
      Courses.routeName,


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
                ),
                itemBuilder: (context, index) {
                  return
                    Partment(courseName[index],coursesRoutes[index],'assets/images/ocourse.png');
                }),),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


              ],
            )
          ],
            )

        ));
  }
}
