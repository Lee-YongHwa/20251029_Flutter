void main() {
  double d = 3;

  // 이항 연산(사칙 연산)
  print(d + 2);
  print(d - 2);
  print(d * 2);
  print(d / 2);  //나누기만
  print(d % 2);  //나머지만
  print(d ~/ 2); //몫만

  int num = 10;
  // 단항 연산
  print(num++);
  print(num--);
  print(++num);
  print(--num);
  print(-num);
  print(~num); // 2의 보수 출력:: ~10 = -(10+1), ~(-1) = -(-1+1)=0
  print(!true);
  print("hello" is String);
  print("hello" is int);
  print("hello" is bool);
  print(int.parse("12"));
  print(bool.parse("true"));

  // 할당 연산자
  dynamic a = 10;
  print(a += 5);
  print(a -= 5);
  print(a *= 5);
  print(a /= 5);
  print(a %= 5);
  a = 10;
  print(a = (a ~/ 5) as int);  // 할당 연산자 as
  print(a.runtimeType);

  // 비교 연산자(Comparison Operators)
  a = 10;
  int b = 2;
  print(a == b);
  print(a > b);
  print(a != b);

  // 논리 연산자(Logical Operators)
  bool x = true, y = false;
  print(x && y);
  print(x || y);
  print(!x);

  // 비트 연산자(Bitwise Operators)
  print("비트 연산자 : $a, $b");
  print(a & b);
  print(a | b);
  print(a ^ b);
  print(~b);
  print(b << 2); //왼쪽 시프트
  print(a >> 2); //오른쪽 시프트

  // 삼항 연산자(Conditional Operators)
  print(a > b ? "big" : a == b ? "same" : "small");

  // Null 관련 연산자
  String? name; //널도 허용

  // print(name.length); // null허용해서 에러발생
  // print(name!.length); //null 이어도 강제 진행 but 예외발생,진행안됨
  name = "hello";
  print(name.length);

  String? str; // 변수에 null값 포함 가능
  str ??= "Hello"; //변수에 값이 없는 경우 Hello를 할당
  print(str);

  List<int>? numbers;
  List<int> numbers2 = [1,2,3, ...?numbers];
  print(numbers);  //null 출력

  // 문자열 연산과 비교
  String str1 = "Hello";
  print("str1.hashCode() : ${str1.hashCode}");
  String str2 = "hello";
  print("str2.hashCode() : ${str2.hashCode}");
  print(str2 == str1);
  print(identical(str1, str2));

  // 연산에 의한 문자열도 상수풀에 값이 중복될 경우 하나의 주소로만 사용
  String str3 = "Dart";
  String str4 = str3.substring(0,4);
  print(str4);
  print("str3.hashCode() : ${str3.hashCode}");
  print("str4.hashCode() : ${str4.hashCode}");
  print(str3 == str4);
  print(identical(str3, str4));

  String result = "";
  StringBuffer buffer = StringBuffer();
  print("result.hashCode() : ${result.hashCode}");
  print("buffer.hashCode() : ${buffer.hashCode}");
  for (int i = 0; i < 100; i++) {
    result += i.toString(); // +를 이용해서 문자열 객체를 생성하는 반복작업은 비추
    buffer.write(i); // 새로운 객체 생성 없이 버퍼를 사용하여 성능 향상.
  }
  print(result);
  print(buffer);
  print("result.hashCode() : ${result.hashCode}");
  print("buffer.hashCode() : ${buffer.hashCode}");
  print("identical(result, buffer) = ${identical(result, buffer)} ");

  print("C:\Program Files\Dart"); //C:Program FilesDart \는 특수문자
  print("C:\\Program Files\\Dart");
  print(r"C:\Program Files\Dart");

  String multiLine = '''
    다중 줄 문자열을 
    사용할 때 \''' 또는 """를 사용한다.
  ''';
  print(multiLine);

  // String의 메서드와 속성
  str = "Hello";
  print(str.length);
  print("Dart".toUpperCase());
  print("Dart".toLowerCase());
  print("    Dart   ".trim());
  print("    Dart   ".trimLeft());
  print("    Dart   ".trimRight());
  print("Hello World".replaceAll("World", "Dart"));
  print("Hello World".substring(0, 4));
  print("Hello World".contains("Wo"));
  print("Hello World".indexOf("l"));
  print("Hello World".lastIndexOf("l"));
  print("Boys be ambitious".split(" "));
  print("Boys be ambitious".split(" ").runtimeType);
  print("7".padLeft(3, "0"));
  print("Star".padRight(8, "⭐"));
  print("ABC".codeUnits); //문자열을 UTF-16 코드 List 반환
  print("".isEmpty);
  print("Hello".isNotEmpty);

}