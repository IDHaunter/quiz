import 'package:flutter/material.dart';
import 'package:quiz/models/question.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Тестирование'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text('Вопрос!'),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text('Ответ 1'),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text('Ответ 2'),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text('Ответ 3'),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text('Ответ 4'),
            ),
          ],
        ),
      ),
    );
  }
}
