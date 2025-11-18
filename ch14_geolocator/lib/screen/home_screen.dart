import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  static final LatLng companyLatLng = LatLng(
    // 지도 초기화 위치
    35.1567008, // 위도
    129.0594142, // 경도
  );
  static final Marker marker = Marker(
    markerId: MarkerId('company'),
    position: companyLatLng,
  );
  static final Circle circle = Circle(
    circleId: CircleId('choolCheckCircle'),
    center: companyLatLng,
    // 원의 중심이 되는 위치. LatLng값을 제공합니다.
    fillColor: Colors.blue.withAlpha(125),
    // 원의 색상
    radius: 100,
    // 원의 반지름 (미터 단위)
    strokeColor: Colors.blue,
    // 원의 테두리 색
    strokeWidth: 1, // 원의 테두리 두께
  );

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: FutureBuilder<String>(
        future: checkPermission(),
        builder: (context, snapshot) {
          // 로딩 상태
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          // 에러 상태
          if (snapshot.hasError) {
            return Center(child: Text("에러 발생: ${snapshot.error}"));
          }
          // 데이터 확인
          final status = snapshot.data ?? '';

          // 권한 허가된 상태
          if (snapshot.data == '위치 권한이 허가 되었습니다.') {
            return _buildMap(context);// 지도를 그리는 함수를 따로 만듦
          }

          // 권한 없는 상태
          return Center(child: Text(snapshot.data.toString()));
        },
      ),
    );
  }

  Widget _buildMap(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: HomeScreen.companyLatLng,
              zoom: 16,
            ),
            myLocationEnabled: true,
            markers: {HomeScreen.marker},
            circles: {HomeScreen.circle},
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.timelapse_outlined,
                color: Colors.blue,
                size: 50,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final curPosition =
                  await Geolocator.getCurrentPosition();

                  final distance = Geolocator.distanceBetween(
                    curPosition.latitude,
                    curPosition.longitude,
                    HomeScreen.companyLatLng.latitude,
                    HomeScreen.companyLatLng.longitude,
                  );

                  bool canCheck = distance < 100;

                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: Text('출근하기'),
                        content: Text(
                          canCheck
                              ? '출근을 하시겠습니까?'
                              : '출근할 수 없는 위치입니다.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () =>
                                Navigator.of(context).pop(false),
                            child: Text('취소'),
                          ),
                          if (canCheck)
                            TextButton(
                              onPressed: () =>
                                  Navigator.of(context).pop(true),
                              child: Text('출근하기'),
                            ),
                        ],
                      );
                    },
                  );
                },
                child: Text('출근하기!'),
              ),
            ],
          ),
        ),
      ],
    );
  }



  AppBar renderAppBar() {
    // AppBar를 구현하는 함수
    return AppBar(
      title: Text(
        '오늘도 출근',
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w700),
      ),
      backgroundColor: Colors.white,
    );
  }

  Future<String> checkPermission() async {
    // 위치 서비스 활성화여부 확인
    final isLocationEnabled = await Geolocator.isLocationServiceEnabled();

    // 위치 서비스 활성화 안 됨
    if (!isLocationEnabled) return '위치 서비스를 활성화해주세요.';

    // 위치 권한 확인
    LocationPermission checkedPermission = await Geolocator.checkPermission();
    // 위치 권한 거절됨
    if (checkedPermission == LocationPermission.denied) {
      // 위치 권한 요청하기
      checkedPermission = await Geolocator.requestPermission();

      if (checkedPermission == LocationPermission.denied) {
        return '위치 권한을 허가해주세요.';
      }
    }

    // 위치 권한 거절됨 (앱에서 재요청 불가)
    if (checkedPermission == LocationPermission.deniedForever) {
      return '앱의 위치 권한을 설정에서 허가해주세요.';
    }

    // 위 모든 조건이 통과되면 위치 권한 허가완료
    return '위치 권한이 허가 되었습니다.';
  }
}
