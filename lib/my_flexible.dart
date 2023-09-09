import 'package:flutter/material.dart';

class MyFlex extends StatelessWidget {
  const MyFlex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Вёрстка теория'),
      ),
      body: Container(
        color: Colors.grey,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BiggerColorBox(),
            Flexible(
              //То что внутри ужимается до размера оставшегося экрана
              fit: FlexFit.loose, //loose - по умолчанию, значит не больше совего размера
              flex:
                  1,
              //То что внутри ужимается до размера оставшегося экрана
              child: ColorBox(), //1-это значение по умолчанию, означает что элемент растягивается на всё пространство в равных долях.
            ),
            Flexible(
              fit: FlexFit.tight, //tight - на всё пространство элемента
              flex: 1,
              child: ColorBox(),
            ),
            //SizedBox - Используется обычно для задания расстояния между соседними виджетами
            // SizedBox(
            //   width: 10,
            // ),
            // SizedBox(
            //   width: 10,
            //   height: 50,
            //   child: ColorBox(),
            // ),
            //Spacer - это тот же SizedBox но с параметром flex вместо ширины
            Spacer(
              flex: 1,
            ),
            //Expanded это Flexible без свойства fit (оно как бы tight)
            Expanded(
              flex: 1,
              child: ColorBox(),
            )
          ],
        ),
      ),
    );
  }
}

//Текст, иконка, картинка
class MyFlexTextIconPic extends StatelessWidget {
  const MyFlexTextIconPic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Вёрстка теория'),
      ),
      body: Container(
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                color: Colors.red[400],
                width: 50,
                child: const Text(
                  'Dart',
                  style: TextStyle(fontSize: 30, color: Colors.black45),
                  softWrap: true, //работает перенос на след строку
                  overflow: TextOverflow
                      .fade, //если отключить перенос то текст будет таять
                  //TextOverflow.visible - будет переть за границы
                  //TextOverflow.ellipsis - Троеточие ...
                )),
            const Icon(
              Icons.favorite,
              size: 50,
              color: Colors.redAccent,
            ),
            const Expanded(
               //child: Image.asset("assets/images/goose_640.jpg"),
               child: Image( image: AssetImage('assets/images/goose_640.jpg'), ),
            )
          ],
        ),

      ),
    );
  }
}

class ColorBox extends StatelessWidget {
  const ColorBox({super.key});

//  const ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors
            .redAccent[400], //в скобочках задаётся оттенок, это необязательно
        border: Border.all(),
      ),
      // child: Text('123'),
    );
  }
}

class BiggerColorBox extends StatelessWidget {
  const BiggerColorBox({super.key});

//  const ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.brown,
        border: Border.all(),
      ),
    );
  }
}

//Всё сразу из предыдущих уроков )))
class MyFlexMultiple extends StatelessWidget {
  const MyFlexMultiple({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Вёрстка теория'),
      ),
      body: Column(
        children: [Container(
          color: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  color: Colors.red[400],
                  width: 50,
                  child: const Text(
                    'Dart',
                    style: TextStyle(fontSize: 30, color: Colors.black45),
                    softWrap: true, //работает перенос на след строку
                    overflow: TextOverflow
                        .fade, //если отключить перенос то текст будет таять
                    //TextOverflow.visible - будет переть за границы
                    //TextOverflow.ellipsis - Троеточие ...
                  )),
              const Icon(
                Icons.favorite,
                size: 50,
                color: Colors.redAccent,
              ),
              const Expanded(
                //child: Image.asset("assets/images/goose_640.jpg"),
                child: Image( image: AssetImage('assets/images/goose_640.jpg'), ),
              )
            ],
          ),

        ),
          Container(
            color: Colors.grey,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BiggerColorBox(),
                Flexible(
                  //То что внутри ужимается до размера оставшегося экрана
                  fit: FlexFit
                      .loose, //loose - по умолчанию, значит не больше совего размера
                  flex:
                  1,
                  //То что внутри ужимается до размера оставшегося экрана
                  child: ColorBox(), //1-это значение по умолчанию, означает что элемент растягивается на всё пространство в равных долях.
                ),
                Flexible(
                  fit: FlexFit.tight, //tight - на всё пространство элемента
                  flex: 1,
                  child: ColorBox(),
                ),
                //SizedBox - Используется обычно для задания расстояния между соседними виджетами
                // SizedBox(
                //   width: 10,
                // ),
                // SizedBox(
                //   width: 10,
                //   height: 50,
                //   child: ColorBox(),
                // ),
                //Spacer - это тот же SizedBox но с параметром flex вместо ширины
                Spacer(
                  flex: 1,
                ),
                //Expanded это Flexible без свойства fit (оно как бы tight)
                Expanded(
                  flex: 1,
                  child: ColorBox(),
                )
              ],
            ),
          ),
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: Image.network(
                      'https://pixabay.com/get/gf017c393be54993bd70d3d38e191c4e95b9ddd54f93e3814c6cb33091eba18b0d1fdc0f65b61026d1d21e611c6f61600530607849ca19bb0d1fcea4453670f9a0fab9586509d937d1d9509662fe83813_640.jpg')
                      .image,
                  fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Text(
              'CodeAndArt',
              textAlign: TextAlign.right,
            ),
          ),
          Container(
            //color: Colors.amber[600],
            //alignment: Alignment.center,
            width: double.infinity,
            height: 100,
            //margin: const EdgeInsets.all(30.0),  //отступы снаружи
            //margin: EdgeInsets.fromLTRB(50, 100, 20, 10), //отступы слева-сверху-справа-снизу
            //margin: EdgeInsets.symmetric(vertical: 10, horizontal: 100), //симетрично верх-низ и слева-справа
            margin: const EdgeInsets.only(left: 50), //только с определённой стороны
            padding: const EdgeInsets.all(50.0), //отступы внутри
            decoration: BoxDecoration(
              //shape: BoxShape.circle,
                color: Colors.amber[600],
                border: Border.all()),
            child: const Text(
              'CodeAndArt',
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
    );
  }
}

