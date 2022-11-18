import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int count;
  final int total;

  //Функция чтобы очищать состояние
  final Function onClearState;

  Result({Key key, this.count, this.total, this.onClearState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Блок с обработкой результатов
    String msg = '';
    Widget img;

    if (0 <= count && count <= 3) {
      msg = 'Зомби';
      img = Image.asset('assets/images/zombie.png');
    } else if (4 <= count && count <= 7) {
      msg = 'Животное';
      img = Image.asset('assets/images/norm.png');
    } else if (8 <= count && count <= 16) {
      msg = 'Человек разумный';
      img = Image.asset('assets/images/norm_up.png');
    } else {
      msg = 'Кросафчег';
      img = Image.asset('assets/images/good.png');
    }

    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 15,
            spreadRadius: 0,
            offset: Offset(2.0, 5.0),
          )
        ],
        borderRadius: BorderRadius.circular(30.0),
        gradient: LinearGradient(colors: [
          Color(0xFF586FFF),
          Color(0xFFFF59e5),
          Color(0xFF8131FF),
        ]),
      ),
      child: Column(
        children: [
          Container(
            width: 272,
            height: 150,
            child: FittedBox(
              fit: BoxFit.contain,
              child: img,
            ),
          ),
          Container(
            child: Text(
              msg,
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          Text(
            'Верных ответов $count из $total',
          ),
          Divider(
            color: Colors.white,
          ),
          ElevatedButton(
            onPressed: onClearState, //без скобок значит не вызываем а просто передаём чтобы вызвать потом по нажатию
            child: Text('Повторить тест'),
          )
        ],
      ),
    );
  }
}
