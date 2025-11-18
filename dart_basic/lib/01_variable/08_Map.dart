import 'dart:math';

void main() {
  Map<String, String> hogwarts = {
    'Harry Potter': '해리 포터',
    'Draco Malfoy': '드레이코 말포이',
    'Hermione Granger': '헤르미온느 그레인저',
    'Vold Morte': '볼드 모트',
  };
  print(hogwarts);
  print(hogwarts['Harry Potter']);

  // 1) forEach
  hogwarts.forEach((k, v) {
    print("$k  : $v");
    print('$k  : $v');
  });

  // 2) entries
  for (var entry in hogwarts.entries) {
    print("${entry.key} / ${entry.value}");
  }

  // 3) map 결과물은 iterable
  print("map${"=" * 20}");
  List<String> result = hogwarts.entries.map((entry)=>
    '${entry.key}: ${entry.value}').toList();
  print(result);
  var tmp = hogwarts.map((k,v) => MapEntry(k, "$v 🍭"));
  print(tmp);print(tmp.runtimeType);

  // 4) where
  Map<String, int> magicScore = {
    'Harry Potter' : 90,
    'Volde Morte'  : 91,
    'Draco Malfoy' : 77,
  };
  print('magicScore type: ${magicScore.runtimeType}');
  var highScore = magicScore.entries.where((entry) => entry.value >= 90);
  print(highScore);

  List<int> scores = magicScore.values.toList();
  int topScore = scores.reduce(max);
  print(topScore);

  String higher = magicScore.entries.first.key;
  int highPoint = magicScore.entries.first.value;
  String lower = magicScore.entries.first.key;;
  int lowPoint = magicScore.entries.first.value;
  for(var entry in magicScore.entries) {
    int tmp = entry.value;
    if(highPoint < tmp) {
      highPoint = tmp;
      higher = entry.key;
    } else {
      lowPoint = tmp;
      lower = entry.key;
    }
  }
  print('최고 점수: $higher ($highPoint)');
  print('최저 점수: $lower ($lowPoint)');

  // 5) 그외 기타🎸
  hogwarts.addAll({'Dumble Dore': '덤블도어', 'Sirius Black': '시리우스블랙'});
  print(hogwarts.containsKey('Harry Potter'));
  print(hogwarts.containsValue('해리 포터'));
  print(hogwarts.keys);
  print(hogwarts.values);
  print(hogwarts.length);
  print(hogwarts.isEmpty);
  print(hogwarts.isNotEmpty);
  hogwarts.putIfAbsent('Dumble Dore', () => '덤블 도어');
  print(hogwarts);
  hogwarts.remove('Dumble Dore');

  Map<String, int> magicScore2 = Map.from(magicScore); //deep copy
  magicScore2.putIfAbsent('Hegrid', () => 75);
  print(magicScore2);
  print(magicScore2.runtimeType);
  print(magicScore);
}
