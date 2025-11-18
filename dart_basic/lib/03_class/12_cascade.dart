void main() {
  Idol idol = Idol("IVE", 5);
  idol.sayIdol();idol.sayMemberCount();

  Idol blackPink = Idol("블랙핑크", 3)
  ..sayIdol()
  ..sayMemberCount();
}

class Idol {
  final String name;
  final int membersCount;
  Idol(this.name, this.membersCount);

  void sayIdol(){print("$name 입니다.");}
  void sayMemberCount(){print("$membersCount 명 입니다.");}
}