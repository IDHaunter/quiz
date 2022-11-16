import 'package:flutter/material.dart';
import 'pages/home_page.dart';

//import 'package:quiz/row_column.dart';
//import 'my-container.dart';
//import 'my_flexible.dart';
import 'test/test_statefullwidjets.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled; //отслеживание границ

void main() {
  debugPaintSizeEnabled = false; //активируем отслеживание границ
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          textTheme: TextTheme(
            caption: TextStyle(
              fontSize: 22.0,
              color: Colors.white,
            ),
          ),
        fontFamily: 'Georgia',
      ),
      home:
          HomePage(), //PersonWidget(), //MyFlexMultiple()//MyFlexTextIconPic()//MyFlex()//MyContainerImage()//MyContainer() //MyRowColumn()//
    );
  }
}
