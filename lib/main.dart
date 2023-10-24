import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        // TableCalendar 위젯
        body: TableCalendar(
          // 포커스된 날짜
          focusedDay: DateTime.now(),

          // 달력의 가장 첫번째 날짜
          firstDay: DateTime(1900, 1, 1),

          // 달력의 제일 마지막 날짜
          lastDay: DateTime(2999, 12, 31),

          // 선택된 날짜를 인식 하는 함수
          selecteDayPredicate: (DateTime day) {
            final now = DateTime.now();
            return DateTime(day.year, day.month, day.day).isAtSameMomentAs(
              DateTime(now.year, now.month, now.day),
            );
          },

          // 날짜가 선택됐을 때 실행할 함수
          onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
          },

          // 날짜 페이지가 변경됐을 때 실행할 함수
          onPageChanged: (DateTime focusedDay){
          },

          // 기간 선택 모드
          rangeSelectedMode: RangeSelectionMode.toggleOff,

          // 기간이 선택됐을 때 실행할 함수
          onRangeSelected: (DateTime? start, DateTime? end, DateTime focusedDay) {
          },

        ),
      ),
    )
  )
}