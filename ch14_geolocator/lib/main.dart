import 'package:ch14_geolocator/screen/home_screen.dart';
import 'package:ch14_geolocator/screen/map_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()));
}

// 지도 문제는 AndroidManifest.xml을 수정해야 함.
// 그런데 문제가 발생하면 아래를 이용하여 완전히 정리해줘야 함.
// flutter clean
// flutter pub get
// flutter run