// 함수 선언하여 가위바위보 게임을 진행하시오
import 'dart:io';
import 'dart:math';

// 재사용을 위하여 명령을 묶어 놓은 것이 함수.
// 1) 리턴 X 매개변수 X
void done() {print("done");}

// 2) 리턴 X 매개변수 O
void done2(String str) {print("${str} done");}

// 3) 리턴 O 매개변수 X
String done3() {return "done";}

// 4) 리턴 O 매개변수 O
String done4(String str) {return ("${str} done");}

// 1) 매개변수의 형태에 따라서 포지셔널 파라미터를 이용한 함수
int position1(int a, int b) {return a + b;}
int position2(int a, [int b=2]) {return a + b;}
// 2) 매개변수의 형태에 따라서 네임드 파라미터를 이용한 함수
int required1({required int a, required int b}) {return a + b;}
int required2({required int a, int b=3}) {return a + b;}
// 3) 포지셔널 + 네임드 파라미터 혼용(포지셔널이 네임드보다 반드시 앞에 있어야 함)
int argCombine(int a, {required int b, int c = 4}){return a + b + c;}

// 4) 매개변수로 익명함수 사용(함수명 또는 함수 선언부)
void exeFnc(Function callback) {callback();}
void exeFnc1(void Function() callback) {callback();}
void exeFnc2(void Function(int, int) callback) {callback(1, 2);}
int  exeFnc3(int Function() callback) {return callback();}
void exeFnc4(int Function(int, int) callback) { final num = callback(1,2);}

void main() {
  stdout.write("가위(0), 바위(1), 보(2) 중 하나를 숫자로 입력하세요: ");
  String? input = stdin.readLineSync();
  print(rcp(input ?? ''));

  print(position1(1,2));print(position2(1));
  print(required1(a:2, b:3)); print(required1(b: 3, a:2));
  print(required2(a:1,b:1));print(required2(b:1, a:1));print(required2(a:1));
  print(argCombine(1, b: 2, c:3));print(argCombine(1, b: 2));
}

String rcp(String input) {
  int you = Random().nextInt(3);
  int? me;
  try {
    me = int.parse(input ?? 0.toString());
  } catch (e) {
    return "숫자가 아닙니다.";
  }
  String result;
  var answer = switch (me - you) {
    -2 || 1 => '승',
    0 => '비겼다',
    _ => '졌다',
  };
  return '나:${pea(me)} 너:${pea(you)} => ${answer.toString()}';
}

String pea(int num) {
  return num == 0
      ? "가위"
      : num == 1
      ? "바위"
      : "보";
}
