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
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              child: const Text(
                'Вопросы для аттестации ПУ СвязьИнформСервис, 2023 год.',
                textAlign: TextAlign.center,
                style: purpleTextStyleBig,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: const Text(
                'версия 1.0.0',
                textAlign: TextAlign.center,
                style: purpleTextStyleNormal,
              ),
            ),
            const Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '',
                  )
                ],
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(alignment: Alignment.bottomRight, children: [
                  Image(image: AssetImage('assets/images/lis_purple.png')),
                  Opacity(
                    opacity: 0.5,
                    child: Text(
                      'created by IDH   ',
                      style: purpleTextStyleSmall,
                    ),
                  ),
                ]),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
