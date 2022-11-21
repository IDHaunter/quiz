import 'package:flutter/material.dart';
import 'package:quiz/pages/home_page.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final index;
  final questionData;
  final onChangeAnswer;

  Quiz({Key key, this.index, this.questionData, this.onChangeAnswer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTextStyle.merge(
          style: whiteTextStyleBig,
          child: Container(
            padding: EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 30),
            child: Text(
              questionData.questions[index].title,
              //style: Theme.of(context).textTheme.caption,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        ...questionData.questions[index].answers
            .map((value) => Answer(
                  title: value['answer'],
                  //передаём функцию без! скобок т.к. мы её не вызываем!
                  onChangeAnswer: onChangeAnswer,
                  isCorrect: value.containsKey('isCorrect') ? true : false,
                ))
            .toList(),
      ],
    );
  }
}
