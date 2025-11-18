void main() {
  C c = C();
  c.doit();

}
// mixin 안에 인스턴스 변수와 메서드 선언 가능,(제외:생성자,static)
// mixin은 사용할 때 with로 마치 상속한 것처럼 사용(다중 적용)
// Dart에 타입이름 중에 num이라고 하는 것이 존재 변수명으로 부적절
mixin A {
  int value = 100;
  void methodA(){print("A");}
}

mixin B {
  int value = 200;
  void methodA(){print("B");}
}
// 중복되는 경우 순서대로 겹쳐져서 마지막 B가 정의됨.
class C with A,B {
  void doit(){
    methodA();
    print(value);
  }
}

class Birds {
  late String _name;
  String get name => _name;
  set name(String value) => {_name = value};
  void layEgg(){print("알알");}
}

class Fish {
  late String _name;
  String get name => _name;
  set name(String value) {_name = value;}
}

// mixin ~ on ~ :: 상속받는 클래스 필요, 하나만 상속 가능
mixin Flyable on Birds {void fly(){print("훨 훨");}}
mixin Swimmable {void swim();}

// with :: 여러개를 상속 가능
class Duck extends Birds  with Flyable, Swimmable{
  @override
  void swim() {print("첨벙");}
}

