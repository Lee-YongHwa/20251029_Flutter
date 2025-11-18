import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

var logger = Logger(printer: PrettyPrinter());

var loggerNoStack = Logger(printer: PrettyPrinter(methodCount: 0));

class LoginScreen2 extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 100),
              Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 80),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // 이메일 필드
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none, // 테두리 제거
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '이메일을 입력해주세요';
                        }
                        if (!value.contains('@')) {
                          return '올바른 이메일 형식이 아닙니다';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),

                    // 비밀번호 필드
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none, // 테두리 제거
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '비밀번호를 입력해주세요';
                        }
                        if (value.length < 6) {
                          return '6자 이상 입력해주세요';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              // 폼과 버튼 사이 간격 (Positioned top: 370 - top of Form (approx 290) = 80 간격이 필요)
              SizedBox(height: 30),
              // Form 필드 내부 간격을 고려하여 조정

              // 로그인 버튼
              ElevatedButton(
                onPressed: () {
                  // 키보드를 숨기는 코드 추가
                  FocusScope.of(context).unfocus();

                  if (_formKey.currentState!.validate()) {
                    // 유효성 검사 통과
                    // print, logger 사용은 그대로 유지
                    print('Email: ${_emailController.text}');
                    logger.d(_emailController.text);
                    print('Password: ${_passwordController.text}');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              // 화면 하단과의 여백 추가
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}