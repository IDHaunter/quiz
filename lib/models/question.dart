import 'package:flutter/cupertino.dart';

class Question {
  final String title;
  final List<Map> answers;

  Question({@required this.title, @required this.answers});
}

class QuestionData {
  final _data = [
    Question(title: 'Кем хочешь стать?', answers: [
      {
        'answer': 'Ведущим "Орла и Решки", Хочу повидать мир! ',
      },
      {'answer': 'Хирургом! " Хочу быть ближе к людям', 'isCorrect': 1},
      {
        'answer': 'Пародистом, чтобы куражиться и смешить ',
      },
      {
        'answer': 'Мастером на все руки',
      },
    ]),
    Question(title: 'Продолжи фразу: Сегодня я ..', answers: [
      {
        'answer': '.. люблю всех и вся ',
      },
      {
        'answer': '.. посажу дерево',
      },
      {
        'answer': '.. пойду волонтёрить в питомник ',
      },
      {
        'answer': '.. буду долго гнать велосипед, в глухих лесах его остановлю', 'isCorrect': 1,
      },
    ]),
    Question(title: 'Есть ли разница между вуду и худу?', answers: [
      {
        'answer': 'Да, как инь и янь ', 'isCorrect': 1,
      },
      {'answer': 'Да! Хочешь жить не спрашивай больше', 'isCorrect': 1},
      {
        'answer': 'Мне всё равно',
      },
      {
        'answer': 'Нет, о мёртвецах либо хорошо либо ничего',
      },
    ]),
    Question(title: 'Первый шаг чтобы стать зомби это..', answers: [
      {
        'answer': 'Спирт ',
      },
      {'answer': 'Смерть', 'isCorrect': 1},
      {
        'answer': 'Резиновая женщина',
      },
      {
        'answer': 'Сбоник по некромантии',
      },
    ]),
  ];

  List<Question> get questions => [..._data];
  //List<Question> get question { return _data; }

}
