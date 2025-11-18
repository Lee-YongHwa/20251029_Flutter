import 'package:ch06_widgets/basic_widgets/GestureDetectorWidgetExample.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ElevatedButtonWidgetExample extends StatelessWidget {
  const ElevatedButtonWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NewScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10) //라운드 처리
          )
        ),
        child: Text("Elevated Button"),
      ),
    );
  }
}

// RoundedRectangleBorder 클래스에 새로운기능을 추가한다면
extension on RoundedRectangleBorder{
  toButtonStyle(){ } // 새로운 메서드 함수 지정
}