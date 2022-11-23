import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/pages/answers_page.dart';
import 'pages/list_page.dart';
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
      debugShowCheckedModeBanner: false, //отключает баннер Debug в верхнем правом углу
      title: 'Quiz App',
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          primaryColor: const Color(0xff2a375a),
          textTheme: GoogleFonts.oldStandardTtTextTheme(
            Theme.of(context).textTheme,
          ),
          //TextTheme( caption: TextStyle( fontSize: 22.0, color: Colors.white, ),),
          //fontFamily: 'Georgia',
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => HomePage(),
        '/list_page' : (context) => ListPage(),
        '/answers_page' : (context) => AnswersPage(),
      },
      //home: HomePage(), //PersonWidget(), //MyFlexMultiple()//MyFlexTextIconPic()//MyFlex()//MyContainerImage()//MyContainer() //MyRowColumn()//
    );
  }
}
