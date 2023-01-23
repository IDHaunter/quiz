import 'package:flutter/material.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/widgets/progress_bar.dart';
import 'package:quiz/widgets/quiz.dart';
import 'package:quiz/widgets/result.dart';
import '../theme/theme_handler.dart';

// Декларативный подход
// UI = f (state)
// где f - это build методы виджетов, а state - состояние

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  createState() => _HomePageState();
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
          color: themeHandler.accentIconColor,
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
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/info_page');
                  },
                  icon: const Icon(
                    Icons.info_outline,
                    color: ThemeHandler.mainIconColor,
                  )),
               const SizedBox(
                 width: 44,
               ),

              const Expanded(child: Text('Тестирование', textAlign: TextAlign.center)),
              IconButton(
                  onPressed: () {
                    _clearState();
                  },
                  icon: const Icon(
                    Icons.restart_alt ,
                    color: ThemeHandler.mainIconColor,
                  )),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/list_page');
                  },
                  icon: const Icon(
                    Icons.list_alt_rounded,
                    color: ThemeHandler.mainIconColor,
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
              total: data.getQuestions.length,
            ),
            //прямо внутри пишем код типа если то то то иначе то
            _questionIndex < data.getQuestions.length
                ? Quiz(
                    index: _questionIndex,
                    questionData: data,
                    onChangeAnswer: _onChangeAnswer,
                  )
                : Result(
                    count: _countResult,
                    total: data.getQuestions.length,
                    onClearState: _clearState,
                  )

            // ElevatedButton(onPressed: () => setState(()=>_questionIndex++), child: Text('Ответить позже'))
          ],
        ),
      ),
    );
  }
}
