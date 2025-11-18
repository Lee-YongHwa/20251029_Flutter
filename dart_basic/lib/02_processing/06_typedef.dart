typedef Operation = void Function(int x, int y);

void add(int x, int y) {
  print('result: ${x+y}');
}

typedef Operation2 = int Function(int x, int y);
int add2(int x, int y) {
  return x+y;
}

void main() {
  // typedef : 함수선언부를 정의하는 키워드
  // 다트언어에서 함수는 일급 객체. 함수를 값처럼 사용가능

  Operation oper1 = add;
  oper1(1,1);

  void lambdaCallback(Operation2 oper2){
    int result = oper2(1,1);
    print("Result: $result");
  }
  lambdaCallback((a, b)=>a*b);
}