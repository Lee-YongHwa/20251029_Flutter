import 'package:ch06_widgets/basic_widgets/GestureDetectorWidgetExample.dart';
import 'package:flutter/material.dart';

class OutlinedButtonWidgetExample extends StatelessWidget {
  const OutlinedButtonWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NewScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Color(0xff000000),
          backgroundColor: Color.fromRGBO(255, 255, 0, 255),
          side: BorderSide(
            color: Colors.red,
            width: 3.0,
            style: BorderStyle.solid,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), //라운드 처리
          ),
        ),
        child: Text("Elevated Button"),
      ),
    );
  }
}
