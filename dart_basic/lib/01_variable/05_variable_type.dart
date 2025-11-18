import 'package:dart_basic/01_variable/Person.dart';

main() {
  // 변수의 타입으로 선언시 : 업뎃(O), 재선언(X), 타입 고정(O)
  // dart 언어에서 변수의 종류 : bool, int, double, String
  // null, Collection(List, Set, Map)
  // Dart에 타입이름 중에 num이라고 존재함.

  bool isBool = false;
  print(isBool);
  print(isBool.runtimeType);

  int isInt = 100;
  print(isInt);
  print(isInt.runtimeType);

  double isDouble = 100;
  print(isDouble);
  print(isDouble.runtimeType);

  String name;
  name = 'Hello';
  name = 'World';

  // String name; //재선언 불가
  // name  = 100; // 타입 변경 불가

  // 변수의 명명규칙
  // 변수는 반드시 문자 또는 '_'로 시작해야 한다.
  // 변수는 글자, 숫자, '_', '$' 의 조합으로 선언.
  // CamelCase, SnakeCase, 케밥표기법 등 다 되지만, 일관성 있게 작성요!

  // 기본 타입 형 변환(Primitive Type Casting)
  // 기본형 타입에서 자동 형변환은 없다. 대부분 명시적인 형변환!

  int a = 10;
  double b = a.toDouble(); // int → double
  print(b); // 10.0

  double d = 3.14;
  int c = d.toInt();  //double → int (소수점 버림)
  print(c); // 3 소수점 버림

  String str = "123";
  int num = int.parse(str);  // String → int
  print(num);

  int num2 = 42;
  String str2 = num2.toString();  // int → String
  print(str2);
  print(str2.runtimeType);
  print(str + 10.toString()); // 숫자와 문자의 연산시 반드시 타입을 일치!

  double dnum = double.parse("3.141592"); // String → double
  print(dnum);
  print(dnum.runtimeType);

  double d2 = 5.672;
  String str3 = d2.toString();  // double → String
  print(str3);
  String str4 = d2.toStringAsFixed(1);  // double -> String(소수점 이하 n자리)
  print("str4: " + str4); // 5.672 => 5.7
  String str5 = d2.toStringAsPrecision(2);// double -> String(전체 자리 n 조절)
  print("str5: " + str5); // 5.672 => 5.7
  String str6 = d2.toStringAsExponential(1);// double -> String(지수표기법)
  print("str6: " + str6); // 5.672 => 5.7

  Person p = Person(10);
  // print(p._pno); //다른파일의 _변수는 외부에서 접근 불가
  // p._pno;

  Temp t = Temp();
  print(t._tno);
}
// _로 시작한 변수는  해당 파일(library) 내부에서만 접근,
// 외부 파일에서는 접근 불가
class Temp {
  int _tno = 10;
}

