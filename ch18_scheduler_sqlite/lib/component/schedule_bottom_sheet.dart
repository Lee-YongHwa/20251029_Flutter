import 'package:ch18_scheduler_sqlite/component/custom_text_field.dart';
import 'package:ch18_scheduler_sqlite/const/colors.dart';
import 'package:ch18_scheduler_sqlite/database/drift_database.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ScheduleBottomSheet extends StatefulWidget {
  final DateTime selectedDate;

  const ScheduleBottomSheet({required this.selectedDate, super.key});

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  int? startTime;
  int? endTime;
  String? content;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Form(
      key: _formKey,
      child: SafeArea(
        child: Container(
          height:
              MediaQuery.of(context).size.height / 2 +
              bottomInset, // 화면 반 높이에 키보드 높이 추가하기
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(
              left: 8,
              right: 8,
              top: 8,
              bottom: bottomInset,
            ),
            child: Column(
              // 시간 관련 텍스트 필드와 내용관련 텍스트 필드 세로로 배치
              children: [
                Row(
                  // 시작 시간 종료 시간 가로로 배치
                  children: [
                    Expanded(
                      child: CustomTextField(
                        // 시작시간 입력 필드
                        label: '시작 시간',
                        isTime: true,
                        onSaved: (String? value) {
                          startTime = int.parse(value!);
                        },
                        validator: timeValidator,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: CustomTextField(
                        // 종료시간 입력 필드
                        label: '종료 시간',
                        isTime: true,
                        onSaved: (String? value) {
                          endTime = int.parse(value!);
                        },
                        validator: timeValidator,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Expanded(
                  child: CustomTextField(
                    // 내용 입력 필드
                    label: '내용',
                    isTime: false,
                    onSaved: (String? value) {
                      content = value;
                    },
                    validator: contentValidator,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    // [저장] 버튼
                    onPressed: onSavePressed,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: PRIMARY_COLOR,
                    ),
                    child: Text('저장'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onSavePressed() async {
    if (_formKey.currentState!.validate()) {
      // 폼 검증하기
      _formKey.currentState!.save(); // 폼 저장하기

      await GetIt.I<LocalDatabase>().createSchedule(
        // 일정 생성하기
        SchedulesCompanion(
          startTime: Value(startTime!),
          endTime: Value(endTime!),
          content: Value(content!),
          date: Value(widget.selectedDate),
        ),
      );

      Navigator.of(context).pop();
    }
  }

  String? timeValidator(String? val) {
    if (val == null) {
      return '값을 입력해주세요';
    }

    int? number;

    try {
      number = int.parse(val);
    } catch (e) {
      return '숫자를 입력해주세요';
    }

    if (number < 0 || number > 24) {
      return '0시부터 24시 사이를 입력해주세요';
    }

    // validator 함수는 유효성 검사를 성공적으로 통과했을 때, **null**을 반환
    return null;
  } // 시간값 검증

  String? contentValidator(String? val) {
    if (val == null || val.isEmpty) {
      return '값을 입력해주세요';
    }

    // validator 함수는 유효성 검사를 성공적으로 통과했을 때, **null**을 반환
    return null;
  } // 내용값 검증
}
