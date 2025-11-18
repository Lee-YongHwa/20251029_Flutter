import 'package:flutter/material.dart';

class RowWidgetExample extends StatelessWidget {
  const RowWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Row(
        // start: 시작에 정렬, center: 중앙에 정렬, end: 끝에 정렬
        // spaceBetween: 자식 위제의 간격을 균등하게 정렬
        // spaceAround, spaceEvenly
        mainAxisAlignment: MainAxisAlignment.center, // 수평
        // start, center, end, stretch
        crossAxisAlignment: CrossAxisAlignment.start, // 수직
        children: [
          Container(height: 50.0, width: 50.0, color: Colors.red),
          // const SizedBox(width: 12.0),
          Container(height: 50.0, width: 50.0, color: Colors.green),
          // const SizedBox(width: 12.0),
          Container(height: 50.0, width: 50.0, color: Colors.blue),
        ],
      ),
    );
  }
}