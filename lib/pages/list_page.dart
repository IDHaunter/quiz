import 'package:flutter/material.dart';
import 'package:quiz/models/question.dart';
import '../theme/theme_handler.dart';
import 'answers_page.dart';

class RowQuestion extends StatefulWidget {
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
                onPressed: () {
                  // Navigator.pushNamed(context, '/answers_page');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AnswersPage(
                              answerCaption: widget.caption,
                              answers: widget.answers,
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
          child: RowQuestion(
            index: i,
            caption: _questionData.getQuestions[i].title,
            answers: [..._questionData.getQuestions[i].answers],
          )));
    }

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
      body: Container(
          color: Theme.of(context).primaryColor,
          child: ListView(
            itemExtent: 65,
            children: listQuestion,
          )),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Apple',
    'Banana',
    'Pear',
    'Watermelons',
    'Oranges',
    'Blueberries',
    'Strawberries',
    'Raspberries',
  ];

  @override
  ThemeData appBarTheme(BuildContext context) {
    //return Theme.of(context);
    return ThemeData(
      textTheme: const TextTheme(
        // текст запроса
        headline6: whiteTextStyleNormal,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: ThemeHandler.primarySwatchColor,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,

        // подсказка текста запроса
        hintStyle: hintTextStyleNormal,
      ),
      backgroundColor:ThemeHandler.primaryColor,
      scaffoldBackgroundColor:ThemeHandler.primaryColor,
    );
  }

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
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return Container(
        color: ThemeHandler.primaryColor,
        child: ListView.builder(
            itemCount: matchQuery.length,
            itemBuilder: (context, index) {
              var result = matchQuery[index];
              return ListTile(

                title: Text(result, style: whiteTextStyleLittle),
              );
            }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: результаты по предложениям (аналогично buildResults)
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return Container(
        color: ThemeHandler.primaryColor,
        child: ListView.builder(
            itemCount: matchQuery.length,
            itemBuilder: (context, index) {
              var result = matchQuery[index];
              return ListTile(
                title: Text(result, style: whiteTextStyleLittle),
              );
            }),
    );
  }
}
