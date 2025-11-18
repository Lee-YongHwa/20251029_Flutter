import 'dart:io';

void main() {
  stdout.write('점수를 입력하세요: ');

  String? input = stdin.readLineSync();
  int? score = int.parse(input ?? 0.toString());
  if (score >= 90) {
    print("A 학점");
  } else if (score >= 80) {
    print("B 학점");
  } else if (score >= 70) {
    print("C 학점");
  } else {
    print("낙제");
  }

  // 1)일반적인 switch case 문
  stdout.write("당신이 태어난 달을 입력하세요");
  input = stdin.readLineSync();
  int season = int.parse(input ?? 1.toString());
  switch (season) {
    case 3:case 4:case 5:
      print("Born in Spring");break;
    case 6:case 7:case 8:
      print("Born in Summer");break;
    case 9:case 10:case 11:
      print("Born in Autumn");break;
    case 12:case 1:case 2:
      print("Born in Winter");break;
    default:
      print("Please Input number between 1 from 12");
  }

  // 2) switch Expression
  var answer = switch (season) {
    3 || 4 || 5 => 'Born in Spring',
    6 || 7 || 8 => 'Born in Summer',
    9 || 10 || 11 => 'Born in Fall',
    12 || 1 || 2 => 'Born in Summer',
    _ => 'Are you born in the barn?',
  };

  // 3) Guard Clause : 조건 추가
  var answer2 = switch(season) {
    _ when [3, 4, 5].contains(season) => 'Born in Summer', //부가절이 조건절
    9 || 10 when season != 15 => 'Born in Fall', // 9또는 10이면서 15가 아닌경우
    (11 || 12 || 1 || 2) => 'Born in Winter',
    (6 || 7 || 8) => 'Born in Summer',
    _ => 'Are you born in the barn?'
  };
  (int a, int b) val = (1, -1); // Record라는 문법:여러값을 하나로 묶을때
  switch (val) {
    case (1, _) when val.$2 > 0: // 1 또는 아무거나 들어오는데 0보다 큰경우
      print('1, 2');
      break;
    default:
      print('default');
  }

  // 4) Pattern Matching :: Dart 3.0에 추가된 가장 강력한 기능
  void switcher(dynamic anything) {
    switch (anything) {
      case 'aaa':
        print('match: aaa');
        break;
      case [1, 2]: // 리스트의 원소가 1,2 인경우
        print('match: [1, 2]');
        break;
      case [_, _, _]:  // 리스트의 길이가 정확히 3일 경우
        print('match [_,_,_]*');
        break;
      case [int a, int b]: // 리스트의 원소가 2개이면서 int일 경우
        print('match: [int $a, int $b]');
        break;
      case (String a, int b): //리스트의 원소가 2개이면서 String, int일 경우
        print('match: (String: $a, int: $b)');
        break;
      default:
        print('no match');
    }
  }

  switcher('aaa');
  switcher([1, 3, 4]);

  // 5) Exhaustiveness Checking(완전 확인)
  bool? val2; // true, false, null 3가지 조건 모두 적용해줘야 함.
  switch (val2) {
    case true:
      print('true');
    case false:
      print('false');
    case null:
    // TODO: Handle this case.
    // throw UnimplementedError();
  }

  // 6) 중첩 switch 문
  switch (season) {
    case int num when num > 0 && num < 13:
      switch (num) {
        case 6 || 7 || 8:
          print('Born in Summer');
          break;
        case 9 || 10:
          print('Born in Fall');
          break;
        case 11 || 12 || 1 || 2:
          print('Born in Winter');
          break;
        case 3 || 4 || 5:
          print('Born in Spring');
          break;
        default:
          print('Are you born in the barn?');
      }
      break;
    default:
      print("입력된 수는 유효하지 않습니다.");
  }
}