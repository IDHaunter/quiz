//Все функции, переменные и параметры рекомендуется начинать с маленькой буквы
//но все слова далее писать с большой

//Переменные в тексте юнита это top level переменные
var fullname = '';
const String firstname = 'Crazy'; //иницализируется единожды при присвоении
const String anyname = 'Any Crazy'; //инициализируется при компиляции
//dynamic - тип способный менять тип переменной многократно
// и вариант не инициализировать переменную и допускать null и проблемы с ним
// в отличие от var где тип будет определён при иницализации
//dynamic secondname;
//Object - базовый класс для всех объектов кроме null
//Object? secondname;
String secondname='';
//? - указывает на то что переменна может быть null
//!- это инструкция для компилятора не проверять переменную на Null
// (типа мы очень уверены что она не Null)
 int getIntValue(int? value) {value=123; return value;}
//?? - используется для проверки на null ( print(value ?? 0) ) типа если Null то 0
//if (value == null) { return 0;} - аналог
//return value == null ? 0 : value; - ещё аналог
//late - указывает на то что переменная будет инициализирована при первом
// присвоении, т.е. фактически она Null до этого. Late подходит не для всех типов
// и часто используется в сочетании со словом final, типа определили и всё
//late int int_name;
int? int_name;

class lateExample { //пример инициализации переменных в конструкторе
  late int intValue;
  late final double doubleValue;
  lateExample() {
    intValue=123;
    doubleValue=0.123;
  }
}

String altername = 'Foxy';
String nickname = '';

// arrays
List<int> list_sort = [0,1,22,33,4,5,66,77,8,9];
var list_names = ['satu','dua','tiga'];

void converting() {
  //
  int a=1;
  int b=2;
  String s='6';
  b= int.parse(s);
  print('Count is ${a+b}'  );
  print('Count is ${a+b}'  );
  //Округление
  print(3.14159.toStringAsFixed(2));

  double getvaluefromserver() {
    return 12.88;
  }

}

void testfunc() {
  var list =[3,2,1]; //набор не уникальных элементов переменного типа
  //в переменную передаём функцию
  toup(value) => '${value.toUpperCase()}';
  toup2(String ss) {return ss.toUpperCase(); }

  print(toup('fuckin shit happens 1'));
  print(toup2('fuckin shit happens 2'));

  String getModel1 (String title, int value) {
    return '$title - ${value + 10}';
  }

  String getModel2 ({String title = '', int value =0}) {
    return '$title - ${value + 10}';
  }

  print (getModel1('model',22));
  print (getModel2(title: 'model', value: 22));

  void printValue(int value) {
    print(value);
  }

  String printValue2(int value) {
    return value.toString();
  }
  //Через анонимную функцию
  for (var element in list) {print(element);}
  //Через функцию переданную в качестве параметра
  //list.forEach(print); //стандартная функция
  //list.forEach(printValue); //своя функция
  //Стрелочная функция
  //list.forEach((element) => print(element));
  //list.forEach((element) => print(printValue2(element)));

  //Ещё пример стрелочной функции
  //int addAB(int a, int b) => a+b;

}

//Функция с необязательными параметры
// _ - указатель будет значить что функция видна внутри юнита
void _say_hello (String name, String msg, [bool correct =false]){

  List anyMyList = [1,'asd',1,'asd']; //набор не уникальных не типизированных элементов
  anyMyList.add(1);
  anyMyList.add(1);

  List? anyMyList2; //тут мы объявили список с неопределёнными значениями способными быть null
  List<String>? anyMyList3; //тут типизированный список с возможностью быть null

  //print(anyMyList2[0]); - это не пропустит компилятор т.к. может быть null
  //print(anyMyList2![0]); - мы обещаем компилятору ! что это не null и работает!

  List<int> intMyList = [1,1,2,6]; //набор не уникальных но типизированных элементов
  var intMyList2 = <int> [1,1,1,3,6]; //ещё один вариант задания (<> - указатель на тип родителя, generic)

  intMyList.add(1);
  intMyList2.add(2);

  Set<String> names = {'bam','crash'}; //набор уникальных элементов
  names.add('boom');

  Map<String, String> myMap ={ //набор значение - значение
    'k1': 'Minsk',
    'k2': 'Gomel',
    'k3': 'Brest',
  } ;

  //Spread - оператор
  //Оператор (...) или с поддержкой значений Null (...?) служит
  //для добавления к множеству множества
  List<int> constantList = const [1, 2, 3];
  List<int> varList = [1, 2, 3, if (correct) ...constantList else
    4, 5, 6];
  List<int> resultList = [...constantList, ...varList];

  //Через анонимную функцию
  //var_list.forEach((element) {print(element)});
  //Через стрелочную функцию
  for (var element in resultList) {
    print(element);
  }

}

Set<void> qwerty = {_say_hello('','')};

void taskFindInList() {
//поиск неповторяющихся значений в массиве
  List<int> L1 = [1,2,3,4,5,6,7,8,9,0,9,8,7,6,5,4,3,2,1];
  Set<int> S1 = {};
  Set<int> S2 = {};

  print("Toatl items = ${L1.length}");

  // print(L1[1]);
  for (int i=0; i<(L1.length); i++){
    if(S1.contains(L1[i])){
      //print('Element ' + L1[i].toString() );
      S2.add(L1[i]);
    }
    S1.add(L1[i]);
  }

  final S3 = S1.difference(S2);
  print(S3);

  print("Done!") ;

}