import 'package:flutter/material.dart';

class SizedBoxWidgetExample extends StatelessWidget {
  const SizedBoxWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // 일정 크기 공간을 공백으로 지정할 때, style 적용 불가, 공간적용시 퍼포먼스 훌륭
      child: SizedBox(
        width: 200.0, height: 200.0,
        child: Container(
          color: Colors.blue,
        ),
      ),
    );
  }
}