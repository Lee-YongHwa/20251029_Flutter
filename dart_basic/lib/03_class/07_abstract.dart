void main() {
  Terran t1 = Terran();
  t1.move();t1.move();t1.stop();t1.attack();
}

abstract class Unit{
  final String name;
  final String tribe;
  void move(){print("Move! Move!");}
  void stop(){print("Stop! Stop!");}
  void attack();
  Unit(this.name, this.tribe);
  @override
  String toString() {return 'Unit{name: $name, tribe: $tribe}';}
}
class Terran extends Unit {
  Terran():super("Marine", "Terran"){
    print("$tribe 종족 $name이 나타났습니다.");
  }
  @override
  void attack() {print("빵야 빵야");}
}
