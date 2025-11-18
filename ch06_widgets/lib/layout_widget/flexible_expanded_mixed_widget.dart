import 'package:flutter/material.dart';

class FlexibleExpandedMixedWidgetExample extends StatelessWidget {
  const FlexibleExpandedMixedWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // Flexible과 Expanded 모두 할당된 공간 채우려고 하기 때문 시각적으로는 동일
          Flexible(flex: 2, child: Container(color: Colors.blue)),
          Flexible(flex: 1, child: Container(color: Colors.red)),
          // Expanded는 flex: 1이 생략된 것과 동일하게 동작
          Expanded(child: Container(color: Colors.green)), // 남는 공간을 모두 차지
          Container(
            height: 100,
            color: Colors.pink,
            child: Center(child: Text("Container")),
          ),
        ],
      ),
    );
  }
}

//위젯,           Flex 값,비율 (자신의 flex / 4),크기
//Flexible (파랑),2      ,2/4 (50%)           ,남은 공간의 50%
//Flexible (빨강),1      ,1/4 (25%)           ,남은 공간의 25%
//Expanded (초록),1      ,1/4 (25%)           ,남은 공간의 25%