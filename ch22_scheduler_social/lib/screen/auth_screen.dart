import 'package:ch22_scheduler_social/const/colors.dart';
import 'package:ch22_scheduler_social/screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: FractionallySizedBox(
                widthFactor: 0.7,
                child: Image.asset('assets/img/logo.png'),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => onGoogleLoginPress(context),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: SECONDARY_COLOR,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              child: Text('구글로 로그인'),
            ),
          ],
        ),
      ),
    );
  }

  onGoogleLoginPress(BuildContext context) async {
    // 1. 인스턴스 가져오기 (생성자 아님)
    final GoogleSignIn googleSignIn = GoogleSignIn.instance;
    await googleSignIn.initialize(
      serverClientId: '574707704618-1l4fgtjpj3v55vnmj2euhvs0b9vjm0fo.apps.googleusercontent.com',
    );
    try {
      GoogleSignInAccount? account = await googleSignIn.authenticate();

      final googleAuth = await account?.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken,   // ✔ 최신 방식: idToken만 사용
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    } catch (error) {
      print('>>> $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('로그인 실패: $error')),

      );
    }
  }


// onGoogleLoginPress(BuildContext context) async {
  //   // GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  //
  //   GoogleSignIn googleSignIn = GoogleSignIn.instance;
  //
  //
  //   try {
  //     // GoogleSignInAccount? account = await googleSignIn.signIn();
  //     GoogleSignInAccount? account = await googleSignIn.authenticate();
  //
  //     final GoogleSignInAuthentication? googleAuth =
  //     await account?.authentication;
  //
  //     final credential = GoogleAuthProvider.credential(
  //       // accessToken: googleAuth?.accessToken, //최신 버전에서는 이건 안씀
  //       idToken: googleAuth?.idToken,
  //     );
  //
  //     final result = await FirebaseAuth.instance.signInWithCredential(
  //       credential,
  //     );
  //
  //     Navigator.of(
  //       context,
  //     ).push(MaterialPageRoute(builder: (_) => HomeScreen()));
  //   } catch (error) {
  //     ScaffoldMessenger.of(
  //       context,
  //     ).showSnackBar(SnackBar(content: Text('로그인 실패')));
  //   }
  // }
}