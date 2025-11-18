import '04_modifiers.dart';

// 오직 base, final 붙은 클래스 끼리만 상속 가능.
Parent parent = Parent();
// class Child0 extends Parent{}
base class Child1 extends Parent{}
final class Child2 extends Parent{}
// interface class Child3 implements Parent{}
// sealed class Child3 implements Parent{}

// final :: 외부에서 base, extends, implements 불가.
Parent2 parent2 = Parent2();
// class Child21 extends Parent2{}
// base class Child21 extends Parent2{}
// interface class Child22 extends Parent2{}
// sealed class Child23 extends Parent2{}
// class Child23 implements Parent2{}
// class Child23 extends Parent2{}

// interface :: 외부에서 상속 불가 재정의만 가능.
Parent3 parent3 = Parent3();
// base class Child31 extends Parent3{}
// interface class Child32 extends Parent3{}
// sealed class Child32 extends Parent3{}
class Child33 implements Parent3{}

// sealed :: 외부에서 상속, 재정의 그리고 인스턴스화 불가.
// 외부에서 상속 불가 재정의만 가능.
// Parent4 parent4 = Parent4();
// base class Child41 extends Parent4{}
// final class Child42 extends Parent4{}
// interface Child43 extends Parent4{}
// interface Child43 implements Parent4{}

void main() {
  print("modifier result");
}