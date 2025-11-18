// 생성자(Constructor)
// dart언어에서 클래스가 가지는 속성을 초기화하는 방법
// 1) var, late, dynamic을 붙이는 경우 인스턴스 생성 후 초기화 가능
// 2) 속성의 타입에 명시적 타입 선언 경우 인스턴스 생성 시 초기화 강제
class Company {
  String name;
  int money;

  // 2-1) 기본 생성자: 오버로딩이 안되어서 이름을 같이 할수 없음 => only one.
  // Company();
  // Company(this.name, this.money);
  Company(String name, int money): this.name=name, this.money=money;
  // Company(Map<String, dynamic> map):name=map['name'], money=map['money'];

  //2-2) named 생성자: named를 이용해서 다양하게 응용
  Company.namedConstructor(this.name, this.money){
    print("Generated Named Construcor $name, $money");
  }
  Company.withValue(String name, int money):this.name=name, this.money=money {
    print("With Value $name $money");
  }
  Company.named(this.name, this.money){
    print("named $name, $money");
  }
  Company.fromMap(Map<String, dynamic> map):name=map['name'], money=map['money'] {
    print("from Map $name, $money");
  }
}
void main() {
  Company c1 = Company('공유', 10000);
  // Company c2 = Company({'name':'Gumdoki','money':10000}); //속성이 Map으로 되었을 때
  Company c3 = Company.withValue('SSOK', 1000);
  Company c4 = Company.named('SSOK', 1000);
  Company c5 = Company.fromMap({'name':'SSOK','money':1000});
}

