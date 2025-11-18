import 'package:flutter/material.dart';

class ExpandedWidgetExample extends StatelessWidget {
  const ExpandedWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // Expanded: Flexible(fit: FlexFit.tight)의 축약형
          // 무조건 할당된 공간(남은 공간의 비율)을 모두 채우도록 강제.(가장 많이 사용)
          Expanded(flex: 1, child: Container(color: Colors.blue)),
          // Expanded flex 기본 값이 1
          Expanded(child: Container(color: Colors.red)),
          Expanded(child: Container(color: Colors.green)),
        ],
      ),
    );
  }
}
