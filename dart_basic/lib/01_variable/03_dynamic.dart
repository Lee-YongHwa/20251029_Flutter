main() {
  // dynamic 변수에 값이 들어가면 동적 할당:타입 검사 없는 완전한 동적 변수
  // 업뎃(O), 재선언(X), 타입 고정(X)

  dynamic name = "Hello";
  print(name);
  print(name.runtimeType);
  print(name + 2); // 숫자와 문자 더하기 연산 불가: 타입 불명확

  name = true;  // 타입 고정(X)
  print(name);
  print(name.runtimeType);
  // dynamic name = 10; // 재선언 (X)
  name = 10.123;  // 업뎃(O)
  print(name);
  print(name.runtimeType);
}