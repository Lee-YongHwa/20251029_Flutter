import 'package:flutter/material.dart';

class FlexibleWidgetExample extends StatelessWidget {
  int rateFlex1 = 3, rateFlex2 = 1;

  FlexibleWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Flexible이나 Expanded와 같은 위젯은 Column이나 Row의 자식으로 사용될 때
        // Flex 위젯만 의미가 있으며, Flex 위젯이 차지하고 남은 공간을 분배하는 역할
        // Flexible:: fit 속성을 FlexFit.loose (기본값)로 가지며,
        // 자식 위젯의 크기를 존중하되, flex 비율만큼의 최대 공간을 할당받음
        // 하지만 자식이 작으면 할당된 공간을 모두 채우지 않을 수도 있다.
        Flexible(
          flex: rateFlex1,
          child: Container(
            color: Colors.blue,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: Text(
                  '$rateFlex1',
                  style: TextStyle(
                    fontSize: 70.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Flexible(
          flex: rateFlex2,
          child: Container(
            color: Colors.red,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: Text(
                  '$rateFlex2',
                  style: TextStyle(
                    fontSize: 70.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
