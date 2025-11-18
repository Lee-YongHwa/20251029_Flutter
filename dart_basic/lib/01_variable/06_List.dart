import 'dart:math';

main() {
  // List는 generic을 사용하면 같은 타입을 받도록 된다.
  // List는 Iterable(반복 가능한 컬렉션)을 상속하기 때문에 함수형 메서드 사용가능
  // List 여러 값을 순서 대로 나열한 변수 , [] 사용
  List<String> blackPink = ['리사', '지수', '제니', '로제'];

  List<dynamic> mixed1 = [1, "hello", true, 3.14];
  List<Object>  mixed2 = [1, "hello", true, 3.14];
  var l1 = [1,2,3];  // 타입 추론 통해서 int인식, 혼합불가
  var l2 = <dynamic>[1, "hello", true, 3.14];

  print(blackPink);
  print('blackPink: $blackPink');
  print(blackPink.runtimeType);
  print(blackPink[0]);

  var whitePink = blackPink; // 얕은 복사
  blackPink.add('HOT');
  print(blackPink);
  print(whitePink);

  List<int> original = [1, 2, 3];
  List<int> deepCopy = List.from(original); // 깊은 복사
  deepCopy[0] = 99;
  print('original: $original'); // [1, 2, 3]
  print('deepCopy: $deepCopy'); // [99, 2, 3]
  print(identical(original, deepCopy)); // false (다른 객체)

  blackPink.addAll(['이날치', '삼날치']);
  print(blackPink);
  blackPink.insert(2, "일날치");
  blackPink.insertAll(2, ["빅뱅(패배제외)", "지누션"]);

  // map,where은 결과가 iterable 타입(List 전환하려면 toList()),나머지는 List
  // 1) 개별 접근 :: forEach
  for (var name in blackPink) print(name);
  for (var name in whitePink) print(name);

  // 2) 선택적 접근 :: where
  final newBlackPink = blackPink.where((name) => !name.contains('날치')).toList();
  print(newBlackPink);

  // 3) 개별적 변형 :: map
  final newBlePink = blackPink.map((name) {
    return '블랙핑크$name';
  });
  print(newBlePink);

  final bp = blackPink
      .where((name) => name.contains('날치'))
      .map((name) => 'new $name');
  print(bp);

  // 4) 개별적 접근 후에 combine(동일 타입) :: reduce
  final allMembers = blackPink.reduce((value, element) => '$value, $element');
  print(allMembers);
  print(allMembers.runtimeType);

  // 5) 개별적 접근 후에 combine(이종 타입을 어떤타입으로든지 반환) :: fold
  List<String> list2 = ['나루토','모아나','스티치','아그네스','미니언즈'];
  final allList = list2.fold<int>(0, (value, element) => value + element.length);
  print(allList);

  // 6) 원소 채우기 :: filled( growable은 리스트 생성후 크기변경가능여부 결정하는 매개변수
  List<int> list = List<int>.filled(10, 0, growable: true);
  print(list);
  list.add(0);
  print(list);
  for (int i = 0; i < list.length; i++) {
    list[i] = i + 1;
  }
  print(list);
  List<int> newList = list.map((item) => item * 0).toList();
  print(newList);

  // 7) 개별원소에 순차적인 값을 할당 :: generate
  List<int> list1 = List<int>.generate(10, (i) {
    return i + 1;
  });
  print(list1);
  var listEven = list1.where((num) => num % 2 == 0);
  print(listEven);//(2, 4, 6, 8, 10)
  print(listEven.runtimeType); // WhereIterable<int>

  // 8) 조건을 만족하는 요소가 하나 라도 있는지확인 :: any
  var score = List<int>.generate(10, (i) => Random().nextInt(50)+51);
  print(score);
  var anyScore = score.any((n) => n == 100);
  print(anyScore);

  // 9) 응용
  var list3 = List<int>.generate(10, (i) => i+1);
  int tmp = 0;
  list3 = List<int>.filled(10, 0, growable: true)
      .map((_) => tmp += 1).toList();

  print('list3: ${list3}');
  print(list3.reduce((tot, item) => tot+=item));
  int tot2 = 0;
  for(int i=0;i<list3.length;i++) {
    tot2 += list3[i];
  }
  print(tot2);


  // 10) 그 외 기타🎸
  print(score);
  print(score.length);
  print(score.isEmpty);
  print(score.isNotEmpty);
  print(score.contains(100));
  print(score.indexOf(100));
  print(score.elementAt(0));
  print('score: ${score}');
  score.sort();
  print('score sorted: ${score}');
  print(score.reversed.toList());
  score.shuffle();
  print('score shuffled: ${score}');
  score.remove(82);
  score.removeAt(2);
  score.removeWhere((num) => num %2 == 0);
  print(score);
  score.clear();
  print(score);

}
