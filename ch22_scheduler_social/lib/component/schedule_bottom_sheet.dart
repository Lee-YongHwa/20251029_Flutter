import 'package:flutter/material.dart';
import 'package:ch22_scheduler_social/component/custom_text_field.dart';
import 'package:ch22_scheduler_social/const/colors.dart';
import 'package:ch22_scheduler_social/model/schedule_model.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ScheduleBottomSheet extends StatefulWidget {
  final DateTime selectedDate;

  const ScheduleBottomSheet({required this.selectedDate, super.key});

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();

  int? startTime;
  int? endTime;
  String? content;

  // 운동 선택 상태
  bool isSoccer = false;
  bool isBasketball = false;
  bool isVolleyball = false;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Form(
      key: formKey,
      child: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height / 2 + bottomInset,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(
              left: 8,
              right: 8,
              top: 8,
              bottom: bottomInset,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        label: '시작 시간',
                        isTime: true,
                        onSaved: (String? val) => startTime = int.parse(val!),
                        validator: timeValidator,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: CustomTextField(
                        label: '종료 시간',
                        isTime: true,
                        onSaved: (String? val) => endTime = int.parse(val!),
                        validator: timeValidator,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // ---------------------------
                // 운동 종류 label
                // ---------------------------
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 8),
                  child: Text(
                    '운동 종류',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: PRIMARY_COLOR,
                    ),
                  ),
                ),

                // ---------------------------
                // ★ 운동 토글 버튼 3개 (가로 균등)
                // ---------------------------
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() => isSoccer = !isSoccer);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: isSoccer
                                ? PRIMARY_COLOR.withOpacity(0.2)
                                : Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: isSoccer ? PRIMARY_COLOR : Colors.grey,
                            ),
                          ),
                          child: Column(
                            children: [
                              Text("⚽", style: TextStyle(fontSize: 24)),
                              SizedBox(height: 4),
                              Text("축구"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),

                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() => isBasketball = !isBasketball);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: isBasketball
                                ? PRIMARY_COLOR.withOpacity(0.2)
                                : Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color:
                              isBasketball ? PRIMARY_COLOR : Colors.grey,
                            ),
                          ),
                          child: Column(
                            children: [
                              Text("🏀", style: TextStyle(fontSize: 24)),
                              SizedBox(height: 4),
                              Text("농구"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),

                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() => isVolleyball = !isVolleyball);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: isVolleyball
                                ? PRIMARY_COLOR.withOpacity(0.2)
                                : Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color:
                              isVolleyball ? PRIMARY_COLOR : Colors.grey,
                            ),
                          ),
                          child: Column(
                            children: [
                              Text("🏐", style: TextStyle(fontSize: 24)),
                              SizedBox(height: 4),
                              Text("배구"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // 내용 입력
                Expanded(
                  child: CustomTextField(
                    label: '내용',
                    isTime: false,
                    onSaved: (String? val) => content = val,
                    validator: contentValidator,
                  ),
                ),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => onSavePressed(context),
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

  void onSavePressed(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      final schedule = ScheduleModel(
        id: Uuid().v4(),
        content: content!,
        date: widget.selectedDate,
        startTime: startTime!,
        endTime: endTime!,
        // 필요하면 운동 정보를 저장할 필드도 추가 가능!
      );

      await FirebaseFirestore.instance
          .collection('schedule')
          .doc(schedule.id)
          .set(schedule.toJson());

      Navigator.of(context).pop();
    }
  }

  String? timeValidator(String? val) {
    if (val == null) return '값을 입력해주세요';

    int? number;

    try {
      number = int.parse(val);
    } catch (e) {
      return '숫자를 입력해주세요';
    }

    if (number < 0 || number > 24) {
      return '0시부터 24시 사이를 입력해주세요';
    }

    return null;
  }

  String? contentValidator(String? val) {
    if (val == null || val.isEmpty) return '값을 입력해주세요';
    return null;
  }
}
