import 'package:flutter/material.dart';
import 'home_page.dart';

class AnswersPage extends StatelessWidget {
  final String answerCaption;
  final List<Map<String, String>> answers;
  const AnswersPage({Key key, this.answerCaption, this.answers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, String> myMap = {};
    //Если бы мы имели вложеные друг в друга виджеты а не отдельный экран то могли бы использовать context
    //Text( context.findAncestorWidgetOfExactType<RowQuestion>()?.caption ),
    //Text( context.findAncestorStateOfType<_RowQuestionState>().widget.caption ),
    List<Widget> listAnswers = [DefaultTextStyle.merge(
        style: whiteTextStyleBig,
        child: Center(child: Container(
            margin: EdgeInsets.only(top: 20, bottom: 10),
            child: Text(answerCaption, textAlign: TextAlign.center,))))];

    for (int i = 0; i < (answers.length); i++) {
      myMap = answers[i];
      listAnswers.add(DefaultTextStyle.merge(
          style: myMap.containsKey('isCorrect') ? purpleTextStyleNormal : whiteTextStyleNormal,
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(myMap['answer']))));
    }

    return Scaffold(
      appBar: AppBar(
        title: DefaultTextStyle.merge(
          style: whiteTextStyleBig,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Expanded(child: Text('Список ответов', textAlign: TextAlign.center)),
              SizedBox(
                width: 44,
              ),
            ],
          ),
        ),
      ),
      body: Container(
          color: Theme.of(context).primaryColor,
          child: ListView(
            //itemExtent: 100,
            children: listAnswers,
          )),
    );
  }
}