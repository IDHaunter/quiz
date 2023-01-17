import 'package:flutter/material.dart';
import '../theme/theme_handler.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DefaultTextStyle.merge(
          style: whiteTextStyleBig,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Expanded(child: Text('Информация', textAlign: TextAlign.center)),
              SizedBox(
                width: 44,
              ),
              //Icon(Icons.list_alt_rounded, color: Colors.white,),
            ],
          ),
        ),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            image: const DecorationImage(
              image: AssetImage('assets/images/bg_tr.png'),
              fit: BoxFit.scaleDown,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              child: const Text(
                'Вопросы для аттестации ПУ СвязьИнформСервис, 2022 год.',
                textAlign: TextAlign.center,
                style: whiteTextStyleBig,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    '',
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(alignment: Alignment.bottomRight, children: const [
                  Image(image: AssetImage('assets/images/lis_purple.png')),
                  Opacity(
                    opacity: 0.5,
                    child: Text(
                      'created by LeeS  ',
                      style: purpleTextStyleSmall,
                    ),
                  ),
                ]),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                SizedBox(
                  width: 5, height: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
