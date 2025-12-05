import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthRepository {
  // HTTP 요청을 위해 Dio 인스턴스를 생성, 데이터 접근(create, read, delete) 레이어
  final _dio = Dio();

  // Android에서는 에뮬레이터가 localhost에 접근 불가. 10.0.0.2를 localhost로 대체:API 서버 URL
  // node에서 돌아가는 로컬 아이피를 적용하면 됨.
  final _targetUrl =
      'http://${Platform.isAndroid ? '10.100.203.36' : 'localhost'}:3000/auth';

  // 회원 등록
  Future<({String refreshToken, String accessToken})> register({
    required String email,
    required String password,
  }) async {
    final result = await _dio.post(
      '$_targetUrl/register/email',
      data: {'email': email, 'password': password},
    );
    return (
    refreshToken: result.data['refreshToken'] as String,
    accessToken: result.data['accessToken'] as String,
    );
  }

  // accessToken : 정보에 접근할 수 있도록 권한 부여된 토큰
  // refreshToken : 처음 로그인시 accessToken과 함께 발행,
  // accessToken 만료시 재발급 받을 수 있도록 사용하는 특수한 토큰
  // 로그인
  Future<({String refreshToken, String accessToken})> login({
    required String email,
    required String password,
  }) async {
    final emailAndPassword = '$email:$password';
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    final encoded = stringToBase64.encode(emailAndPassword);

    final result = await _dio.post(
      '$_targetUrl/login/email',
      options: Options(
        headers: {
          // HttpHeaders.authorizationHeader: 'Basic $encoded',
          'authorization': 'Basic $encoded',
        },
      ),
    );
    return (
    refreshToken: result.data['refreshToken'] as String,
    accessToken: result.data['accessToken'] as String,
    );
  }

  // refreshToken, accessToken을 재발급 받는 요청
  Future<String> rotateRefreshToken({required String refreshToken}) async {
    final result = await _dio.post(
      '$_targetUrl/token/refresh',
      options: Options(
        headers: {
          // HttpHeaders.authorizationHeader: 'Basic $encoded',
          'authorization': 'Bearer $refreshToken',
        },
      ),
    );
    return result.data['refreshToken'] as String;
  }

  Future<String> rotateAccessToken({required String refreshToken}) async {
    final result = await _dio.post(
      '$_targetUrl/token/access',
      options: Options(
        headers: {
          // HttpHeaders.authorizationHeader: 'Basic $encoded',
          'authorization': 'Bearer $refreshToken',
        },
      ),
    );
    return result.data['accessToken'] as String;
  }
}