import 'package:flutter/material.dart';

class ContainerWidgetExample extends StatelessWidget {
  const ContainerWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // 공간지정, style 적용가능, 유일 마진 적용가능
        decoration: BoxDecoration(
          color: Colors.yellow,
          border: Border.all(width: 16.0, color: Colors.black),
        ),
        // EdgeInsets:: all, symmetric, only, fromLTRB
        margin: EdgeInsets.all(16.0),
        // 상하좌우 모두 지정
        padding: EdgeInsets.only(top: 1, bottom: 2, left: 3, right: 4),
        //각각지정
        width: 200.0,
        height: 200.0,
        child: Text("Container"),
      ),
    );
  }
}