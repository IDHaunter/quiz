import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/pages/info_page.dart';
import 'package:quiz/theme/theme_handler.dart';
import 'pages/list_page.dart';
import 'pages/home_page.dart';

//import 'package:quiz/row_column.dart';
//import 'my-container.dart';
//import 'my_flexible.dart';
//import 'test/test_statefullwidjets.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled; //отслеживание границ

void main() {
  debugPaintSizeEnabled = false; //активируем отслеживание границ
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //отключает баннер Debug в верхнем правом углу
      title: 'Quiz App',
      theme: ThemeData(
          primarySwatch: ThemeHandler.primarySwatchColor,
          primaryColor: ThemeHandler.primaryColor,
          textTheme: GoogleFonts.oldStandardTtTextTheme(
            Theme.of(context).textTheme,
          ),
          //TextTheme( caption: TextStyle( fontSize: 22.0, color: Colors.white, ),),
          //fontFamily: 'Georgia',
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => const HomePage(),
        '/list_page' : (context) => ListPage(),
      //  '/answers_page' : (context) => const AnswersPage(),
        '/info_page' : (context) => const InfoPage(),
      },
      //home: HomePage(), //PersonWidget(), //MyFlexMultiple()//MyFlexTextIconPic()//MyFlex()//MyContainerImage()//MyContainer() //MyRowColumn()//
    );
  }
}
