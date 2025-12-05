import 'package:ch22_scheduler_social/const/colors.dart';
import 'package:flutter/material.dart';

// custom widget 생성
class LoginTextField extends StatelessWidget {
  final FormFieldSetter<String?> onSaved;
  final FormFieldValidator<String?> validator;
  final String? hintText;
  final bool obscureText;

  const LoginTextField({
    required this.onSaved,
    required this.validator,
    this.hintText,
    this.obscureText = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: validator,
      cursorColor: SECONDARY_COLOR,
      // true일때 텍스트필드 내용 보이지 않게하는 설정
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        // 활성화 상태
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: TEXT_FIELD_FILL_COLOR),
        ),
        // 포커스된 상태
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: SECONDARY_COLOR),
        ),
        // 에러상태
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: ERROR_COLOR),
        ),
        // 포커스된 상태에서 에러발생 상태
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: ERROR_COLOR),
        ),
      )
    );
  }
}