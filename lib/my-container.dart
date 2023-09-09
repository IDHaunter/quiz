import 'package:flutter/material.dart';
//Ctrl+space - вызов параметров внутри виджета
//Ctrl+W - выделить весь виджет
//Alt+ввод - список действий над виджетом, например обернуть в
//Ctrl+/ - закоментить много строк
//Ctrl+d - дублировать строку или стоки - что выделено
//Ctrl+b - ссылка на исходный код выделенного виджета

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Контейнер теория'),
      ),
      body: Center(
        child: Container(
          //color: Colors.amber[600],
          //alignment: Alignment.center,
          width: double.infinity,
          height: 300,
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
        ),
      ),
    );
  }
}

class MyContainerImage extends StatelessWidget {
  const MyContainerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Контейнер теория'),
      ),
      body: Center(
        child: Container(
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
      ),
    );
  }
}
