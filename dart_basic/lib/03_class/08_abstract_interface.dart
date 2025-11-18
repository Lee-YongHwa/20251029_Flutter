// Dart에서 모든 클래스는 암묵적으로 인터페이스 역할
// Dart에서 다중상속은 허용하지 않는다.
// 명시적으로 인터페이스로 사용하려면 implements를 사용해야 함.
// extends는 부모 클래스의 모든 기능을 사용,
// implements는 반드시 모든 기능을 재정의 해야함.
// implements로 구현한 클래스들끼리는 형변환 불가.
// 그렇지만 인터페이스 구현체가 같은 인터페이스 타입으로 형변환 가능.

// abstract 붙으면 미완성 메서드 사용 가능.
abstract class Flyable{void fly();}
abstract interface class Swimmable{void swim();}

// 추상메서드 사용 불가, interface일 경우 메서드 재정의 필수
interface class Groundable {void run(){print("Run!!");}}
class Diggable {void dig(){print("dig!!");}}

class Mammal {void eat() => print("냠냠");}
class Bat extends Mammal implements Flyable {
  @override
  void fly() {print("박쥐가 냠냠하면 날아요");}
}
class Eagle implements Flyable{
  @override
  void fly() {print("독수리 훨 훨~!");}
}
class Dog extends Mammal implements Groundable {
  @override
  void run() {print("멍멍~!");}
}
class Dolphin implements Swimmable, Flyable {
  @override
  void swim() {print("첨벙");}
  @override
  void fly() {print("훨");}
}
void main() {
  Flyable eagle = Eagle();
  Flyable dolphin = Dolphin();
  Flyable bat = Bat();
  List<Flyable> flys = [];
  flys.add(Eagle());
  flys.add(Dolphin());
  flys.add(Bat());
  print("==================");
  for(dynamic fly in flys){
    fly.fly();
  }
  List<Mammal> mammals = [];
  mammals.add(Dog());
  mammals.add(Bat());


  eagle.fly();
  dolphin.fly();
}