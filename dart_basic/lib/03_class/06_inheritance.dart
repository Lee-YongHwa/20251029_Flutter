void main() {
  int tot = 10;
  Parent p1 = Parent();
  p1.instanceVar = "A";
  Parent.staticVar = "B";
  print(p1.instanceVar);
  // print(p1.staticVar); // 인스턴스 생성시 static은 제외
  print(Parent.staticVar);
  Parent p2 = Parent();
  print(p2.instanceVar);

  var c1 = Child();
  var c2 = Child();
  print(c1.instanceVar);
  print(c2.instanceVar);

  // 상속관계에서 형변환 : 모든 클래스가 Object를 상속
  // Child c3 = Parent(); //부->자 No(Downcasting):명시
  Parent p3 = Child(); //  자->부 Ok(Upcasting) : 자동
  print("===== ${p3.instanceVar}");//중복될 경우 자식 속성
  p3.instanceMethod(); //중복될 경우 자식 메서드(일관성)

  // as 연산자:: 상속 관계일 때 특정 타입으로 변환하기 위한 명령어
  Child c3 = p3 as Child; // 자->부->자 Ok : 명시적 다운캐스팅
  print(p3.instanceVar);
  p3.instanceMethod();
  // p3.childMethod(); // 부모가 자식만의 소유에 접근 불가
  c3.childMethod();

  // is 연산자:: 상속 관계일 때 타입을 확인하기 위한 명령어
  print(p3 is Parent);
  print(p3 is Child);
  print(c3 is Child);
  print(c1 is! Parent);
}

class Parent {
  String instanceVar = "Parent instance variable";
  static String staticVar = "static variable";

  void instanceMethod() {
    print("Parent instance method");
  }

  static void staticMethod() {
    print("static method");
  }
}

class Child extends Parent {
  String instanceVar = "Child instance variable";
  void instanceMethod() {
    print("Child instance method");
  }
  void childMethod() {
    print(instanceVar);
    // print(staticVar); // dart언어에서 static은 상속 불가
    print(Parent.staticVar);
    instanceMethod();
    // staticMethod(); // dart언어에서 static은 상속 불가
    Parent.staticMethod();
  }
}
