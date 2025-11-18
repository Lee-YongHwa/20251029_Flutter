void main() {

  Dog dog = Dog("댕댕이");
  print(dog);
  dog.sound();
  dog.bark();
}

// 상속 가능 요소 : 인스턴스 변수( _로 시작하는 변수 제외) 및 메서드, Getter/Setter
// 상속 불가 요소 : 생성자, static 변수 및 메서드, _로 시작하는 변수,

class Animal {
  late String _name;
  Animal.withVal(this._name);
  void sound() {
    print('$_name sound~!');
  }
  @override
  String toString() {return _name;}
}

// 클래스를 extends 할 경우 부모클래스를 물려받거나, 오버라이드 가능, 단일상속
class Dog extends Animal {
  Dog(super.name) : super.withVal();
  void bark() {
    print("$_name bow bow!");
  }
}

// 클래스를 implements 할 경우 부모클래스를 상속받지 않고, 모든 멤버 재정의.복수상속
class Cat implements Animal {
  @override
  late String _name;

  @override
  void sound() {
    // TODO: implement sound
  }

}