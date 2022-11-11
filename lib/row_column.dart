import 'package:flutter/material.dart';

class MyRowColumn extends StatelessWidget {
  //const MyRowColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Вёрстка теория'),
      ),
      body: Container(
        color: Colors.grey,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ColorBox(),BiggerColorBox(),ColorBox()],
        ),
      ),
    );
  }
}

class ColorBox extends StatelessWidget {
//  const ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.redAccent[400], //в скобочках задаётся оттенок, это необязательно
        border: Border.all(),
      ),
    );
  }
}

class BiggerColorBox extends StatelessWidget {
//  const ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.redAccent[400], //в скобочках задаётся оттенок, это необязательно
        border: Border.all(),
      ),
    );
  }
}
