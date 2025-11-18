// dart언어에서 람다함수는 단 하나의 스테이트먼트를 가진다.
void main() {
  // 1) 다른 함수의 매개변수로 전달할 때 사용
  List<int> numbers = [1,2,3,4,5];
  var squared = numbers.map((n) => n*n);
  print(squared);print(squared.runtimeType);
  squared = squared.toList();
  print(squared.runtimeType);
  final sumNumbers = numbers.reduce((value, element)=>value + element);
  print(sumNumbers); print(sumNumbers.runtimeType);

  // 2) 람다식으로 함수 선언
  var add = (int a, int b) => a + b;
  print(add(3,5));

  var sum = (a) => a * a; // 매개변수가 하나가 있어도 ()필요

  // 3) statement가 복수개 일경우 익명함수
  var greet = (String str) {
    str += "동에 번쩍 서에 번쩍";
    print('Hello ${str}');
  };
  greet('홍길동');
}