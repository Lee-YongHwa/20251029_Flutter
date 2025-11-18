import 'package:drift/drift.dart';

// drift를 통해서 테이블 자동으로 생성:: ORM방식
class Schedules extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get content => text()();
  DateTimeColumn get date => dateTime()();
  IntColumn get startTime => integer()();
  IntColumn get endTime => integer()();
}