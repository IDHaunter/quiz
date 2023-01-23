import 'package:flutter/material.dart';
import '../theme/theme_handler.dart';

class Result extends StatelessWidget {
  final int count;
  final int total;

  //CallBack - функция чтобы очищать состояние
  final void Function() onClearState;

  const Result({Key? key, required this.count, required this.total, required this.onClearState}) : super(key: key);

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

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    if (screenHeight>screenWidth)
    //vertical
      {return Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: ThemeHandler.mainShadowColor,
              blurRadius: 15,
              spreadRadius: 0,
              offset: Offset(2.0, 5.0),
            )
          ],
          borderRadius: BorderRadius.circular(30.0),
          gradient: ThemeHandler.mainGradient,
        ),
        child: DefaultTextStyle.merge(
          style: whiteTextStyleLittle,
          child: Column(
            children: [
              SizedBox(
                width: screenWidth - 50,
                height: 150,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: img,
                ),
              ),
              Text(
                msg,
                textAlign: TextAlign.center,
              ),
               const Divider(
                color: ThemeHandler.mainTextColor,
              ),
              Text(
                'Верных ответов $count из $total',
              ),
              const Divider(
                color: ThemeHandler.mainTextColor,
              ),
              ElevatedButton(
                onPressed: onClearState, //без скобок значит не вызываем а просто передаём callback из конструктора чтобы вызвать потом
                child: const Text('Повторить тест'),
              )
            ],
          ),
        ),
      );
      }
    else
    //horizontal
      {return Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 15,
              spreadRadius: 0,
              offset: Offset(2.0, 5.0),
            )
          ],
          borderRadius: BorderRadius.circular(30.0),
          gradient: ThemeHandler.mainGradient,
        ),
        child: DefaultTextStyle.merge(
          style: whiteTextStyleLittle,
          child: Column(
            children: [
              SizedBox(
                width: screenWidth - 50 ,
                height: screenHeight - 210,
                child: Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 5,
                            child: img,
                            //GOT A BUG! Вставка fittedbox внутрь flexible вызывает ошибку
                            // FittedBox(
                            //   fit: BoxFit.contain,
                            //   child: img,
                            // ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Text(
                              msg,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 4,
                            child: ElevatedButton(
                              onPressed: onClearState,
                              child: const Text('Повторить тест'),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Text(
                              'Верных ответов $count из $total',
                            ),
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ],
          ),
        ),
      );
      }


  }
}
