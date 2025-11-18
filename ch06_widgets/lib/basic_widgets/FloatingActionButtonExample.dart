import 'package:ch06_widgets/basic_widgets/GestureDetectorWidgetExample.dart';
import 'package:flutter/material.dart';

class FloatingActionButtonWidgetExample extends StatelessWidget {
  const FloatingActionButtonWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: '새화면으로 이동',
      backgroundColor: Colors.blue,
      child: const Icon(Icons.navigation, color: Colors.white),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NewScreen()),
        );
      },
    );
  }
}
