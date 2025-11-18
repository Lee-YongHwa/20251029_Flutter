import 'package:ch06_widgets/basic_widgets/ElevatedButtonWidgetExample.dart';
import 'package:ch06_widgets/basic_widgets/FloatingActionButtonExample.dart';
import 'package:ch06_widgets/basic_widgets/GestureDetectorWidgetExample.dart';
import 'package:ch06_widgets/basic_widgets/IconButtonWidgetExample.dart';
import 'package:ch06_widgets/basic_widgets/OutlinedButtonWidgetExample.dart';
import 'package:ch06_widgets/basic_widgets/ShakeDetectorWidgetExample.dart';
import 'package:ch06_widgets/basic_widgets/TextButtonWidgetExample.dart';
import 'package:ch06_widgets/basic_widgets/text_widget.dart';
import 'package:ch06_widgets/design_widget/ContainerWidgetExample.dart';
import 'package:ch06_widgets/design_widget/PaddingWidgetExample.dart';
import 'package:ch06_widgets/design_widget/SafeAreaWidgetExample.dart';
import 'package:ch06_widgets/design_widget/SizedBoxWidgetExample.dart';
import 'package:ch06_widgets/layout_widget/absolute_layout_widget.dart';
import 'package:ch06_widgets/layout_widget/column_widget.dart';
import 'package:ch06_widgets/layout_widget/expanded_widget.dart';
import 'package:ch06_widgets/layout_widget/flexible_expanded_mixed_widget.dart';
import 'package:ch06_widgets/layout_widget/flexible_widget.dart';
import 'package:ch06_widgets/layout_widget/login_screen_absolute.dart';
import 'package:ch06_widgets/layout_widget/row_widget.dart';
import 'package:ch06_widgets/layout_widget/stack_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'CookieRun'),
      home: Scaffold(
        body: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('쿠키런 폰트 예제'),
              centerTitle: true,
              backgroundColor: Colors.cyan,
            ),
            floatingActionButton: FloatingActionButtonWidgetExample(),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            body: SizedBox(
              width: double.infinity,  // 부모위젯이 허용하는 최대 너비 지정
              // child: Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     /* 기본 위젯(텍스트, 버튼 5가지, 이벤트 디텍터)
              //     ShakeDetectorWidgetExample(),
              //     GestureDetectorWidgetExample(),
              //     //(X) FloatingActionButtonWidgetExample(),//Scaffold에서 지정해서 생략
              //     OutlinedButtonWidgetExample(), // 테두리가 있는 버튼
              //     ElevatedButtonWidgetExample(), // 배경색 있고 입체감있는 버튼
              //     IconButtonWidgetExample(), // 글꼴의 아이콘을 이용한 버튼
              //     TextButtonWidgetExample(), // 배경색과 그림자가 없고 글자만 있음
              //     TextWidgetExample(), // 텍스트만 있음 */
              //     //디자인 관련 위젯: 배경 추가, 간격 추가, 패딩 추가등
              //     // (X)SafeAreaWidgetExample(), //Scaffold에서 지정해서 생략
              //     PaddingWidgetExample(),
              //     SizedBoxWidgetExample(),
              //     ContainerWidgetExample()
              //   ],
              // ),

              // 배치 관련 위젯: 하위위젯을 가로 또는 세로로 배치, 위젯위에 위젯겹칠때
              // child: RowWidgetExample(),
              // child: ColumnWidgetExample(),
              // child: FlexibleWidgetExample(),
              // child: ExpandedWidgetExample(),
              // child: FlexibleExpandedMixedWidgetExample(),
              // child: StackWidgetExample(),
              // child: AbsoluteLayoutWidgetExample(),
              child: LoginScreen(),
            ),
          ),
        ),
      ),
    );
  }
}