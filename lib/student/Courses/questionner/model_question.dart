class Question {
  String textQuestion;
  List<Option> option;
  Option? selected;
  Question(this.textQuestion, this.option,this.selected);

}

class Option {
  String textAnswer;

  Option(this.textAnswer);
}
