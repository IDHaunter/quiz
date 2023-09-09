
void testDt() async {

  print(DateTime.now().millisecondsSinceEpoch);
  //1667540307539

  DateTime now = DateTime.now();
  print('timestamp: ${now.hour}:${now.minute}:${now.second}.${now.millisecond}');
  //timestamp: 8:38:27.540

}