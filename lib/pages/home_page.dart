import 'package:flutter/material.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/widgets/answer.dart';
import 'package:quiz/widgets/progress_bar.dart';

/*class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Тестирование'),
      ),
      body: Container(
        child: const Center(
          child: Text('Что-то тут будет...'),
        ),
      ),
    );
  }
}*/

// Декларативный подход
// UI = f (state)
// где f - это buid методы виджетов, а state - состояние

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
//createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final QuestionData data = QuestionData();
  int _countResult = 0;
  int _questionIndex = 0;
  List<Icon> _icons = [];

  //Обработчик для обнуления состояний
  void _clearState() => setState(() {
  _countResult = 0;
  _questionIndex = 0;
  _icons = [];
  } );

  void _onChangeAnswer(bool isCorrect) {
    setState(() {
      if (isCorrect) {
        _icons.add(Icon(Icons.brightness_1, color: Color(0xFFbd27FF),));
        _countResult++;
      } else {
        _icons.add(Icon(Icons.brightness_1, color: Color(0xFF000000),));
      }

      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Тестирование'),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
            color: Color(0xff2a375a),
            image: DecorationImage(
              image: AssetImage('assets/images/bg_tr.png'),
              fit: BoxFit.fitWidth,
            )),
        child: Column(
          children: <Widget>[
            ProgressBar(icons: _icons, count: _questionIndex, total: data.questions.length,),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(data.questions[_questionIndex].title,
              style: Theme.of(context).textTheme.caption,),
            ),
            ...data.questions[_questionIndex].answers.map(
                    (value) => Answer(title: value['answer'],
                    //передаём функцию без! скобок т.к. мы её не вызываем!
                      onChangeAnswer: _onChangeAnswer,
                    isCorrect: value.containsKey('isCorrect') ? true : false,)
            ).toList(),

           // ElevatedButton(onPressed: () => setState(()=>_questionIndex++), child: Text('Ответить позже'))
          ],
        ),
      ),
    );
  }
}
