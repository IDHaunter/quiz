//Определения типов - Typedefs
//typedefs - это способ задания алиаса для аналогичных по параметрам функций
// и использования его на месте где могла бы быть функция
//<T> - универсальный параметр, по сути тип который может быть чем угодно
// и буква Т ничего не значит, это могла быть другая буква
typedef Compare<T> = int Function(T a, T b);
int sort(int a, int b) => a-b;

// Определяем алиас который назовём GeeksForGeeks и он будет обобщать функции
// в которые передаётся два параметра int и получается на выходе int
typedef GeeksForGeeks = String Function (int a, int b);

// Определяем 1ую функцию где на входе 2 переменные int а на выходе String
String Geek1(int a, int b) {
  print("This is Geek1");
  print("$a and $b are lucky geek numbers !!");
  return "$a and $b are lucky geek numbers !!";
}

// Определяем вторую функцию где на входе 2 переменные int а на выходе String
String Geek2(int a, int b) {
  print("This is Geek2");
  print("$a + $b is equal to ${a + b}.");
  return "$a + $b is equal to ${a + b}.";
}

// Определяем функцию (некое пространство) использующее функцию 1 и 2
void mainGeek()
{
  // Используем алиас для некой переменной setNumber
  // связывая её с 1-ой функцией
  GeeksForGeeks setNumber = Geek1;
  // и вызываем setNumber по факту передавая параметры в 1-ую функцию
  setNumber(1,2);

  // Переопределяем setNumber
  // с Geek2 function
  setNumber = Geek2;
  setNumber(3,4);

  // А тут мы задали алиас Compare с типом int для функции sort
  Compare<int> sortVar = sort;
  print('$sortVar');
}

//******************************************************************************
//Чтобы класс можно вызывать как функцию у него  нужно задать метод call
class CallableFunction {
 String call(String a, String b, String c) => '$a $b $c';
}

var wf = CallableFunction();
var out = wf('Code','And','Art');

void doItAgain3 () {
  print(out);
}