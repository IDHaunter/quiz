import 'package:flutter/material.dart';
import 'package:quiz/row_column.dart';
import 'my-container.dart';
import 'my_flexible.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled; //отслеживание границ

void main() {
  debugPaintSizeEnabled=true; //активируем отслеживание границ
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: MyFlexMultiple()//MyFlexTextIconPic()//MyFlex()//MyContainerImage()//MyContainer() //MyRowColumn()//HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Тестирование'),
      ),
      body: Container(
        child: const Center(
          child: Text('Что-то тут будет...'),
        ),
      ),
    );
  }
}



