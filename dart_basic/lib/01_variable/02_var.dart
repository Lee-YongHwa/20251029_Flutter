main() {
  // var 변수에 값이 들어가면 동적 할당:자동으로 타입을 추론된 일반 변수
  // 업뎃(O), 재선언(X), 타입 고정(O)

  // tot; // type, var, const, final 반드시 앞에 선언
  var name = "Dart";
  // name = 100; // 타입 고정(O)

  var num; // 타입을 추론할 근거가 없기 때문에 dynamic으로 간주
  print(num); // null
  print(num.runtimeType); // Null
  num = "Hello Dart";
  print(num);
  print(num.runtimeType);
  num = 100;
  print(num);
  num = true; // 업뎃(O)
  print(num);
  print(num.runtimeType);

  // var num = "1000";  // 재선언(X)


}