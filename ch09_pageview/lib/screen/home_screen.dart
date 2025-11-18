import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome:: Flutter 시스템 UI의 그래픽 설정을 변경하는 기능을 제공.
    // setSystemUIOverlayStyle:: 상태 표시줄과 내비게이션 바의 스타일을 바꾸는 코드

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // 상태바 배경 투명
        statusBarIconBrightness: Brightness.light, // 상태바 글자,아이콘 색 (밝게)
        systemNavigationBarColor: Colors.transparent, // 네비게이션 바 배경 투명
        systemNavigationBarIconBrightness:Brightness.light, // 아이콘 밝기 (밝게)
      ),
    );

    //           ,시스템 UI 표시,콘텐츠 확장 (바 뒤로),재등장 방법        ,주요 용도
    // edgeToEdge,표시됨 (투명) ,O (가장자리까지 확장),N/A (항상 표시)    ,배경 이미지, 자연스러운 UI
    // immersive ,숨겨짐       ,O (완전 풀스크린)    ,화면가장자리스와이프 ,게임, 비디오, 깊은 몰입
    // leanBack  ,숨겨짐       ,O (완전 풀스크린)    ,화면 아무 곳이나 터치,가벼운 미디어 뷰어
    // manual    ,개발자수동설정,개발자가 수동 설정    ,N/A (수동 제어)     ,특정 바만 보존/숨김

    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,);
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack,);
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual);

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky, // immersiveSticky: 완전 몰입 모드
      overlays: [], // overlays=[] → 모든 시스템 UI 숨김
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox.expand(
        child: PageView(
          children: [1, 2, 3, 4, 5]
              .map(
                (num) => Image.asset(
                  'assets/img/image_$num.jpeg',
                  fit: BoxFit.cover,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
