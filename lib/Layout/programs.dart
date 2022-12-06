import 'package:flutter/material.dart';
import 'package:project/partement.dart';
import 'package:project/providers/setting_provider.dart';
import 'package:project/Layout/select.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Programs extends StatefulWidget {
  static const String routeName = 'select_programs';

  @override
  State<Programs> createState() => _ProgramsState();
}

class _ProgramsState extends State<Programs> {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<SettingProvider>(context);
    List<String> programName = [
      AppLocalizations.of(context)!.cs_title,
      AppLocalizations.of(context)!.math_title,
      AppLocalizations.of(context)!.statistic_title,
      AppLocalizations.of(context)!.statisticmath_title,
      AppLocalizations.of(context)!.statisticcs_title,
      AppLocalizations.of(context)!.mathcs_title
    ];
    List<String> programImage = [
      'assets/images/computer-science.png',
      'assets/images/math.png',
      'assets/images/static.png',
      'assets/images/static&math.png',
      'assets/images/static&cs.png',
      'assets/images/math&cs.png'
    ];
    List<String> routeNames = [
      SelectionPart.routename,
      Programs.routeName,
      Programs.routeName,
      Programs.routeName,
      Programs.routeName,
      Programs.routeName,
    ];

    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          SizedBox(
            height: 15,
          ),
          Image.asset(pro.currTheme == ThemeMode.light
              ? 'assets/images/blue_logo.png'
              : 'assets/images/white_logo.png'),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: GridView.builder(
                itemCount: programName.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  crossAxisCount: 2,
                ),
                itemBuilder: (_, index) {
                  return Partment(programName[index], routeNames[index],
                      programImage[index]);
                }),
          ),
          TextButton(
            onPressed: ()async{
              const url='mailto:naglaa_reda@sci.asu.edu.eg';
               if (await canLaunchUrl(Uri.parse(url))) {
                 await launchUrl(Uri.parse(url));
              } else {
              throw 'Could not launch $url';
            }},
            child:Text(
            AppLocalizations.of(context)!.qa,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),)
        ]),
      ),
    ));
  }
}
