//Обобщённые типы и Generics
//Generics - это наследуемые типы родители указываемые явно в <>
//В Dart по умолчанию все коллекции имеют переменный тип, собственно указание
// явного типа (дженерика) помогает создавать типизированные коллекции
var games = <String>['gotic 2','witcher 3', 'TES 4', 'TES 4'];
var games2 = []; // не дженерик т.к. нет типа
var uniqueTerm = <String> {'strenth','agility','stamina'};
var uniqueTerm2 = {'strenth','agility','stamina'}; // не дженерик т.к. нет типа
var pages = <String, String> {
  'index.html' : 'Homepage',
  'admin.html' : 'Admin area'
};
var pages2 = { //не дженерик
  'index.html' : 'Homepage',
  'admin.html' : 'Admin area'
};

void doit1() {
  games[1]='CS2';
  //games[1]=2; - не прокатит т.к. дженерик
  games2[1]='CS2';
  games2[1]=2; //прокатило т.к. тип не указан и у каждого элемента он свой
  games2[2]='2'; //прокатило т.к. тип не указан
  //Проверка является ли games списком из строк
  print (games is List<String>);
}

//Метод с дженериками
class mys <String> {
  String bar<String> (List<String> myString) {
    String temp = myString[0];
    return temp;
  }
}