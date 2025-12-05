import 'package:ch21_scheduler_token/component/login_text_field.dart';
import 'package:ch21_scheduler_token/const/colors.dart';
import 'package:ch21_scheduler_token/screen/home_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/schedule_provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ScheduleProvider>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, //수직
            crossAxisAlignment: CrossAxisAlignment.stretch, //수평
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/img/logo.png',
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
              ),
              const SizedBox(height: 16.0),
              LoginTextField(
                onSaved: (val) {
                  email = val!;
                },
                validator: (val) {
                  if (val!.isEmpty ?? true) {
                    return '이메일을 입력해주세요.';
                  }
                  RegExp regExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!regExp.hasMatch(val!)) {
                    return "이메일 형식이 올바르지 않습니다.";
                  }
                  return null;
                },
                hintText: "이메일",
              ),
              const SizedBox(height: 8.0),
              LoginTextField(
                onSaved: (val) {
                  password = val!;
                },
                obscureText: true,
                validator: (val) {
                  if (val!.isEmpty ?? true) {
                    return '비밀번호 입력해주세요.';
                  }
                  if (val!.length < 4 || val.length > 8) {
                    return "비밀번호는 4~8자를 입력해주세요";
                  }
                  return null;
                },
                hintText: "이메일",
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: SECONDARY_COLOR,
                ),
                onPressed: () async {
                  onRegisterPress(provider);
                },
                child: Text('회원가입'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: SECONDARY_COLOR,
                ),
                onPressed: () async {
                  onLoginPress(provider);
                },
                child: Text('로그인'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onRegisterPress(ScheduleProvider provider) async {
    if (!saveAndValidateForm()) return; // 이메일과비번에 문제발생시 return

    String? message;
    try {
      await provider.register(email: email, password: password);
    } on DioException catch (e) {
      message = e.response?.data['message'] ?? 'http 관련 에러 발생';
    } catch (e) {
      message = '알수 없는 에러 발생';
    } finally {
      if (message != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(message)));
      } else {
        // Navigator.of(context).pushNamed('/home');
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => HomeScreen()));
      }
    }
  }
  onLoginPress(ScheduleProvider provider) async {
    if(!saveAndValidateForm()) return;
    String? message;
    try {
      await provider.login(email: email, password: password);
    } on DioException catch (e) {
      message = '네트워크 관련 오류 발생';
    } catch (e) {
      message = '알수 없는 에러 발생';
    } finally {
      if (message != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
      } else {
        // Navigator.of(context).pushNamed('/home');
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => HomeScreen(),
          ),
        );
      }
    }
  }

  bool saveAndValidateForm() {
    if (!formKey.currentState!.validate()) {
      return false;
    }
    formKey.currentState!.save;
    return true;
  }
}