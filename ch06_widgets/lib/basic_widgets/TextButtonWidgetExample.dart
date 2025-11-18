import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TextButtonWidgetExample extends StatelessWidget {
  const TextButtonWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          print("버튼 클릭");
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     content: Text("먹는 건줄 알았쥐?"),
          //     duration: Duration(seconds: 2),
          //   )
          // );
          Fluttertoast.showToast(msg: "이삭토스튼줄 아랐쥬?",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.pinkAccent,
            textColor: Colors.white,
            fontSize: 23
          );
        },
        child: Text("텍스트버튼"),
      ),
    );
  }
}
