import 'dart:io';

void main() {
  while (true) {
    stdout.write("출력할 단을 입력하세요:");
    String? input = stdin.readLineSync();
    if (input == "Q" || input == "q") {
      print("종료합니다.");
      break;
    }
    int? dan;
    try {
      dan = int.parse(input ?? 0.toString());
    } catch (e) {
      print("숫자가 아닙니다. " + e.toString());
      continue;
    }
    for (int i = 1; i < 10; i++) {
      print("$dan * $i = ${d2(i * dan)}");
    }
  }
}

String d2(int i) {
  return i < 10 ? " " + i.toString() : i.toString();
}


