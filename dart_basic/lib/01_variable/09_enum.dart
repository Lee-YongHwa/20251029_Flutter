// 상수를 묶음 단위로 사용하기 위해 클래스 선언
class Colors {
  static const String red = "red";
  static const String green = "green";
  static const String blue = "blue";
}
class Animal{
  String name; int legs;
  Animal(this.name, this.legs);
}

// enum : 상수를 집합으로 사용하기 위한 객체, enum의 원소는 각각, name과 index를 가짐
enum Status {approved, pending, rejected}
enum Weekdays {Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday}
void main() {
  // class를 이용
  print(Colors.red);
  Animal dog = Animal("댕댕이", 4);
  print(dog.name);

  // enum을 이용
  print("${Status.approved}");
  print(Status.approved.name);print(Status.approved.index);
  print("byName: ${Status.values.byName("approved")}");
  for(var item in Status.values) print("${item.index} / ${item.name}");

  for(int i=0;i<Status.values.length;i++) {
    print("${Status.values[i].name} ${Status.values[i].index} : ${Status.values[i]}");
  }

  for (int i=0;i<Weekdays.values.length;i++) {
    print("${Weekdays.values[i].index} : ${Weekdays.values[i]}");
  }
  print(Size.Small.message);
  for(var s in Size.values) {
    print('${s.index} / ${s.name} / ${s.grade}');
    print(s.message);
  }
}
enum Size {
  Small(30, "작음"), Medium(50, "중간"), Large(70, "큼");
  final int grade;
  final String msg;
  const Size(this.grade, this.msg);
  String get message {
    switch(this) {
      case Size.Small:
        return "${msg}(${grade}) 사이즈를 선택하셨습니다.";
      case Size.Medium:
        return "${msg}(${grade}) 사이즈를 선택하셨습니다.";
      case Size.Large:
        return "${msg}(${grade}) 사이즈를 선택하셨습니다.";
    }
  }

}

enum RollNames {
  User("ROLE_USER"), Manager("ROLE_MANAGER"), Admin("ROLE_ADMIN");
  final String role;
  const RollNames(this.role);
}

class Members {
  String name;
  RollNames role;
  Members(this.name, this.role);
}