//пакет с математическими операциями
import 'dart:math';

//Объекты и классы
class Rectangle {
  num left=0, top=0, widht=1, height=1;

  Rectangle(this.left, this.top, this.widht, this.height);
  //Геттеры и сеттеры
  num get right => left + widht;
  num get bottom => top + height;
  set right(num value) => left = value - widht;
  set bottom(num value) => top = value - height;

}

class Paladin {
  num level=0;
  num atack=1;
  num defense=0;

  //Конструктор класса обычный
  /*Paladin(num level, num atack, num defense){
    this.level=level;
    this.atack=atack;
    this.defense=defense;
    } */
  //Конструктор (основной) класса с именованными параметрами
  Paladin({this.level=0, this.atack=1, this.defense=0});

  //Двойной конструктор (дополнительный вариант к основному)
  Paladin.darkknight({this.level=0}) {
  atack = level + 10;
  defense = level + 5;
  }

  //Двойной конструктор с инициализацией (это указывается через две точки :) через доп. переменные
  Paladin.ultras(level,ultrasadd) :
        level = level,
        defense = level + 5,
        atack = level + 10+ultrasadd;

  String about() {
  return 'Level [$level], atack [$atack], defense [$defense]';
  }

  @override // Переназначаем стандартную для любого объекта функцию
  String toString() => 'Paladin: Level [$level], atack [$atack], defense [$defense]';
}

var myPalladin = Paladin(level: 1);

class DarkWarrior extends Paladin {
 num dark_power = 0;

 static int _level_random () =>
 Random().nextInt(100);

 // Конструкторы не наследуются а берутся по умолчанию, поэтому чтобы наследовать
 // нужно явно прописать ссылаясь на рлодителя через слово super
 DarkWarrior ({this.dark_power=0}): super.darkknight(level: _level_random ());

 @override String toString() {
  return '${super.toString()} + dark_power = [$dark_power]';
 }

}

//*****************************************************************************
//Абстрактный класс - нужен как контейнер с которым нельзя работать напрямую,
// т.е. мы не можем создать напрямую объект абстрактного класса, используя его
// конструктор но через другие классы расширения мы можем использовать некие
// общие для них методы
abstract class AbstractClass {
  void abstractMethod();
}

//можем использовать наследование для абстрактных классов но только один
class MyAbstractClass extends AbstractClass {
  @override
  void abstractMethod() {
    print('Abstract method have called');
  }
}

//Интерфейсы *******************************************************************
//Тут нужен некий класс, допустим пусть будет Person
class Person {
  final _name;
  Person(this._name);
  String greet (String who) => 'ПРивет, $who. Меня зовут $_name';
}
// и под этот класс мы пишем интерфейс используя ключевое слово implements
class Impostor implements Person {
  @override
  get _name => '';
  @override
  String greet(String who) => 'Дарова, $who';
}

//топ левел функция использующая класс Person в качестве входного параметра
String greetBob(Person person) => person.greet('Bob');

void PersonMeeting() {
  //далее если можем юзать эту функцию greetBob как передавая туда основной класс Person
  print (greetBob(Person('Alex')));
  //так и интерфейс (имплементацию) этого класса Impostor
  print(greetBob(Impostor()));
}

//Выводы:
// 1 - Абстрактный класс описывает что реализовывать но не описывает как
// а интерфейс описывает и что нужно реализовывать и как
// 2 - Абстрактный класс можно наследовать только 1, а интерфейсы можно реализовывать несколько раз
// 3 - Экземпляр абстрактоного класса создать нельзя а экземпляр интерфейса можно
// 4 - Абстрактный класс связывает и объединяет классы, имеющие близкую связь
// а интерфейсы могут связывать классы не имеющие ничего общего

//******************************************************************************
// Переопределение операторов внутри класса
class Vector {
  late int x=0, y=0;
  Vector (this.x, this.y);

  Vector operator + (Vector v) => Vector(x+v.x, y+v.y);
  Vector operator - (Vector v) => Vector(x-v.x, y-v.y);

  //перехват обработчика внутри класса
  @override
  void noSuchMethod (Invocation inv) {
    print('Вы пытаетесь использовать нереализованный метод ${inv.memberName} ');
  }
  void hello();
}

void OperatorInClass() {
  Vector v1 = Vector(1,2);
  Vector v2 = Vector(3,4);
  print('${(v1+v2).x},${(v1+v2).y}');

  //а тут попытка вызвать неописанный метод
  var v = Vector(1, 1);
  v.hello(); //v1.hello();
}
//******************************************************************************
//Расширение существующего класса
extension NumberParsing on String {
  int parseInt() => int.parse(this);
  double parseDouble() => double.parse(this);
}

void tryExtended() {
  print('777'.parseInt());
  print('777.11'.parseDouble());
}

//******************************************************************************
//Перечисления
// 1 - нельзя от них наследоваться
// 2 - нельзя смешивать (mixin)
// 3 - нельзя реализовывать (Implement)
// 4 - нельзя создавать экземпляр перечисления

enum NewColor {red, green, blue}

void enum_realization() {
  print(NewColor.red.index);
  List<NewColor> colors = NewColor.values;
  var aColor = NewColor.red;

  switch (aColor) {
    case NewColor.red:
      print('Красный');
      break;
    case NewColor.green:
      print('Зелёный');
      break;
    default: print('ХЗ - $aColor');
  }
}

//******************************************************************************
//Примеси mixin

mixin BasicFeaturesMixin on Human{ // тут мы указали что миксин только для Human
//mixin BasicFeaturesMixin { // а тут мы не указали ограничений на этот миксин
  num strength = 5;
  num agility = 5;
  num stamina = 5;
  void recover() => print('Восстановим силы');
}

class Human {
  num defense = 15;
  void lightPower() => print("Эпическая сила!!!");
}

//причём миксиннов можно прицепить сколько угодно
class YoungWarrior extends Human with BasicFeaturesMixin {
  num atack = 5;
  YoungWarrior(this.atack);
}

void RealizeMixin () {
  YoungWarrior Younga = YoungWarrior(10);
  Younga.lightPower();
  Younga.recover();
  print('Сила = ${Younga.strength}');
  print('Ловкость = ${Younga.agility}');
  print('Выносливость = ${Younga.stamina}');
  //Как видим юнга унаследовал всё от человека и молодого воина с примесью BasicFeaturesMixin
}

//Nulable свойство класса ******************************************************
class character{
  final double hp;
  final double mp;
  //final double zz; - без описания в конструкторе компилятор не пропустит

  //Благодаря тому что мы в конструкторе заставим значения инициализироваться
  //у нас нет ошибки что final переменная не инициализирована и может быть null
  character(this.hp, this.mp);

  @override
  String toString() => 'we have hp:$hp and mp=$mp';
}

var char = character(10, 20);

//для именованых параметров нужно будет слово required для обязательных и
//признак ? для необязательных
class character2{
  final double hp;
  final double mp;
  final double? zz;
  late final int level;

  //Благодаря тому что мы в конструкторе заставим значения инициализироваться
  //у нас нет ошибки что final переменная не инициализирована и может быть null
  character2({required this.hp, required this.mp, this.zz}) : level=80 ;

  @override
  String toString() => 'we have hp:$hp and mp=$mp and level=$level and zz=$zz';
  //если late level мы не проинициализировали в конструкторе : level=80
  //то была бы ошибка при попытке toString
  //главное для late переменных не инициализировать их дважды иначе будет тоже ошибка
}

var char2 = character2(hp: 5, mp: 7);