import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconButtonWidgetExample extends StatelessWidget {
  const IconButtonWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("즐거운 월요일입니다."),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.redAccent,
            ),
          );
        },
        icon: Icon(Icons.home),
      ),
    );
  }
}
