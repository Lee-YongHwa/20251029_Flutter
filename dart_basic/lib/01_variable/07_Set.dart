import 'dart:math';

main() {
  // Set 중복 불가, 순서 無
  // Set는 Iterable(반복 가능한 컬렉션)을 상속하기 때문에 함수형 메서드 사용가능
  List<int> list = List<int>.generate(10, (_) => Random().nextInt(5) + 1);
  print(list);
  Set<int> onlySet = list.toSet();
  print(onlySet);
  print("=" * 30);
  Set<int> numbers = {1, 2, 3, 4, 5};
  numbers.add(6);
  numbers.add(3); // 중복 허용 불가
  numbers.addAll([7, 8, 9]);
  print([7, 8, 9].runtimeType);
  numbers.remove(9);
  print(numbers);
  numbers.removeWhere((num) => num % 2 == 0);
  print(numbers);
  numbers.clear();
  print(numbers);

  Set<String> names = {'Alice', "Bob", "Charlie"};
  print(names.contains("Bob"));
  print(names.first);
  print(names.last);

  // map,where은 결과가 iterable 타입(set 전환하려면 toSet()),나머지는 Set
  numbers = {1, 2, 3, 4, 5}; // 직접 입력도 가능함.
  var doubled = numbers.map((n) => n * 2);
  print('doubled : ${doubled}');

  numbers = {1, 2, 3, 4, 5}; // 직접 입력도 가능함.
  var evens = numbers.where((n) => n.isEven);
  print('evens: ${evens}');

  numbers = {1, 2, 3, 4, 5}; // 직접 입력도 가능함.
  var sum = numbers.reduce((a, b) => a + b);
  print('reduce 한 sum: ${sum}');

  numbers = {1, 2, 3}; // 직접 입력도 가능함.
  var product = numbers.fold(10, (a, b) => a * b);
  print('fold 한 sum: ${product}'); // 60 = 10*1*2*3

  Set<int> setA = {1, 2, 3, 4};
  Set<int> setB = {3, 4, 5, 6};
  Set<int> setC = setA.union(setB);
  print(setC);

  print(setA.intersection(setB)); //교집합
  print(setA.difference(setB)); //차집합

  print(setC.map((n) => n * n)); // map과 where은 적용후 유지위해 다른 변수할당
  List<int> list2 = setC.toList();
  print(list2);
}
