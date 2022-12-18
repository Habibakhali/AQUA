import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:project/student/Courses/course_selected.dart';
import 'package:project/student/Courses/courses.dart';
import 'package:project/student/layout/homeScreen.dart';

import 'model_question.dart';

class Questionner extends StatefulWidget {
  static const String routeName = 'Questionner';
  int currentQuestion = 1;
  @override
  State<Questionner> createState() => _QuestionnerState();
}

class _QuestionnerState extends State<Questionner> {
  late  PageController controller;

  @override
  void  initState(){
    super.initState();
    controller=PageController(initialPage: 0);
  }
  Widget build(BuildContext context) {
    List<Question> questions = [
      Question(AppLocalizations.of(context)!.q1, [
        Option(AppLocalizations.of(context)!.totally_disagree),
        Option(AppLocalizations.of(context)!.not_agree),
        Option(AppLocalizations.of(context)!.to_some_extent),
        Option(AppLocalizations.of(context)!.ok),
        Option(AppLocalizations.of(context)!.totally_ok),
      ],selected), Question(AppLocalizations.of(context)!.q2, [
        Option(AppLocalizations.of(context)!.totally_disagree),
        Option(AppLocalizations.of(context)!.not_agree),
        Option(AppLocalizations.of(context)!.to_some_extent),
        Option(AppLocalizations.of(context)!.ok),
        Option(AppLocalizations.of(context)!.totally_ok),
      ],selected), Question(AppLocalizations.of(context)!.q3, [
        Option(AppLocalizations.of(context)!.totally_disagree),
        Option(AppLocalizations.of(context)!.not_agree),
        Option(AppLocalizations.of(context)!.to_some_extent),
        Option(AppLocalizations.of(context)!.ok),
        Option(AppLocalizations.of(context)!.totally_ok),
      ],selected),
      Question(AppLocalizations.of(context)!.q4, [
        Option(AppLocalizations.of(context)!.totally_disagree),
        Option(AppLocalizations.of(context)!.not_agree),
        Option(AppLocalizations.of(context)!.to_some_extent),
        Option(AppLocalizations.of(context)!.ok),
        Option(AppLocalizations.of(context)!.totally_ok),
      ],selected), Question(AppLocalizations.of(context)!.q5, [
        Option(AppLocalizations.of(context)!.totally_disagree),
        Option(AppLocalizations.of(context)!.not_agree),
        Option(AppLocalizations.of(context)!.to_some_extent),
        Option(AppLocalizations.of(context)!.ok),
        Option(AppLocalizations.of(context)!.totally_ok),
      ],selected), Question(AppLocalizations.of(context)!.q6, [
        Option(AppLocalizations.of(context)!.totally_disagree),
        Option(AppLocalizations.of(context)!.not_agree),
        Option(AppLocalizations.of(context)!.to_some_extent),
        Option(AppLocalizations.of(context)!.ok),
        Option(AppLocalizations.of(context)!.totally_ok),
      ],selected),
      Question(AppLocalizations.of(context)!.q7, [
        Option(AppLocalizations.of(context)!.totally_disagree),
        Option(AppLocalizations.of(context)!.not_agree),
        Option(AppLocalizations.of(context)!.to_some_extent),
        Option(AppLocalizations.of(context)!.ok),
        Option(AppLocalizations.of(context)!.totally_ok),
      ],selected), Question(AppLocalizations.of(context)!.q8, [
        Option(AppLocalizations.of(context)!.totally_disagree),
        Option(AppLocalizations.of(context)!.not_agree),
        Option(AppLocalizations.of(context)!.to_some_extent),
        Option(AppLocalizations.of(context)!.ok),
        Option(AppLocalizations.of(context)!.totally_ok),
      ],selected), Question(AppLocalizations.of(context)!.q9, [
        Option(AppLocalizations.of(context)!.totally_disagree),
        Option(AppLocalizations.of(context)!.not_agree),
        Option(AppLocalizations.of(context)!.to_some_extent),
        Option(AppLocalizations.of(context)!.ok),
        Option(AppLocalizations.of(context)!.totally_ok),
      ],selected),
      Question(AppLocalizations.of(context)!.q10, [
        Option(AppLocalizations.of(context)!.totally_disagree),
        Option(AppLocalizations.of(context)!.not_agree),
        Option(AppLocalizations.of(context)!.to_some_extent),
        Option(AppLocalizations.of(context)!.ok),
        Option(AppLocalizations.of(context)!.totally_ok),
      ],selected), Question(AppLocalizations.of(context)!.q11, [
        Option(AppLocalizations.of(context)!.totally_disagree),
        Option(AppLocalizations.of(context)!.not_agree),
        Option(AppLocalizations.of(context)!.to_some_extent),
        Option(AppLocalizations.of(context)!.ok),
        Option(AppLocalizations.of(context)!.totally_ok),
      ],selected), Question(AppLocalizations.of(context)!.q12, [
        Option(AppLocalizations.of(context)!.totally_disagree),
        Option(AppLocalizations.of(context)!.not_agree),
        Option(AppLocalizations.of(context)!.to_some_extent),
        Option(AppLocalizations.of(context)!.ok),
        Option(AppLocalizations.of(context)!.totally_ok),
      ],selected),
      Question(AppLocalizations.of(context)!.q13, [
        Option(AppLocalizations.of(context)!.totally_disagree),
        Option(AppLocalizations.of(context)!.not_agree),
        Option(AppLocalizations.of(context)!.to_some_extent),
        Option(AppLocalizations.of(context)!.ok),
        Option(AppLocalizations.of(context)!.totally_ok),
      ],selected), Question(AppLocalizations.of(context)!.q14, [
        Option(AppLocalizations.of(context)!.totally_disagree),
        Option(AppLocalizations.of(context)!.not_agree),
        Option(AppLocalizations.of(context)!.to_some_extent),
        Option(AppLocalizations.of(context)!.ok),
        Option(AppLocalizations.of(context)!.totally_ok),
      ],selected), Question(AppLocalizations.of(context)!.q15, [
        Option(AppLocalizations.of(context)!.totally_disagree),
        Option(AppLocalizations.of(context)!.not_agree),
        Option(AppLocalizations.of(context)!.to_some_extent),
        Option(AppLocalizations.of(context)!.ok),
        Option(AppLocalizations.of(context)!.totally_ok),
      ],selected),
      Question(AppLocalizations.of(context)!.q16, [
        Option(AppLocalizations.of(context)!.totally_disagree),
        Option(AppLocalizations.of(context)!.not_agree),
        Option(AppLocalizations.of(context)!.to_some_extent),
        Option(AppLocalizations.of(context)!.ok),
        Option(AppLocalizations.of(context)!.totally_ok),
      ],selected), Question(AppLocalizations.of(context)!.q17, [
        Option(AppLocalizations.of(context)!.totally_disagree),
        Option(AppLocalizations.of(context)!.not_agree),
        Option(AppLocalizations.of(context)!.to_some_extent),
        Option(AppLocalizations.of(context)!.ok),
        Option(AppLocalizations.of(context)!.totally_ok),
      ],selected), Question(AppLocalizations.of(context)!.q18, [
        Option(AppLocalizations.of(context)!.totally_disagree),
        Option(AppLocalizations.of(context)!.not_agree),
        Option(AppLocalizations.of(context)!.to_some_extent),
        Option(AppLocalizations.of(context)!.ok),
        Option(AppLocalizations.of(context)!.totally_ok),
      ],selected),
      Question(AppLocalizations.of(context)!.q19, [
        Option(AppLocalizations.of(context)!.totally_disagree),
        Option(AppLocalizations.of(context)!.not_agree),
        Option(AppLocalizations.of(context)!.to_some_extent),
        Option(AppLocalizations.of(context)!.ok),
        Option(AppLocalizations.of(context)!.totally_ok),
      ],selected), Question(AppLocalizations.of(context)!.q20, [
        Option(AppLocalizations.of(context)!.totally_disagree),
        Option(AppLocalizations.of(context)!.not_agree),
        Option(AppLocalizations.of(context)!.to_some_extent),
        Option(AppLocalizations.of(context)!.ok),
        Option(AppLocalizations.of(context)!.totally_ok),
      ],selected), Question(AppLocalizations.of(context)!.q21, [
        Option(AppLocalizations.of(context)!.totally_disagree),
        Option(AppLocalizations.of(context)!.not_agree),
        Option(AppLocalizations.of(context)!.to_some_extent),
        Option(AppLocalizations.of(context)!.ok),
        Option(AppLocalizations.of(context)!.totally_ok),
      ],selected),
      Question(AppLocalizations.of(context)!.q22, [
        Option(AppLocalizations.of(context)!.totally_disagree),
        Option(AppLocalizations.of(context)!.not_agree),
        Option(AppLocalizations.of(context)!.to_some_extent),
        Option(AppLocalizations.of(context)!.ok),
        Option(AppLocalizations.of(context)!.totally_ok),
      ],selected), Question(AppLocalizations.of(context)!.q23, [
        Option(AppLocalizations.of(context)!.totally_disagree),
        Option(AppLocalizations.of(context)!.not_agree),
        Option(AppLocalizations.of(context)!.to_some_extent),
        Option(AppLocalizations.of(context)!.ok),
        Option(AppLocalizations.of(context)!.totally_ok),
      ],selected), Question(AppLocalizations.of(context)!.q24, [
        Option(AppLocalizations.of(context)!.totally_disagree),
        Option(AppLocalizations.of(context)!.not_agree),
        Option(AppLocalizations.of(context)!.to_some_extent),
        Option(AppLocalizations.of(context)!.ok),
        Option(AppLocalizations.of(context)!.totally_ok),
      ],selected),
      Question(AppLocalizations.of(context)!.q25, [
        Option(AppLocalizations.of(context)!.totally_disagree),
        Option(AppLocalizations.of(context)!.not_agree),
        Option(AppLocalizations.of(context)!.to_some_extent),
        Option(AppLocalizations.of(context)!.ok),
        Option(AppLocalizations.of(context)!.totally_ok),
      ],selected), Question(AppLocalizations.of(context)!.q26, [
        Option(AppLocalizations.of(context)!.totally_disagree),
        Option(AppLocalizations.of(context)!.not_agree),
        Option(AppLocalizations.of(context)!.to_some_extent),
        Option(AppLocalizations.of(context)!.ok),
        Option(AppLocalizations.of(context)!.totally_ok),
      ],selected), Question(AppLocalizations.of(context)!.q27, [
        Option(AppLocalizations.of(context)!.totally_disagree),
        Option(AppLocalizations.of(context)!.not_agree),
        Option(AppLocalizations.of(context)!.to_some_extent),
        Option(AppLocalizations.of(context)!.ok),
        Option(AppLocalizations.of(context)!.totally_ok),
      ],selected),
    ];



    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.questioner,
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '${AppLocalizations.of(context)!.question} ${widget.currentQuestion} / ${questions.length}',
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Divider(
                thickness: 1,
              ),
              Expanded(
                  child: PageView.builder(
                    controller: controller,
                      itemCount: questions.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final q = questions[index];
                        return questionsItem(q);
                      })),
              Container(
                alignment: Alignment.topRight,
                  child: ElevatedButton(onPressed: (){
                    if(selected==null)return;
                   else if(widget.currentQuestion<questions.length){
                     setState(() {
                       widget.currentQuestion++;
                     });
                      controller.nextPage(duration: Duration(microseconds: 250), curve: Curves.easeIn);
                    }
                   else Navigator.pushReplacementNamed(context,HomeScreenStudent.routeName);

                  }, child: widget.currentQuestion<questions.length?Text(AppLocalizations.of(context)!.next):Text(AppLocalizations.of(context)!.submit))),
               SizedBox(height: MediaQuery.of(context).size.height*.25,),
            ],
          ),
        ));
  }


  Widget questionsItem(Question q) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        selected==null?Text(AppLocalizations.of(context)!.requ_question,style: TextStyle(color: Colors.redAccent),textAlign: TextAlign.start,):Text(""),
        Text(q.textQuestion),
        Expanded(
            child: ListView.builder(
                itemCount: q.option.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        selected=q.option[index];
                          setState((){});
                      },
                      child:
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.grey)),
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.all(8),
                              child: selected?.textAnswer!=q.option[index].textAnswer?
                              Text(q.option[index].textAnswer,style: TextStyle(color: Colors.black),):
                              Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(q.option[index].textAnswer,style: TextStyle(color: Colors.black)),
                                Icon(Icons.check_circle,color: Colors.green,)
                              ]))
                  );
                }))
      ],
    );
  }
  Option? selected;
}
