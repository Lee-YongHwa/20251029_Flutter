import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GestureDetectorWidgetExample extends StatelessWidget {
  const GestureDetectorWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // GestureDetector :: 화면상의 터치 기반 제스처
      child: GestureDetector(
        onTap: () {
          print("tap tap");
        },
        onDoubleTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NewScreen()),
          );
        },
        // 두 손가락을 벌리거나 모을 때
        onScaleUpdate: (details) {
          if(details.scale>1.1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NewScreen()),
            );
          }
        },
        onLongPress: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("즐거운 월요일입니다."),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.redAccent,
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(color: Colors.red),
          width: 100.0,
          height: 100.0,
        ),
      ),
    );
  }
}

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('새 화면')),
      body: const Center(child: Text("새화면", style: TextStyle(fontSize: 30))),
    );
  }
}
