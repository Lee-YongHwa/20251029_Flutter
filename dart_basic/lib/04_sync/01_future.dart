void main() async {
  Future<String> name;
  Future<int> number;
  Future<bool> isOpened;
  Future<void> doNothing;
  // addNumbers(1, 1);

  // addNumbers2(1, 1);
  // addNumbers2(2, 2);

  // await addNumbers3(1, 1);
  // await addNumbers3(2, 2);

  final result1 = await addNumbers4(1, 1);
  print('Result1: $result1');
  final result2 = await addNumbers4(2, 2);
  print('Result2: $result2');
}

void addNumbers(int num1, int num2) {
  print('$num1 + $num2 계산 시작');
  Future.delayed(Duration(seconds: 3), () {
    print('$num1 + $num2 = ${num1 + num2}');
  });
  print('$num1 + $num2 계산 끝');
}

void addNumbers2(int num1, int num2) async {
  print('$num1 + $num2 계산 시작');
  await Future.delayed(Duration(seconds: 3), () {
    print('$num1 + $num2 = ${num1 + num2}');
  });
  print('$num1 + $num2 계산 끝');
}

Future<void> addNumbers3(int num1, int num2) async {
  print('$num1 + $num2 계산 시작');
  await Future.delayed(Duration(seconds: 3), () {
    print('$num1 + $num2 = ${num1 + num2}');
  });
  print('$num1 + $num2 계산 끝');
}

Future<int> addNumbers4(int num1, int num2) async {
  print('$num1 + $num2 계산 시작');
  await Future.delayed(Duration(seconds: 3), () {
    print('$num1 + $num2 = ${num1 + num2}');
  });
  print('$num1 + $num2 계산 끝');
  return num1 + num2;
}
