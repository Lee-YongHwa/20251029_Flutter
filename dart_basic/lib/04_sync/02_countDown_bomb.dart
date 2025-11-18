import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

void countdown(int n) {
  for (int i = n; i > 0; i--) {
    print(i);
    Future.delayed(Duration(seconds: 1));
  }
}

void countdown1(int n) async {
  for (int i = n; i > 0; i--) {
    print(i);
    await Future.delayed(Duration(seconds: 1));
  }
}

Future<void> countdown2(int n) async {
  for (int i = n; i > 0; i--) {
    print(i);
    await Future.delayed(Duration(seconds: 1));
  }
}

void main() async {
  // countdown(5);
  // countdown(5);
  // countdown1(5);
  // countdown1(5);

  // await countdown2(5);
  // await countdown2(5);
  Bomb b = Bomb();
  b.start();
  print('빨간선(0)과 파란선(1) 중에 선택하세요(숫자입력)');
  StreamSubscription? inputSub;
  final input = stdin.transform(utf8.decoder).transform(LineSplitter());
  inputSub = input.listen((val) {
    // bomb에다가 선택된 값을 넘겨줘서 폭탄을 멈추게 하는 코드
    b.choice(val);
    inputSub?.cancel();
  });
}

class Bomb {
  int lifeLine = Random().nextInt(2);
  bool state = false;

  Future<void> start() async {
    for (int i = 10; i > 0; i--) {
      if (state) return;
      print(i);
      await Future.delayed(Duration(milliseconds: 500));
    }
    if (!state) {
      print("꼬ㅏㅇ~!");
      exit(-1);
    }
  }

  void choice(String input) {
    state = true;
    if (int.parse(input) == lifeLine) {
      print("살았다.");
    } else {
      print("꽝!");
    }
  }
}
