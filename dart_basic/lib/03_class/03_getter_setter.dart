import 'dart:math';

void main() {
  Idol ive = Idol('아이브', 5);
  ive._name = '뉴진스';
  print(ive.name);
  ive.name = 'Ive';
  print(ive.weight);// late로 선언된 변수는 초기화하지 않으면 사용불가
}

class Idol{
  String _name; // 같은 파일내에서는 접근이 가능 다른 파일에서는 불가
  int _memberNum;

  // late, var, dynamic이 붙은 변수는 인스턴스 생성후에 초기화 가능.
  // late의 장점
  // 객체 생성시 즉시 초기화 되지 않으며 성능 최적화
  // 값이 필요할 때만 메모리를 사용함으로 메모리 절약
  // 무거운 연산이 필요할 경우 리소스 절약
  late int weight;
  late int height = fetchData();
  int fetchData() {
    return Random().nextInt(20)+160;
  }

  Idol(this._name, this._memberNum);

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get memberNum => _memberNum;

  set memberNum(int value) {
    _memberNum = value;
  }
}