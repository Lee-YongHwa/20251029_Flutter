import 'package:ch06_widgets/basic_widgets/GestureDetectorWidgetExample.dart';
import 'package:flutter/material.dart';
import 'package:shake_detector/shake_detector.dart';

class ShakeDetectorWidgetExample extends StatefulWidget {
  const ShakeDetectorWidgetExample({super.key});

  @override
  State<ShakeDetectorWidgetExample> createState() =>
      _ShakeDetectorWidgetExampleState();
}

class _ShakeDetectorWidgetExampleState
    extends State<ShakeDetectorWidgetExample> {
  ShakeDetector? shakeDetector;

  @override
  void initState() {
    super.initState();

    shakeDetector = ShakeDetector.autoStart(
      shakeThresholdGravity: 2.7, // 감도 조절 (낮을수록 더 민감)
      onShake: () {
        print("폰 흔들림 감지!");
        _openNewScreen("폰 흔들림으로 이동");
      },
    );
  }

  @override
  void dispose() {
    shakeDetector?.stopListening();
    super.dispose();
  }

  void _openNewScreen(String tile) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NewScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center();
  }
}
