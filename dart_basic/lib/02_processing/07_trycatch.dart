import 'dart:io';
import 'dart:math';

void main() {
  print("내마음의 숫자를 맞춰 보세요(1~100)");
  int ranNum = Random().nextInt(100)+1;
  print(ranNum);
  while (true) {
    stdout.write("숫자를 입력 하세요(1~100):");
    String? input = stdin.readLineSync();
    if (input == "Q" || input == "q") {
      print("종료합니다.");
      break;
    }
    int? answer;
    try {
      answer = int.parse(input ?? 0.toString());
      if(answer> ranNum) {
        print("큽니다.");
        continue;
      } else if(answer < ranNum){
        print("작습니다.");
        continue;
      } else {
        print("맞췄습니다.");
        break;
      }

    } catch (e) {
      print("숫자가 아닙니다. " + e.toString());
      continue;
    }
  }
}
