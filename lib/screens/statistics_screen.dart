import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:morning_routine/widgets/bottom_bar.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar('statistics'),
      body: Container(
        child: SafeArea(
          child: SfCalendar(
            view: CalendarView.month,
          ),
        ),
      ),
    );
  }
}
