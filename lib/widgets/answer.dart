import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
//  const Answer({Key? key}) : super(key: key);
  final String title;
  final isCorrect;
  final Function onChangeAnswer;

  Answer({Key key, this.title, this.isCorrect, this.onChangeAnswer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //Обернули функцию в анонимную функцию т.к. нужно еще передать параметр
      onTap: () => onChangeAnswer(isCorrect),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        padding: EdgeInsets.all(12),
        width: double.infinity,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 10,
                offset: Offset(1.0, 1.0),
              )
            ],
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(colors: [
              Color(0xFF586FFF),
              Color(0xFFFF59e5),
              Color(0xFF8131FF),
            ])),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
