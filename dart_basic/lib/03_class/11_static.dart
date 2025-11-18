void main() {
  Counter c1 = Counter();print(c1.hashCode);
  Counter c2 = Counter();print(c2.hashCode);
  Counter c3 = Counter();print(c3.hashCode);
  Singleton s1 = Singleton();
  Singleton s2 = Singleton();
  s1.showInfo();
  s2.showInfo();

}

class Counter {
  static int i =0;
  Counter(){
    // i++;
    print(++i);
  }
}
class Singleton {
  static Singleton? _instance;
  Singleton._internal();
  factory Singleton() { // factory:: 외부에서 호출할 수 있는 생성자
    //??= 널이면 Singleton._internal()을 호출, 아니면 _instance 리턴
    _instance ??= Singleton._internal();
    return _instance!; // ! null아님을 확신할 때
  }
  void showInfo(){
    print("Singlton: $hashCode");
  }
}