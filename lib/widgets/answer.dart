import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
//  const Answer({Key? key}) : super(key: key);
  final String title;
  final bool isCorrect;
  final Function onChangeAnswer;
  final double needWidth;
  final double? needHeight;

  const Answer({Key? key, required this.title, required this.isCorrect, required this.onChangeAnswer, required this.needWidth, required this.needHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      //Обернули функцию в анонимную функцию т.к. нужно еще передать параметр
      onTap: () => onChangeAnswer(isCorrect),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: (needWidth<1000) ? 10 : 50, vertical: 10),
        padding: (needWidth<1000) ? const EdgeInsets.all(2) : const EdgeInsets.all(12) ,
        width: needWidth,// double.infinity,
        height: needHeight,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 10,
                offset: Offset(1.0, 1.0),
              )
            ],
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(colors: [
              Color(0xFF586FFF),
              Color(0xFFFF59e5),
              Color(0xFF8131FF),
            ])),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
