import 'package:ch09_pageview/screen/home_screen.dart';
import 'package:ch09_pageview/screen/home_screen_stateful.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WebView Demo',
      debugShowCheckedModeBanner: false,
      // home: HomeScreen(),
      home: HomeScreenStateful(),
    );
  }
}
