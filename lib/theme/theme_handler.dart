import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Создание экземпляра Носителя всех настроек цветовой схемы
final ThemeHandler themeHandler = ThemeHandler();

//Цветовые настройки (Singleton pattern)
class ThemeHandler {
  //собственно фабрика для гарантирования инициализации одного экземпляра t
  static final ThemeHandler _t = ThemeHandler._internal();
  factory ThemeHandler() {
    return _t;
  }
  //Именованый конструктор который и нужен для создания t
  ThemeHandler._internal();

  //к полям static const внутри класса можно обращаться без создания экземпляра
  //сл-но это будут const конструкторы что хорошо для быстродействия
  static const Color mainTextColor=Colors.white;
  static const Color mainIconColor=Colors.white;
  static const Color mainShadowColor=Colors.black;
  static const MaterialColor primarySwatchColor=Colors.indigo;
  static const Color primaryColor=Color(0xff2a375a);

  static const LinearGradient mainGradient=LinearGradient(colors: [
  Color(0xFF586FFF),
  Color(0xFFFF59e5),
  Color(0xFF8131FF),
  ]);

  //для расчётных параметров нужен будет экземпляр (синглтон) и сл-но это будут не const конструкторы
  Color accentIconColor = Colors.deepPurple[300] ?? Colors.deepPurple;
  Color dividerColor = Colors.blueGrey[700] ?? Colors.blueGrey;
}

//Стили текста (актуально после google fonts)
//имея её любой виджет можно заворачивать в DefaultTextStyle.merge( любой виджет )
const whiteTextStyleBig = TextStyle(color: Colors.white, fontSize: 22);
const hintTextStyleNormal = TextStyle(color: Color(0xFF979DD3), fontSize: 20);
const purpleTextStyleBig = TextStyle(color: Color(0xfff1d5f6), fontSize: 22);
const purpleTextStyleNormal = TextStyle(color: Color(0xfff4b3ff), fontSize: 20);
const purpleTextStyleSmall = TextStyle( color: Color(0xfff4b3ff), fontSize: 10);

TextStyle whiteTextStyleNormal = GoogleFonts.oldStandardTt(color: Colors.white, fontStyle: FontStyle.normal, fontSize: 20);
TextStyle whiteTextStyleLittle = GoogleFonts.oldStandardTt(fontSize: 14, fontStyle: FontStyle.normal, color:Colors.white);