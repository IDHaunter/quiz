import 'package:flutter/material.dart';
import 'package:quiz/pages/home_page.dart';
import 'answer.dart';
import 'package:quiz/models/question.dart';

class Quiz extends StatelessWidget {
  final int index;
  final QuestionData questionData;
  final Function onChangeAnswer;

  Quiz({Key key, this.index, this.questionData, this.onChangeAnswer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //1 way to get screen size is using MediaQuery
    //final screenWidth = MediaQuery.of(context).size.width;
    //final screenHeigth = MediaQuery.of(context).size.height;

    //second way is to using LayoutBuilder
    return LayoutBuilder(
        // ignore: missing_return
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth <= 500) {
        return Column(
          children: [
            DefaultTextStyle.merge(
              style: whiteTextStyleBig,
              child: Container(
                padding: const EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 20),
                child: Text(
                  questionData.getQuestions[index].title,
                  //style: Theme.of(context).textTheme.caption,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ...questionData.getQuestions[index].answers
                .map((value) => Answer(
                      needWidth: double.infinity,
                      needHeight: null,
                      title: value['answer'],
                      //передаём функцию без! скобок т.к. мы её не вызываем!
                      onChangeAnswer: onChangeAnswer,
                      isCorrect: value.containsKey('isCorrect') ? true : false,
                    ))
                .toList(),
          ],
        );
      } else {
        List<Widget> listQuizLeft = [];
        List<Widget> listQuizRight = [];
        Map<String, String> myMap = {};

        //listQuizLeft.add(Answer(title: 'new title', isCorrect: false, onChangeAnswer: onChangeAnswer, needHeight: 50, needWidth: 100, ));
        final double d = MediaQuery.of(context).size.height;

        for (int i = 0; i < (questionData.getQuestions[index].answers.length); i++) {
          if (i < 3) {
            myMap = questionData.getQuestions[index].answers[i];
            listQuizLeft.add(Answer(
              title: myMap['answer'],
              isCorrect: myMap.containsKey('isCorrect') ? true : false,
              onChangeAnswer: onChangeAnswer,
              needHeight: (d ~/ 8).toDouble(), //50,
              needWidth: ((constraints.maxWidth ~/ 2) - 20).toDouble(),
            ));
          } else {
            myMap = questionData.getQuestions[index].answers[i];
            listQuizRight.add(Answer(
              title: myMap['answer'],
              isCorrect: myMap.containsKey('isCorrect') ? true : false,
              onChangeAnswer: onChangeAnswer,
              needHeight: (d ~/ 8).toDouble(),
              needWidth: ((constraints.maxWidth ~/ 2) - 20).toDouble(),
            ));
          } //if
        } //for

        return Column(
          children: [
            DefaultTextStyle.merge(
              style: whiteTextStyleNormal,
              child: Container(
                padding: const EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
                child: Text(
                  questionData.getQuestions[index].title,
                  //style: Theme.of(context).textTheme.caption,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Row(
              children: [
                Column(
                  children: [...listQuizLeft],
                ),
                Column(
                  children: [...listQuizRight],
                ),
              ],
            )
          ],
        );
      }
    });
  }
}
