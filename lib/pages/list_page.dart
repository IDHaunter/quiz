import 'package:flutter/material.dart';
import 'package:quiz/models/question.dart';
import 'home_page.dart';

class ListPage extends StatefulWidget {
  //const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final QuestionData _questionData = QuestionData();
  List<Widget> listQuestion = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < (_questionData.questions.length); i++) {
      listQuestion
          .add(DefaultTextStyle.merge(style: whiteTextStyleLittle, child: Text(_questionData.questions[i].title)));
    }

    return Scaffold(
      appBar: AppBar(
        title: DefaultTextStyle.merge(
          style: whiteTextStyleBig,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Expanded(child: Text('Список всех вопросов', textAlign: TextAlign.center)),
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
            children: listQuestion,
          )),
    );
  }
}
