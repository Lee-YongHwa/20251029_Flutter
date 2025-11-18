import 'package:flutter/material.dart';

class PaddingWidgetExample extends StatelessWidget {
  const PaddingWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(16.0),
        //EdgeInsets는 Flutter에서 여백이나 패딩 값을 지정하는 클래스
        color: Colors.yellow,
        child: Padding(
          //Padding:: child 위젯의 여백을 제공할 때
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Container(
            color: Colors.red,
            width: 50.0,
            height: 50.0,
            margin: EdgeInsets.fromLTRB(16, 16, 16, 16), //위,아래,좌,우 순서
          ),
        ),
      ),
    );
  }
}
