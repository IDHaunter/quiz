import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
//  const Answer({Key? key}) : super(key: key);
final String title;

Answer( {Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      padding: EdgeInsets.all(10),
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
        gradient: LinearGradient(colors: [Color(0xFF586FFF),Color(0xFFFF59e5),Color(0xFF8131FF),])
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
