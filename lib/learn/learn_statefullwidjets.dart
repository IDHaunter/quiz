import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorite = false;
  int _favoriteCount = 1000;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          child: IconButton(onPressed: _toggleFavorite, icon: _isFavorite ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border), color: Colors.red,),
        ) ,
        SizedBox(
          width: 40,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        )
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorite) {
        _isFavorite = false;
        _favoriteCount -= 1;
      } else {
        _isFavorite = true;
        _favoriteCount += 1;
      }
    });
  }

}

class PersonWidget extends StatelessWidget {
  const PersonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Япония, Старшая лига'),
      ),
      body: Container(
        child: _buildMainColumn(),
      ),
    );
  }

  Widget _buildMainColumn() {
    return ListView(
      children: [
        _BuildTopImage(),
        Center(
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(5),
                  child: _buildRating(), //Text('Рейтинг'),
                ),
                Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(5),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: _buildAction(),//Text('Кнопочки'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  child: _buildDesc(), //Text('Описание'),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _BuildTopImage() {
    return Container(
      child: Card(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
        elevation: 5,
        child: Image.asset(
          'assets/images/goose_640.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildRating() => const ListTile(
    title: Text('Гусь необыкновенный', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18), ),
    subtitle: Text('Япония, школа B1'),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[FavoriteWidget()],
    ),
  );

  Widget _buildAction() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      _buildButton('Блокирующий', Icons.star, Colors.black),
      _buildButton('Скорость 100', Icons.play_arrow, Colors.black),
      _buildButton('Возраст 3', Icons.school, Colors.black),
    ],
  );

  Widget _buildButton(String label, IconData icon, Color color) => Column(
    children: <Widget>[
      Icon(
        icon,
        color: Colors.black,
      ),
      Container(
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );

  Widget _buildDesc() => const Text('Гусь могучий и опытный, проходил стажировку в Ираке и Сирии. Способен метать особо тяжёлый бомбы с высот от 10 до 1000 метров. Полезная нагрузка 1 кг, вместимость фюзеляжа 0.7 кг. Один раз можно активировать режим камикадзе, способ задания цели фотографичекий с геолокацией по GPS.',
    softWrap: true, style: TextStyle(fontSize: 16.0),);

}