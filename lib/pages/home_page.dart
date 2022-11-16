import 'package:flutter/material.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/widgets/answer.dart';

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
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(data.questions[_questionIndex].title,
              style: Theme.of(context).textTheme.caption,),
            ),
            ...data.questions[_questionIndex].answers.map(
                    (value) => Answer(title: value['answer'], )
            ).toList(),

            ElevatedButton(onPressed: () => setState(()=>_questionIndex++), child: Text('Ответить позже'))
          ],
        ),
      ),
    );
  }
}
