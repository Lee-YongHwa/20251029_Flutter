// dart 언어는 객체 지향 프로그래밍 방식을 사용.
// flutter 이런 객체지향 방식의 프레임워크
// class란 속성과 기능으로 구성

void main() {
  Idol idol = Idol();
  print(idol.name);
  idol.name = "winter";
  print(idol.name);
  idol.introduce();

}

class Idol {
  // 속성 선언시 초기화해야 하나, late,var, dynamic일때는 후에 초기화 가능
  var name;
  dynamic count;
  late List<Person> p;
  void introduce(){
    print("안녕하세요? 저는 $name입니다.");
  }
}

class Person {
  var name;
  var age;
}