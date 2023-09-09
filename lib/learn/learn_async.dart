import 'package:quiz/learn/learn_functions.dart';
// Асинхронный код
// Все асинхронные операции в дарт возвращают тип Future
// При желании можно указать Generic
//Future<int> getDataFromServer() async {
Future getDataFromServer() async {
  var data = hackingServer();
}

int hackingServer() =>  1+3;

// При вызове функции, возвращающей Future, происходит две вещи:
// 1 - Функция встаёт в очередь на выполнение и возвращает незавершённый объект future
// 2 - Позже, когда операция завершена, future завершается со значением или ошибкой

Future<void> performTasks() async {
  task1();
  //подход через async-await
/*  try {
    String task2Result = await task2();
    task3(task2Result);
  } catch (error) {
    print(error);
  }*/
  // подход унаследованный от Java
  task2()
      .then((data) => task3(data))
      .catchError((error) => print(error));
}

void task1() {
  String result = 'task 1 data';
  print('task1 Done');
}

Future<String> task2() async {
  await Future.delayed(const Duration(seconds:3), () {
  String result = 'task 2 data';
  print('task2 Done');
  });

  return '2 already done';
}

void task3(String task2Data) {
  String result = 'task 3 data';
  print('task3 Done after taking $task2Data');
  fullname='task3 Done after taking $task2Data'; //работая в фоне ничего не обновит на экране
}

//Есть ещё способ асинхронной работы - потоки Stream ***************************
void doItInStream () async {
  Duration interval = const Duration(seconds: 1);
  Stream<int> stream$ = Stream<int>.periodic(interval, (x) => (x+1)*2);
  //задаём сколько поток будет эмитить события
  stream$ = stream$.take(5);

  await for (int i in stream$) {
    print(i);
    fullname=i.toString(); //работая в фоне ничего не обновит на экране
    //setState(() {});
  }
}