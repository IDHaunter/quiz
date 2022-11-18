import 'package:flutter/cupertino.dart';

class Question {
  final String title;
  final List<Map> answers;

  Question({@required this.title, @required this.answers});
}

class QuestionData {
  final _data = [
    Question(title: 'Разрешается ли работнику  заменить перегоревшую лампу в настольном светильнике', answers: [
      {
        'answer': 'Разрешается в присутствии инженера-энергетика',
      },
      {'answer': 'Не разрешается', 'isCorrect': 1},
      {
        'answer': 'Разрешается ',
      },
      {
        'answer': 'Разрешается в присутствии непосредственного руководителя',
      },
    ]),
    Question(title: 'Назовите телефонный номер вызова пожарной службы', answers: [
      {
        'answer': '103',
      },
      {
        'answer': '104',
      },
      {'answer': '101', 'isCorrect': 1},
      {
        'answer': '102',
      },
    ]),
    Question(title: 'Назовите телефонный номер вызова скорой медицинской помощи', answers: [
      {
        'answer': '101',
      },
      {
        'answer': '102',
      },
      {
        'answer': '104',
      },
      {
        'answer': '105',
      },
      {'answer': '103', 'isCorrect': 1},
    ]),
    Question(title: 'Кто несет ответственность за обеспечение пожарной безопасности на предприятии?', answers: [
      {'answer': 'руководитель предприятия ', 'isCorrect': 1},
      {
        'answer': 'работник',
      },
      {
        'answer': 'организации, осуществляющие услуги по договору',
      },
      {
        'answer': 'пожарная служба',
      },
    ]),
    Question(
        title:
            'Подлежат  ли расследованию и учету на предприятии несчастные случаи произошедшие с работником по пути следования на работу или с работы пешком?',
        answers: [
          {
            'answer': 'на усмотрение нанимателя',
          },
          {'answer': 'не подлежат', 'isCorrect': 1},
          {
            'answer': 'подлежат',
          },
          {
            'answer': 'на усмотрение работника',
          },
        ]),
    Question(
        title:
        'Работник, который не применяет СИЗ, обеспечивающих безопасность выполнения работ',
        answers: [
          {
            'answer': 'Изымается талон предупреждения',
          },
          {'answer': 'Отстраняется от работы', 'isCorrect': 1},
          {
            'answer': 'Ему объявляется замечание.',
          },
          {
            'answer': 'Ему объявляется выговор.',
          },
        ]),
    Question(
        title:
        'С какой даты исчисляются сроки носки средств индивидуальной защиты?',
        answers: [
          {
            'answer': 'С даты их первого применения',
          },
          {'answer': 'Со дня их фактической выдачи работнику', 'isCorrect': 1},
          {
            'answer': 'С даты их изготовления',
          },
          {
            'answer': 'С даты поступления на предприятие',
          },
        ]),
    Question(
        title:
        'Кто на предприятии несет ответственность за обеспечение работающих спецодеждой?',
        answers: [
          {
            'answer': 'наниматель', 'isCorrect': 1
          },
          {'answer': 'профсоюз', },
          {
            'answer': 'отдел охраны труда',
          },
          {
            'answer': 'работник',
          },
          {
            'answer': 'служба материально-технического обеспечения',
          },
        ]),
    Question(
        title:
        'Какие органы рассматривают трудовые споры?',
        answers: [
          {
            'answer': 'комиссия по трудовым спорам предприятия, народный суд', 'isCorrect': 1
          },
          {'answer': 'юридическая служба предприятия', },
          {
            'answer': 'нотариальная контора',
          },
          {
            'answer': 'профсоюз',
          },
          {
            'answer': 'наниматель',
          },
        ]),
    Question(
        title:
        'Первоочередные действия, оказывающего помощь при освобождении пострадавшего от электрического тока.',
        answers: [
          {
            'answer': 'выполнить искусственное дыхание',
          },
          {'answer': 'следует отключить ту часть установки, которая касается пострадавшего', 'isCorrect': 1},
          {
            'answer': 'выполнить непрямой массаж сердца',
          },
          {
            'answer': 'вызвать скорую помощь',
          },
          {
            'answer': 'ничего не предпринимать',
          },
        ]),
    Question(
        title:
        'Меры административной ответственности?',
        answers: [
          {
            'answer': 'лишение премии',
          },
          {'answer': 'предупреждение, наложение штрафа', 'isCorrect': 1},
          {
            'answer': 'выговор',
          },
          {
            'answer': 'увольнение',
          },
        ]),
    Question(
        title:
        'Какие дисциплинарные взыскания администрация предприятия может применить к нарушителям трудовой дисциплины?',
        answers: [
          {
            'answer': 'предупреждение, наложение штрафа',
          },
          {'answer': 'замечание, выговор, увольнение, лишение премии', 'isCorrect': 1},
          {
            'answer': 'перенос отпуска на зимний период',
          },
          {
            'answer': 'общественное порицание',
          },
        ]),
    Question(
        title:
        'Как осуществляется вызов пожарной службы по ручному пожарному извещателю?',
        answers: [
          {
            'answer': 'разбить стекло и ждать гудка',
          },
          {'answer': 'нажать кнопку и сказать свою фамилию'},
          {
            'answer': 'разбить стекло, нажать кнопку и сказать свою фамилию',
          },
          {
            'answer': 'разбить стекло, нажать кнопку и отпустить, ждать гудка', 'isCorrect': 1
          },
        ]),
    Question(
        title:
        'Перечислите первичные средства пожаротушения',
        answers: [
          {
            'answer': 'пожарный кран',
          },
          {'answer': 'все перечисленное в других ответах', },
          {
            'answer': 'пожарный извещатель',
          },
          {
            'answer': 'огнетушители, ящики с песком, кошма, бочка с водой', 'isCorrect': 1
          },
        ]),
    Question(
        title:
        'Разрешается ли работнику самостоятельно производить мелкий ремонт электрооборудования',
        answers: [
          {
            'answer': 'Разрешается в присутствии инженера-энергетика',
          },
          {'answer': 'Разрешается в присутствии непосредственного руководителя',},
          {
            'answer': 'Разрешается',
          },
          {
            'answer': 'запрещается', 'isCorrect': 1
          },
        ]),
    Question(
        title:
        'Какую группу по электробезопасности имеет  бухгалтер, экономист, начальник отдела кадров?',
        answers: [
          {
            'answer': 'третью',
          },
          {'answer': 'четвертую', },
          {
            'answer': 'вторую',
          },
          {
            'answer': 'первую', 'isCorrect': 1
          },
          {
            'answer': 'пятую',
          },
        ])
  ];

  List<Question> get questions => [..._data];
//List<Question> get question { return _data; }

}
