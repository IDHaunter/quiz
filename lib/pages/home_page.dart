import 'package:flutter/material.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/widgets/answer.dart';
import 'package:quiz/widgets/progress_bar.dart';
import 'package:quiz/widgets/quiz.dart';
import 'package:quiz/widgets/result.dart';

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

//Переменная со стилем (актуально после google fonts)
//имея её любой виджет можно заворачивать в DefaultTextStyle.merge( любой виджет )
const whiteTextStyleBig = TextStyle(color: Colors.white, fontSize: 22);
const whiteTextStyleLittle = TextStyle(color: Colors.white, fontSize: 14);

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
      });

  void _onChangeAnswer(bool isCorrect) {
    setState(() {
      if (isCorrect) {
        //_icons.add(Icon(Icons.brightness_1, color: Color(0xFFbd27FF),));
        _countResult++;
      } else {
        _icons.add(Icon(
          Icons.ac_unit,
          color: Colors.deepPurple[300],
        ));
      }

      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DefaultTextStyle.merge(
          style: whiteTextStyleBig,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 44,
              ),
              Expanded(child: Text('Тестирование', textAlign: TextAlign.center)),
              //Icon(Icons.list_alt_rounded, color: Colors.white,),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/list_page');
                  },
                  icon: Icon(
                    Icons.list_alt_rounded,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ),
      //Если решим удалить ApplicationBar то нужно Container обернуть в SafeArea чтобы на него не накладывалась
      //стандартная строка (время, батарейка и т.п.)
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            image: const DecorationImage(
              image: AssetImage('assets/images/bg_tr.png'),
              fit: BoxFit.fitWidth,
            )),
        child: Column(
          children: <Widget>[
            ProgressBar(
              icons: _icons,
              count: _questionIndex,
              total: data.questions.length,
            ),
            //прямо внутри пишем код типа если то то то иначе то
            _questionIndex < data.questions.length
                ? Quiz(
                    index: _questionIndex,
                    questionData: data,
                    onChangeAnswer: _onChangeAnswer,
                  )
                : Result(
                    count: _countResult,
                    total: data.questions.length,
                    onClearState: _clearState,
                  )

            // ElevatedButton(onPressed: () => setState(()=>_questionIndex++), child: Text('Ответить позже'))
          ],
        ),
      ),
    );
  }
}
