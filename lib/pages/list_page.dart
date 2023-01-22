import 'package:flutter/material.dart';
import 'package:quiz/models/question.dart';
import '../theme/theme_handler.dart';
import 'answers_page.dart';

final QuestionData questionData = QuestionData();

class RowQuestion extends StatelessWidget {
  final int index;
  final String caption;
  final List<Map<String, String>> answers;

  const RowQuestion({required this.index, required this.caption, required this.answers, Key? key}) : super(key: key);

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
                    '${index + 1}. $caption',
                    softWrap: true, //работает перенос на новую строку
                    overflow: TextOverflow.fade, //при переполнении текст будет таять
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  // Navigator.pushNamed(context, '/answers_page');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AnswersPage(
                              answerCaption: caption,
                              answers: answers,
                            )),
                  );
                },
                icon: const Icon(
                  Icons.question_mark,
                  color: ThemeHandler.mainIconColor,
                ),
              ),
            ],
          ),
        ),
        Flexible(
          child: Divider(
            height: 2,
            color: themeHandler.dividerColor,
          ),
        ),
      ],
    );
  }
}

List<Widget> _createList([String sQuery = '']) {
List<Widget> listQuestion = [];

void add2ListQuestion (int i)
{
  listQuestion.add(DefaultTextStyle.merge(
      style: whiteTextStyleLittle,
      child: RowQuestion(
        index: i,
        caption: questionData.getQuestions[i].title,
        answers: [...questionData.getQuestions[i].answers],
      )));
}

if (sQuery == '')
  {
    for (int i = 0; i < (questionData.getQuestions.length); i++) {
      add2ListQuestion(i);
    }
  }
else {
  for (int i = 0; i < (questionData.getQuestions.length); i++) {
    if (questionData.getQuestions[i].title.toLowerCase().contains(sQuery.toLowerCase()))
    {      add2ListQuestion(i);
    }

  }
}
return listQuestion;
}

class ListPage extends StatelessWidget {
  ListPage({super.key});

  final List<Widget> listQuestion = _createList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DefaultTextStyle.merge(
          style: whiteTextStyleBig,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Expanded(child: Text('Список всех вопросов', textAlign: TextAlign.center)),
              IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: CustomSearchDelegate());
                },
                icon: const Icon(
                  Icons.search,
                  color: ThemeHandler.mainIconColor,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
      ),
      body: MakeList(listQuestion: [...listQuestion],),
    );
  }
}

class MakeList extends StatelessWidget {
  final List<Widget> listQuestion;
  const MakeList({required this.listQuestion, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ThemeHandler.primaryColor,
        child: ListView(
          itemExtent: 65,
          children: listQuestion,
        ));
  }
}


class CustomSearchDelegate extends SearchDelegate {

  @override
  ThemeData appBarTheme(BuildContext context) {
    //return Theme.of(context);
    return ThemeData(
      textTheme: Theme.of(context).textTheme.copyWith(headline6: whiteTextStyleNormal),
      appBarTheme: const AppBarTheme(
        backgroundColor: ThemeHandler.primarySwatchColor,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        // стиль подсказки текста запроса
        hintStyle: hintTextStyleNormal,
      ),
      backgroundColor:ThemeHandler.primaryColor,
      scaffoldBackgroundColor:ThemeHandler.primaryColor,
    );
  }

  @override
  String get searchFieldLabel => 'поиск';

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: список действий в конце панели (в нашем случае очистка фильтра)
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: список действий вначале панели
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: результаты поиска и сам цикл поиска с учётом фильтра query
    List<Widget> listQuestion = _createList(query);

    return
      MakeList(listQuestion: [...listQuestion],);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: результаты по предложениям (аналогично buildResults)
    List<Widget> listQuestion = _createList(query);

    return
      MakeList(listQuestion: [...listQuestion],);
  }
}
