import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int count;
  final int total;

  //Функция чтобы очищать состояние
  final Function onClearState;

  Result({Key key, this.count, this.total, this.onClearState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Блок с обработкой результатов
    String msg = '';
    Widget img;

    if (0 <= count && count <= 3) {
      msg = 'Зомби';
      img = Image.asset('assets/bad.png');
    } else if (4 <= count && count <= 7) {
      msg = 'Что же ты такое...';
      img = Image.asset('assets/norm.png');
    } else if (8 <= count && count <= 16) {
      msg = 'Человек разумный';
      img = Image.asset('assets/norm_up.png');
    } else {
      msg = 'Кросафчег';
      img = Image.asset('assets/good.png');
    }

    return Container();
  }
}
