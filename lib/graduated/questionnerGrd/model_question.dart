class QuestionGrd {
  String textQuestion;
  List<Option> option;
  Option? selected;
  QuestionGrd(this.textQuestion, this.option,this.selected);

}

class Option {
  String textAnswer;

  Option(this.textAnswer);
}
