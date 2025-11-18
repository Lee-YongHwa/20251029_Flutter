import 'package:flutter/material.dart';

// StatelessWidget:: 상태가 없기 때문에 리렌더링 안됨.
class SplashScreenStateless extends StatelessWidget {
  const SplashScreenStateless({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Center(child: Text("Splash Screen"))),
    );
  }
}