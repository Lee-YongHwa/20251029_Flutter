import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  DateTime now = DateTime.now();
  print('현재 날짜 및 시간: $now');
  print("해당 월: ${now.month}");
  print(getDateTime(now));

  DateTime specificDate = DateTime(2025, 12, 24, 1, 1, 1);
  print('특정 날짜 지정: $specificDate');
  print('특정 날짜 지정: ${specificDate.minute}');

  print(getDate(specificDate));
  print(getMonthKor(now));
  print(getMonthEng(now));
  print(getMonthEng(now, true));

  /*
  intl 패키시 설치 방법 pubspec.yaml에
  dependencies:
    intl: ^0.20.2
  추가한 후 pub get, pub upgrade, pub outdated 클릭 할 것
  */

  // 날짜 포맷 함수 제공
  String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
  print(formattedDate);

  // 영어로 월 출력: 숫자가 아닌 "April" 같은 문자열로 출력
  String monthName = DateFormat.MMMM('en_US').format(now);
  print('Month: ${monthName}');

  // 우리말 월 출력: 1월,...
  // initializeDateFormatting()을 호출하지 않으면 다국어 날짜 포맷이 작동하지 않음
  // import 'package:intl/date_symbol_data_local.dart'; 추가 필요
  // await initializeDateFormatting();을 호출해야 해결됨
  await initializeDateFormatting();
  String monthNameKR = DateFormat.MMM('ko_KR').format(now);
  print('월: ${monthNameKR}');

  // 날짜 더하기
  DateTime futureDate = now.add(Duration(days: 10));
  print("10일 후: ${getDateTime(futureDate)}");
  // 날짜 빼기
  DateTime pastDate = now.subtract(Duration(days: 10));
  print("10일 전: ${getDateTime(pastDate)}");
  // 해당월 마지막 일자 구하기
  print("마지막 일: ${getDate(DateTime(2025,3,1).subtract(Duration(days: 1)))}");
  // 날짜 비교
  DateTime date1 = DateTime(2025, 11, 1);
  DateTime date2 = DateTime(2025, 11, 15);
  print(date1.isBefore(date2)); // true (date1이 date2보다 이전인지)
  print(date1.isAfter(date2));  // false (date1이 date2보다 이후인지)
  print(date1.isAtSameMomentAs(date2)); // false (두 날짜가 같은지)
}


String getDate(DateTime dt) {
  return '${dt.year}-${d2(dt.month)}-${d2(dt.day)}';
}

String getTime(DateTime dt) {
  return '${d2(dt.hour)}-${d2(dt.minute)}-${d2(dt.second)}';
}

String getDateTime(DateTime dt) {
  return '${getDate(dt)} ${getTime(dt)}';
}

String d2(int val) {
  return val < 10 ? "0" + val.toString() : val.toString();
}

String getMonthEng(DateTime dt, [bool exp = false]) {
  List<String> months;
  if (exp == false) {
    months = [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
  } else {
    months = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
  }
  return months[dt.month];
}

String getMonthKor(DateTime dt) {
  List<String> months = [
    '',
    '1월',
    '2월',
    '3월',
    '4월',
    '5월',
    '6월',
    '7월',
    '8월',
    '9월',
    '10월',
    '11월',
    '12월',
  ];
  return months[dt.month];
}
