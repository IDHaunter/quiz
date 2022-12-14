import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final List<Icon> icons;
  final count;
  final total;
  int iFailed;

  ProgressBar({Key key, this.icons, this.count, this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    iFailed = icons.length;
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 0),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FittedBox(
              fit: BoxFit.contain,
              child: Text('Вопрос ${count+1} из $total',style: TextStyle(color: Colors.deepPurple[100])),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Text('Ошибок: $iFailed', textAlign: TextAlign.right, style: TextStyle(color: Colors.deepPurple[100])),
            ),
            SizedBox(
              width: 10,
            ),

            //...icons,
          ],
        ),
      ),
    );
  }
}
