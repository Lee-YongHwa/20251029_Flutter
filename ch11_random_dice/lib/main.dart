import 'package:ch11_random_dice/const/colors.dart';
import 'package:ch11_random_dice/screen/root_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        sliderTheme: SliderThemeData(
          // Slider 위젯 관련
          thumbColor: primaryColor, // 동그라미 색
          activeTrackColor: primaryColor, // 이동한 트랙 색
          // 아직 이동하지 않은 트랙 색
          inactiveTrackColor: primaryColor.withAlpha(80),
        ),
        // BottomNavigationBar 위젯 관련
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor, // 선택 상태 색
          unselectedItemColor: secondaryColor, // 비선택 상태 색
          backgroundColor: backgroundColor, // 배경 색
        ),
      ),
      home: RootScreen(),
    );
  }
}