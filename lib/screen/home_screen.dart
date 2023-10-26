import 'package:calendar_scheduler/component/schedule_bottom_sheet.dart';
import 'package:calendar_scheduler/component/main_calendar.dart';
import 'package:calendar_scheduler/component/schedule_card.dart';
import 'package:calendar_scheduler/component/today_banner.dart';
import 'package:calendar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton( // 새 일정을 등록하기 위한 버튼
        backgroundColor: PRIMARY_COLOR,
        onPressed: () {
          showModalBottomSheet( // Bottom Sheet 열기
            context: context,
            isDismissible: true,  // 배경을 탭했을 때 BottomSheet 닫기
            builder: (_) => ScheduleBottomSheet(),
            isScrollControlled: true,
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: SafeArea(     // 시스템 UI를 피해서 UI 구현
        child: Column(    // 달력과 리스트를 세로로 배치
          children: [
            MainCalendar(
              selectedDate: selectedDate,
              onDaySelected: onDaySelected,
            ),
            SizedBox(height: 8.0),
            TodayBanner(
                selectedDate: selectedDate,
                count: 0
            ),
            ScheduleCard(
                startTime: 12,
                endTime: 14,
                content: '플러터 스터디'
            ),
          ],
        ),
      )
    );
  }

  void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDate = selectedDate;
    });
  }
}