import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreenStateful extends StatefulWidget {
  const HomeScreenStateful({Key? key}) : super(key: key);

  @override
  State<HomeScreenStateful> createState() => _HomeScreenStateful();
}

class _HomeScreenStateful extends State<HomeScreenStateful> {
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (timer) {
      print('실행!');
      int? nextPage = pageController.page?.toInt();
      if (nextPage == null) return;
      // if (nextPage == 4) nextPage = 0; else nextPage++;
      nextPage = (nextPage == 4) ? 0 : nextPage + 1;
      pageController.animateToPage(
        nextPage,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // 배경 투명
        statusBarIconBrightness: Brightness.dark, // 글자 색 dark, light
      ),
    );
    return Scaffold(
      body: PageView(
        controller: pageController,
        children:
        [1, 2, 3, 4, 5]
            .map(
              (num) => Image.asset(
            'assets/img/image_$num.jpeg',
            fit: BoxFit.cover,
          ),
        )
            .toList(),
      ),
    );
  }
}