import 'package:flutter/material.dart';
import 'package:quiz/models/question.dart';
import 'home_page.dart';
import 'answers_page.dart';

class RowQuestion extends StatefulWidget {
  //const RowQuestion({Key? key}) : super(key: key);
  final int index;
  final String caption;
  final List<Map<String, String>> answers;

  const RowQuestion({required this.index, required this.caption, required this.answers, Key? key}) : super(key: key);

  @override
  State<RowQuestion> createState() => _RowQuestionState();
}

class _RowQuestionState extends State<RowQuestion> {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Expanded(
          flex: 12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                fit: FlexFit.tight, //tight - на всё пространство элемента
                child: Container(
                  padding: const EdgeInsets.only(left: 15, right: 5, top: 0, bottom: 3),
                  child: Text(
                    '${widget.index + 1}. ${widget.caption}',
                    softWrap: true, //работает перенос на новую строку
                    overflow: TextOverflow.fade, //при переполнении текст будет таять
                  ),
                ),
              ),
              IconButton(
                onPressed:
                    () {
                 // Navigator.pushNamed(context, '/answers_page');
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AnswersPage(answerCaption: widget.caption,answers: widget.answers,) ),);
                },
                icon: const Icon(
                  Icons.question_mark,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Flexible(
          child: Divider(
            height: 2,
            color: Colors.blueGrey[700],
          ),
        ),
      ],
    );
  }
}


class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final QuestionData _questionData = QuestionData();
  List<Widget> listQuestion = [];
  //String s = 'default text';

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < (_questionData.getQuestions.length); i++) {
      listQuestion.add(DefaultTextStyle.merge(
          style: whiteTextStyleLittle,
          child: RowQuestion(index: i, caption: _questionData.getQuestions[i].title, answers: [... _questionData.getQuestions[i].answers ],)));
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
            itemExtent: 65,
            children: listQuestion,
          )),
    );
  }
}
