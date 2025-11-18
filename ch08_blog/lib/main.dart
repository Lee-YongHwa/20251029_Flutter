import 'package:ch08_blog/screen/home_screen_1.dart';
import 'package:ch08_blog/screen/home_screen_2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // home_screen_1 :: AppBar와 controller가 한곳에
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'WebView Demo',
  //     debugShowCheckedModeBanner: false,
  //     home: HomeScreen1(),
  //   );
  // }

  // home_screen_2 :: AppBar와 controller를 분리
  @override
  Widget build(BuildContext context) {
    // HomeScreen2의 상태를 제어할 수 있는 key 생성
    final GlobalKey<HomeScreen2State> homeKey = GlobalKey<HomeScreen2State>();

    return MaterialApp(
      title: 'WebView Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('WebView Controller'),
          backgroundColor: Colors.yellow,
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              tooltip: '뒤로 가기',
              onPressed: () => homeKey.currentState?.goBack(),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              tooltip: '앞으로 가기',
              onPressed: () => homeKey.currentState?.goForward(),
            ),
            IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: '새로 고침',
              onPressed: () => homeKey.currentState?.reload(),
            ),
          ],
        ),
        body: SafeArea(
          child: HomeScreen2(key: homeKey), // key 전달
        ),
      ),
    );
  }
}
