main(){
  // final 변수에 값이 들어가면 고정
  // 업뎃(X), 재선언(X), 타입 고정(X)
  // 실행할 때 초기화 1회 가능
  final String name = 'Hello World';
  final today = DateTime.now();
  // today = DateTime(2025); 재할당 금지: 업뎃 금지
  final int num;
  num = 100; // 선언과 초기화를 분리 가능, 단 1번만 값 할당.
  print(num);

  // const 변수에 값이 들어가면 고정
  // 업뎃(X), 재선언(X), 타입 고정(X)
  // 실행할 때 초기화 되는 상수에 사용 불가
  const double PI = 3.141592;
  print(PI);

  // 선언과 초기화 분리 불가
  // const String greet;
  // greet = "Good Afternoon";

  // 실행할 때 초기화 되는 상수 선언 불가
  // const DateTime date = DateTime.now();


}